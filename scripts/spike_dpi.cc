/////////#include "spike_main.h" // spike 내부 헤더 (또는 직접 정의)
#include <string>
#include <stdint.h>
#include <iostream>

/* ============== Spike C++ Class Definition =============== */
#include "sim.h"
#include "cfg.h"
#include "processor.h"
#include "memif.h"
#include "elfloader.h"
#include "elf.h"
#include "htif.h"
#include "common.h"
#include "mmu.h"
#include "decode.h"
#include <vector>
#include <string>
/* ========================================================= */

#ifdef VPI_WRAPPER
    #include "vpi_user.h"
#elif DPI_WRAPPER
    #include "svdpi.h"
#endif

// Spike Instance Pointer
static sim_t* spike_sim_instance = nullptr;
static processor_t* spike_cpu_instance = nullptr;
static cfg_t* spike_cfg_instance = nullptr;
static htif_t* spike_htif_instance = nullptr;


static void bad_address(const std::string& situation, reg_t addr)
{
  std::cerr << "Access exception occurred while " << situation << ":\n";
  std::cerr << "Memory address 0x" << std::hex << addr << " is invalid\n";
  exit(-1);
}


static void run_step(size_t steps) {
        uint64_t tohost;

        auto enq_func = [](std::queue<reg_t>* q, uint64_t x) { q->push(x); };
        std::queue<reg_t> fromhost_queue;
        std::function<void(reg_t)> fromhost_callback =
        	std::bind(enq_func, &fromhost_queue, std::placeholders::_1);
            
        try {
        	//vpi_printf("[DEBUG] $spike_init : get_tohost_addr %lx\n", (spike_sim_instance->get_tohost_addr()));
            //vpi_printf("[DEBUG] $spike_init : get_fromhost_addr %lx\n", (spike_sim_instance->get_fromhost_addr()));
            if ((tohost = spike_sim_instance->from_target(spike_sim_instance->memif().read_uint64(spike_sim_instance->get_tohost_addr()))) != 0)
            	//vpi_printf("[DEBUG] $spike_init : tohost %lx\n", tohost);
                spike_sim_instance->memif().write_uint64(spike_sim_instance->get_tohost_addr(), target_endian<uint64_t>::zero);
            } catch (mem_trap_t& t) {
            	vpi_printf("[VPI ERROR] $spike_init : First try; TOHOST_ADDR: %lx\n", spike_sim_instance->get_tohost_addr());
            	vpi_printf("[VPI ERROR] $spike_init : First try error\n");
            	bad_address("accessing tohost", t.get_tval());
        }

        try {
        	if (tohost != 0) {
            	command_t cmd(spike_sim_instance->memif(), tohost, fromhost_callback);
                //vpi_printf("[DEBUG_NOT0] $spike_init : tohost %lx\n", tohost);
                spike_sim_instance->get_device_list().handle_command(cmd);
            } else {
            	spike_sim_instance->step(steps);
            }
            
			spike_sim_instance->get_device_list().tick();
            //vpi_printf("[DEBUG_STEP] $spike_init : tohost %lx\n", tohost);
        } catch (mem_trap_t& t) {
        	std::stringstream tohost_hex;
            tohost_hex << std::hex << tohost;
        	vpi_printf("[VPI ERROR] $spike_init : Second try error\n");
        	exit(-1);
        } 
        
		try {
        	if (!fromhost_queue.empty() && !spike_sim_instance->memif().read_uint64(spike_sim_instance->get_fromhost_addr())){
            	spike_sim_instance->memif().write_uint64(spike_sim_instance->get_fromhost_addr(), spike_sim_instance->to_target(fromhost_queue.front()));
                fromhost_queue.pop();
            }
        } catch (mem_trap_t& t) {
        	vpi_printf("[VPI ERROR] $spike_init : Third try error\n");
            exit(-3);
        }
}




extern "C" {
#ifdef VPI_WRAPPER
	// ---------- VPI: $spike_init(elf_path_str) ----------
  	// Task: Initialize simulator and Load ELF file.
    PLI_INT32 spike_init_vpi_calltf(PLI_BYTE8 *user_data) {
        vpiHandle systf_handle, arg_iterator, arg_handle;
        s_vpi_value arg_value;

        systf_handle = vpi_handle(vpiSysTfCall, NULL);
        arg_iterator = vpi_iterate(vpiArgument, systf_handle);

        if (!arg_iterator) {
			vpi_printf("[VPI ERROR] $spike_init: invalid handle.\n");
            return 1;
        }

        arg_handle = vpi_scan(arg_iterator);

        arg_value.format = vpiStringVal;
		vpi_get_value(arg_handle, &arg_value);
        
        std::string elf_path = arg_value.value.str;

        vpi_free_object(arg_iterator);

        if (spike_sim_instance) {
            delete spike_sim_instance;
            spike_sim_instance = nullptr;
            spike_cpu_instance = nullptr;
            if (spike_cfg_instance) {
                delete spike_cfg_instance;
                spike_cfg_instance = nullptr;
            }
        }


        try {
            spike_cfg_instance = new cfg_t();
			spike_cfg_instance->isa = "RV32IMC";
            //spike_cfg_instance->hartids.push_back(0);
            spike_cfg_instance->bootargs = nullptr;
			spike_cfg_instance->priv = DEFAULT_PRIV;
			spike_cfg_instance->real_time_clint = false;
			spike_cfg_instance->endianness = endianness_little;
       
    		std::vector<size_t> default_hartids;
    		default_hartids.reserve(spike_cfg_instance->nprocs());
    		for (size_t i = 0; i < spike_cfg_instance->nprocs(); ++i) {
      			default_hartids.push_back(i);
    		}
    		spike_cfg_instance->hartids = default_hartids;


			// Memory Layout
			std::vector<std::pair<reg_t, abstract_mem_t*>> mems_instance;
			mems_instance.push_back({0x80000000, new mem_t(128 * 1024 * 1024)}); // {base address, memory size}


            std::vector<device_factory_sargs_t> plugin_device_factories_dummy;
			debug_module_config_t dm_config;
			const char *log_path_dummy = nullptr;
            bool dtb_enabled_dummy = true; //TODO
            const char *dtb_file_dummy = nullptr;
            bool socket_enabled_dummy = false; //TODO
            FILE *cmd_file_dummy = nullptr;
            std::optional<unsigned long long> instruction_limit_dummy;

            std::vector<std::string> args_vec;
            args_vec.push_back("/opt/riscv/riscv32-unknown-elf/bin/pk");
            args_vec.push_back(elf_path);
            
			// --- sim_t 인스턴스 생성 ---
            spike_sim_instance = new sim_t(
                spike_cfg_instance,         	// const cfg_t *cfg
                false,                      	// bool halted 
                mems_instance,                 	// std::vector<std::pair<reg_t, abstract_mem_t*>> mems
                plugin_device_factories_dummy, 	// const std::vector<device_factory_sargs_t>& plugin_device_factories
                args_vec,                   	// const std::vector<std::string>& args
                dm_config,                  	// const debug_module_config_t &dm_config
                log_path_dummy,             	// const char *log_path
                dtb_enabled_dummy,          	// bool dtb_enabled
                dtb_file_dummy,             	// const char *dtb_file
                socket_enabled_dummy,       	// bool socket_enabled
                cmd_file_dummy,             	// FILE *cmd_file
				std::nullopt
                //instruction_limit_dummy     // std::optional<unsigned long long> instruction_limit
            );


			spike_sim_instance->set_debug(false); // spike debug mode
            spike_cpu_instance = spike_sim_instance->get_core(0);
			spike_sim_instance->get_core(0)->reset();
			if (!spike_cpu_instance) {
                vpi_printf("[VPI ERROR] $spike_init: fail to get cpu instance.\n");
                if (spike_sim_instance) { delete spike_sim_instance; spike_sim_instance = nullptr; }
                if (spike_cfg_instance) { delete spike_cfg_instance; spike_cfg_instance = nullptr; }
                return 1;
            }

			// Check elf_path
			std::ifstream elf_file_chk(elf_path, std::ios::ate | std::ios::binary);
			if (!elf_file_chk.is_open()) {
				std::cerr << "[VPI ERROR] $spike_init - ELF can't not be opend: " << elf_path << std::endl;
				return 1;
			}
			else {
            	std::cout << "[VPI INFO] $spike_init - ELF load success(" << elf_path << ")" << std::endl;
            	//std::cout << "[VPI INFO] $spike_init - Entry point = 0x" << std::hex << entry << std::endl; // 0x%lx
				//return elf_file_chk.tellg();
			}
        } catch (const std::exception& e) {
            vpi_printf("[VPI ERROR] $spike_init: exception happens %s\n", e.what());
            if (spike_sim_instance) { delete spike_sim_instance; spike_sim_instance = nullptr; }
            if (spike_cfg_instance) { delete spike_cfg_instance; spike_cfg_instance = nullptr; }
            return 1;
        }

        spike_sim_instance->htif_t::set_expected_xlen(spike_sim_instance->get_core(0)->get_isa().get_max_xlen());
       	// spike_sim_instance->set_procs_debug(true);
	    spike_sim_instance->start();

        if ((spike_sim_instance->get_tohost_addr()) == 0) {
            while (!spike_sim_instance->should_exit()){
              spike_sim_instance->idle();
              vpi_printf("[DEBUG0] $spike_init : tohost_addr %lx\n", (spike_sim_instance->get_tohost_addr()));
              vpi_printf("[DEBUG0] $spike_init : fromhost_addr %lx\n", (spike_sim_instance->get_fromhost_addr()));
            }
        }       

		return 0;
	}


  	/* TODO
	// ---------- VPI: $spike_init(elf_path, pk_path, target_isa) ------------
  	// Task: Initialize simulator. Load ELF file path. PK path, target_isa
    PLI_INT32 spike_init_vpi_calltf(PLI_BYTE8 *user_data) {
    	std::string pk_path;
    	std::string elf_path;
    	std::string target_isa;


	    vpiHandle call_handle = vpi_handle(vpiSysTfCall, NULL);
	    vpiHandle arg_iterator = vpi_iterate(vpiArgument, call_handle);
	
	    s_vpi_value arg_val;
	
	    // 1. ELF_PATH
	    vpiHandle elf_path_arg = vpi_scan(arg_iterator);
		arg_val.format = vpiStringVal;
	    vpi_get_value(elf_path_arg, &arg_val);
	    if (arg_val.format != vpiStringVal) {
	        vpi_printf("[VPI_ERROR] $spike_init: First argument must be a string (ELF_PATH).\n");
	        vpi_free_object(arg_iterator);
	        return 1;
	    }
		elf_path = arg_val.value.str;
	    vpi_printf("[VPI] Configured ELF Path: %s\n", elf_path.c_str());

		
	    // 2. PK_PATH
	    vpiHandle pk_path_arg = vpi_scan(arg_iterator);
		arg_val.format = vpiStringVal;
	    vpi_get_value(pk_path_arg, &arg_val);
	    if (arg_val.format != vpiStringVal) {
	        vpi_printf("[VPI_ERROR] $spike_init: Second argument must be a string (PK_PATH).\n");
	        vpi_free_object(arg_iterator);
	        return 1;
	    }
		pk_path = arg_val.value.str;
	    vpi_printf("[VPI] Configured PK Path: %s\n", pk_path);
	
	    // 3. TARGET_ISA
	    vpiHandle target_isa_arg = vpi_scan(arg_iterator);
		arg_val.format = vpiStringVal;
	    vpi_get_value(target_isa_arg, &arg_val);
	    if (arg_val.format != vpiStringVal) {
	        vpi_printf("[VPI_ERROR] $spike_init: Third argument must be a string (TARGET_ISA).\n");
	        vpi_free_object(arg_iterator);
	        return 1;
	    }
		target_isa = arg_val.value.str;
	    vpi_printf("[VPI] Configured Target ISA: %s\n", target_isa.c_str());
		

        vpi_free_object(arg_iterator);

        if (spike_sim_instance) {
            vpi_printf("[VPI WARN] Spike simulator has already initiated. The existed instance objects will be deleted.\n");
            delete spike_sim_instance;
            spike_sim_instance = nullptr;
            spike_cpu_instance = nullptr;
            if (spike_cfg_instance) {
                delete spike_cfg_instance;
                spike_cfg_instance = nullptr;
            }
        }


        try {
            spike_cfg_instance = new cfg_t();
			spike_cfg_instance->isa = "rv32IMC";
			//spike_cfg_instance->isa = target_isa.c_str();
            spike_cfg_instance->hartids.push_back(0);
            spike_cfg_instance->bootargs = nullptr;
			spike_cfg_instance->priv = DEFAULT_PRIV;
			spike_cfg_instance->real_time_clint = false;
			spike_cfg_instance->endianness = endianness_little;
       
    		std::vector<size_t> default_hartids;
    		default_hartids.reserve(spike_cfg_instance->nprocs());
    		for (size_t i = 0; i < spike_cfg_instance->nprocs(); ++i) {
      			default_hartids.push_back(i);
    		}
    		spike_cfg_instance->hartids = default_hartids;


			// Memory Layout
			std::vector<std::pair<reg_t, abstract_mem_t*>> mems_instance; // = make_mems(spike_cfg_instance->mem_layout);
			mems_instance.push_back({0x80000000, new mem_t(128 * 1024 * 1024)}); // {base address, memory size}


            std::vector<device_factory_sargs_t> plugin_device_factories_dummy;
            debug_module_config_t dm_config;
			const char *log_path_dummy = "dump/spike_trace_all_by_API.log"; // nullptr;
            bool dtb_enabled_dummy = true;
            const char *dtb_file_dummy = nullptr;
            bool socket_enabled_dummy = false;
            FILE *cmd_file_dummy = nullptr;
            std::optional<unsigned long long> instruction_limit_dummy;

            std::vector<std::string> args_vec;
            //args_vec.push_back("spike");
			//args_vec.push_back("--isa=rv32i");
            args_vec.push_back("/opt/riscv/riscv32-unknown-elf/bin/pk");
            //args_vec.push_back(pk_path);
            args_vec.push_back(elf_path);
            args_vec.push_back("--verbose");
            
			// --- sim_t 인스턴스 생성 ---
            spike_sim_instance = new sim_t(
                spike_cfg_instance,         // const cfg_t *cfg
                false,                      // bool halted (초기에는 실행 상태)
                mems_instance,                 		// std::vector<std::pair<reg_t, abstract_mem_t*>> mems
                plugin_device_factories_dummy, // const std::vector<device_factory_sargs_t>& plugin_device_factories
                args_vec,                   // const std::vector<std::string>& args
                dm_config,                  // const debug_module_config_t &dm_config (실제 dm_config 객체를 전달)
                log_path_dummy,             // const char *log_path
                dtb_enabled_dummy,          // bool dtb_enabled
                dtb_file_dummy,             // const char *dtb_file
                socket_enabled_dummy,       // bool socket_enabled
                cmd_file_dummy,             // FILE *cmd_file
				std::nullopt
                //instruction_limit_dummy     // std::optional<unsigned long long> instruction_limit
            );

            // --- processor_t 인스턴스 가져오기 ---
			spike_sim_instance->set_debug(false); // spike debug mode
            spike_cpu_instance = spike_sim_instance->get_core(0);
			spike_sim_instance->get_core(0)->reset();
			
			spike_cpu_instance->enable_log_commits();
           
			if (!spike_cpu_instance) {
                vpi_printf("[VPI ERROR] $spike_init: CPU 코어 인스턴스를 가져오지 못했습니다. Spike 초기화 실패.\n");
                if (spike_sim_instance) { delete spike_sim_instance; spike_sim_instance = nullptr; }
                if (spike_cfg_instance) { delete spike_cfg_instance; spike_cfg_instance = nullptr; }
                return 1; // 실패 반환
            }

			//reg_t entry = 0;
			//memif_t memif(spike_sim_instance);
			//load_elf(elf_path, &memif, &entry, 0, 32); //TODO
			//spike_cpu_instance->get_state()->pc = entry;

			// Check elf_path
			std::ifstream elf_file_chk(elf_path, std::ios::ate | std::ios::binary);
			if (!elf_file_chk.is_open()) {
				std::cerr << "[VPI ERROR] $spike_init - ELF can't not be opend: " << elf_path << std::endl;
				return 1;
			}
			else {
            	std::cout << "[VPI INFO] $spike_init - ELF load success(" << elf_path << ")" << std::endl;
            	//std::cout << "[VPI INFO] $spike_init - Entry point = 0x" << std::hex << entry << std::endl; // 0x%lx
				//return elf_file_chk.tellg();
			}
        } catch (const std::exception& e) {
            vpi_printf("[VPI ERROR] $spike_init: Spike sim_t 생성 중 예외 발생: %s\n", e.what());
            if (spike_sim_instance) { delete spike_sim_instance; spike_sim_instance = nullptr; }
            if (spike_cfg_instance) { delete spike_cfg_instance; spike_cfg_instance = nullptr; }
            return 1;
        } 

        spike_sim_instance->htif_t::set_expected_xlen(spike_sim_instance->get_core(0)->get_isa().get_max_xlen());
        //spike_sim_instance->set_procs_debug(true);
		spike_sim_instance->start();

 
        if (spike_sim_instance->get_tohost_addr() == 0) {
            while (!spike_sim_instance->should_exit()){
              spike_sim_instance->idle();
              vpi_printf("[DEBUG0] $spike_init : tohost_addr %lx\n", (spike_sim_instance->get_tohost_addr()));
              vpi_printf("[DEBUG0] $spike_init : fromhost_addr %lx\n", (spike_sim_instance->get_fromhost_addr()));
            }
        }       


        return 0; // 성공 반환
    }

	*/

	// ---------- VPI: $spike_run_steps(N) ----------
	// Task: run N steps (instructions)
	PLI_INT32 spike_run_steps_vpi_calltf(PLI_BYTE8* user_data) {
		vpiHandle systf_handle = vpi_handle(vpiSysTfCall, NULL);
		if (!systf_handle) {
			vpi_printf("[VPI ERROR] $spike_run_steps: invalid handle.\n");
			return 1;
		}

		// extract integer argument
		vpiHandle args_iter = vpi_iterate(vpiArgument, systf_handle);
		if (!args_iter) {
			vpi_printf("[VPI ERROR] $spike_run_steps: requires integer step count\n");
			return 1;
		}
		vpiHandle arg = vpi_scan(args_iter);
		s_vpi_value arg_val;
		arg_val.format = vpiIntVal;
		vpi_get_value(arg, &arg_val);
		int steps = arg_val.value.integer;
		vpi_free_object(args_iter);

		if (!spike_sim_instance || !spike_cpu_instance) {
			vpi_printf("[VPI ERROR] $spike_run_steps: spike not initialized\n");
			return 1;
		}

		if (steps <= 0) {
			vpi_printf("[VPI WARN] $spike_run_steps: non-positive steps (%d) ignored\n", steps);
			return 1;
		}

		// Run steps: call cpu->step repeatedly (many Spike versions accept step(1))
		run_step(steps);
		/*
		spike_sim_instance->step(steps);
		if (!spike_sim_instance) {
			vpi_printf("[VPI ERROR] $spike_run_steps: spike not initialized\n");
		}
		else {
			spike_sim_instance->step_once();
		}
		
		vpi_printf("[VPI_INFO] $spike_run_steps: ran %d step(s)\n", steps);
		*/

		
		return 0;
	}


	PLI_INT32 spike_get_pc_vpi_calltf(PLI_BYTE8* user_data) {
	    vpiHandle tf_call_h;
	    vpiHandle arg_itr_h;
	    vpiHandle arg_h;
	    s_vpi_value arg_value;
	
	    tf_call_h = vpi_handle(vpiSysTfCall, NULL);
	    if (!tf_call_h) {
	        vpi_printf("[VPI_ERROR] $spike_get_pc: Failed to get task call handle.\n");
	        return 1;
	    }
	
	    arg_itr_h = vpi_iterate(vpiArgument, tf_call_h);
	    if (!arg_itr_h) {
	        vpi_printf("[VPI_ERROR] $spike_get_pc: No arguments provided to $spike_get_pc. Expected one argument.\n");
	        return 1;
	    }
	
	    arg_h = vpi_scan(arg_itr_h);
	    if (!arg_h) {
	        vpi_printf("[VPI_ERROR] $spike_get_pc: Failed to get the first argument handle.\n");
	        vpi_free_object(arg_itr_h);
			return 1;
	    }
	
	    if (!spike_sim_instance || !spike_cpu_instance) {
	        vpi_printf("[VPI_ERROR] $spike_get_pc: Spike not initialized.\n");
	        vpi_free_object(arg_itr_h);
	        return 1;
	    }
	
	    uint32_t pc = (uint32_t)spike_cpu_instance->get_state()->pc;
	    //vpi_printf("[VPI_INFO] PC = 0x%08x\n", pc);
	
	    arg_value.format = vpiIntVal;
		arg_value.value.integer = (PLI_INT32)pc;
	    vpi_put_value(arg_h, &arg_value, NULL, vpiNoDelay);
	
	    vpi_free_object(arg_itr_h);
	
	    return 0;
	}
	
	
	// $spike_get_instr
	PLI_INT32 spike_get_instr_vpi_calltf(PLI_BYTE8* user_data) {
	    vpiHandle tf_call_h;
	    vpiHandle arg_itr_h;
	    vpiHandle pc_arg_h;
		vpiHandle insn_arg_h;
		s_vpi_value arg_value;
	    
		uint32_t target_pc = 0; 
	    uint32_t encoded_instruction = 0;
	
	    tf_call_h = vpi_handle(vpiSysTfCall, NULL);
	    if (!tf_call_h) {
	        vpi_printf("[VPI_ERROR] $spike_get_instr: Failed to get task call handle.\n");
	        return 1;
	    }
	
	    arg_itr_h = vpi_iterate(vpiArgument, tf_call_h);
	    if (!arg_itr_h) {
	        vpi_printf("[VPI_ERROR] $spike_get_instr: No arguments provided. Expected two arguments (PC, instruction_output).\n");
	        return 1;
	    }
	
	    pc_arg_h = vpi_scan(arg_itr_h);
	    if (!pc_arg_h) {
	        vpi_printf("[VPI_ERROR] $spike_get_instr: Failed to get the first argument (PC address).\n");
	        vpi_free_object(arg_itr_h);
	        return 1;
	    }
	
	    insn_arg_h = vpi_scan(arg_itr_h);
	    if (!insn_arg_h) {
	        vpi_printf("[VPI_ERROR] $spike_get_instr: Failed to get the second argument (encoded_instruction output).\n");
	        vpi_free_object(arg_itr_h);
	        return 1;
	    }
	
	    if (!spike_cpu_instance) {
	        vpi_printf("[VPI_ERROR] $spike_get_instr: Spike CPU instance not initialized.\n");
	        vpi_free_object(arg_itr_h);
	        return 1;
	    }
	
	    arg_value.format = vpiIntVal;
	    vpi_get_value(pc_arg_h, &arg_value);
	    target_pc = (reg_t)arg_value.value.integer;
	
	    //vpi_printf("[VPI_INFO] Requesting instruction at PC = 0x%08x\n", target_pc);
	
	    try {
	        mmu_t* mmu = spike_cpu_instance->get_mmu();
			
	        if (mmu) {
			  	insn_fetch_t fetched_insn_obj = mmu -> load_insn(target_pc);
	            encoded_instruction = fetched_insn_obj.insn.bits();
	            //vpi_printf("[VPI_INFO] 			PC = 0x%08x -> Fetched instruction: 0x%08x\n", target_pc, encoded_instruction);
	        } else {
	            vpi_printf("[VPI_ERROR] $spike_get_instr: Failed to get MMU from Spike CPU instance.\n");
	            vpi_free_object(arg_itr_h);
	            return 1;
	        }
			
	    } catch (trap_t& t) {
	        // Memory access error (Page fault)
	        vpi_printf("[VPI_ERROR] $spike_get_instr: Trap occurred during instruction fetch at 0x%llx (cause: %llu).\n", (long long)target_pc, (long long)t.cause());
	        encoded_instruction = 0xFFFFFFFF; // If error happens, set error code to 0xffffffff
	    }
	
	    arg_value.format = vpiIntVal;
	    arg_value.value.integer = (PLI_INT32)encoded_instruction;
	
	    vpi_put_value(insn_arg_h, &arg_value, NULL, vpiNoDelay);
	
	    vpi_free_object(arg_itr_h);
	
	    return 0;
	}



	// ---------- VPI: $spike_get_reg(idx) ----------
	// Task: Print reigster idx(x0~x31) values
	PLI_INT32 spike_get_reg_vpi_calltf(PLI_BYTE8* user_data) {
		if (!spike_sim_instance || !spike_cpu_instance) {
			vpi_printf("[VPI ERROR] $spike_get_reg: spike not initialized\n");
			return 1;
		}

		vpiHandle systf_handle = vpi_handle(vpiSysTfCall, NULL);
		if (!systf_handle) {
			vpi_printf("[VPI ERROR] $spike_get_reg: invalid handle\n");
			return 1;
		}

		vpiHandle args_iter = vpi_iterate(vpiArgument, systf_handle);
		if (!args_iter) {
			vpi_printf("[VPI ERROR] $spike_get_reg: missing reg index argument\n");
			return 1;
		}

		vpiHandle arg = vpi_scan(args_iter);
		s_vpi_value val;
		val.format = vpiIntVal;
		vpi_get_value(arg, &val);
		int idx = val.value.integer;
		vpi_free_object(args_iter);

		if (idx < 0 || idx >= 32) {
			vpi_printf("[VPI ERROR] $spike_get_reg: invalid reg index %d\n", idx);
			return 1;
		}

        uint32_t reg_val = (uint32_t)spike_cpu_instance->get_state()->XPR[idx];
		vpi_printf("[VPI_INFO] reg idx(x%d) = 0x%08x\n", idx, reg_val);

		return 0;
	}


    // VPI Clean-up when simulation is finished
	PLI_INT32 cleanup_spike_vpi(p_cb_data cb_data_p) {
        if (spike_sim_instance) {
            delete spike_sim_instance;
            spike_sim_instance = nullptr;
            spike_cpu_instance = nullptr;
            std::cout << "[VPI_INFO] Spike simulator object cleaned up." << std::endl;
        }
        return 0;
    }

    void register_spike_vpi_tasks() {
        // Task 1: $spike_init
        s_vpi_systf_data tf_data_init;
        tf_data_init.type = vpiSysTask;
        tf_data_init.sysfunctype = 0;
        tf_data_init.calltf = spike_init_vpi_calltf;
        tf_data_init.compiletf = NULL;
        tf_data_init.sizetf = NULL;
        tf_data_init.user_data = NULL;
        tf_data_init.tfname = "$spike_init";
        vpi_register_systf(&tf_data_init);

        // Task 2: $spike_run_steps
        s_vpi_systf_data tf_data_run;
        tf_data_run.type = vpiSysTask;
        tf_data_run.sysfunctype = 0;
        tf_data_run.calltf = spike_run_steps_vpi_calltf;
        tf_data_run.compiletf = NULL;
        tf_data_run.sizetf = NULL;
        tf_data_run.user_data = NULL;
        tf_data_run.tfname = "$spike_run_steps";
        vpi_register_systf(&tf_data_run);

		// Task 3: $spike_get_pc
        s_vpi_systf_data tf_data_get_pc;
        tf_data_get_pc.type = vpiSysTask;
        tf_data_get_pc.sysfunctype = 0;
        tf_data_get_pc.calltf = spike_get_pc_vpi_calltf;
        tf_data_get_pc.compiletf = NULL;
		tf_data_get_pc.sizetf = NULL;
		tf_data_get_pc.user_data = NULL;
        tf_data_get_pc.tfname = "$spike_get_pc";
        vpi_register_systf(&tf_data_get_pc);

		// Task 4: $spike_get_instr
        s_vpi_systf_data tf_data_get_instr;
        tf_data_get_instr.type = vpiSysTask;
        tf_data_get_instr.sysfunctype = 0;
        tf_data_get_instr.calltf = spike_get_instr_vpi_calltf;
        tf_data_get_instr.compiletf = NULL;
		tf_data_get_instr.sizetf = NULL;
		tf_data_get_instr.user_data = NULL;
        tf_data_get_instr.tfname = "$spike_get_instr";
        vpi_register_systf(&tf_data_get_instr);

		// Task 5: $spike_get_reg
        s_vpi_systf_data tf_data_get_reg;
        tf_data_get_reg.type = vpiSysTask;
        tf_data_get_reg.sysfunctype = 0;
        tf_data_get_reg.calltf = spike_get_reg_vpi_calltf;
        tf_data_get_reg.compiletf = NULL;
		tf_data_get_reg.sizetf = NULL;
		tf_data_get_reg.user_data = NULL;
        tf_data_get_reg.tfname = "$spike_get_reg";
        vpi_register_systf(&tf_data_get_reg);

		// register callback in the end of simulation
        s_cb_data cb_data_end;
        cb_data_end.reason = cbEndOfSimulation;
        cb_data_end.cb_rtn = cleanup_spike_vpi;
        cb_data_end.obj = NULL;
        cb_data_end.time = NULL;
        cb_data_end.value = NULL;
        cb_data_end.user_data = NULL;
        vpi_register_cb(&cb_data_end);
    }


    void (*vlog_startup_routines[])() = {
        register_spike_vpi_tasks,
        0
    };



#elif DPI_WRAPPER
	
	//TODO) Modify DPI Version later..

    // --- spike_init (DPI-C++ 버전) ---
    // SystemVerilog의 `string` 타입(`input string elf_path_sv`)을
    // C++의 `const char*` 타입(`const char* elf_path_c`)으로 받습니다.
    // DPI 함수는 값을 직접 반환하거나(int func_name(...)) void로 선언할 수 있습니다.
    // 여기서는 성공/실패 여부를 나타내는 int를 반환하도록 하겠습니다.
    int spike_init(const char* elf_path_c) {

        // const char*를 C++ std::string으로 변환하여 사용
        std::string elf_path = elf_path_c;

        if (spike_sim_instance) {
            std::cout << "[DPI WARN] Spike 시뮬레이터가 이미 초기화되었습니다. 재초기화합니다." << std::endl;
            delete spike_sim_instance;
            spike_sim_instance = nullptr;
            spike_cpu_instance = nullptr;
            if (spike_cfg_instance) {
                delete spike_cfg_instance;
                spike_cfg_instance = nullptr;
            }
        }

        // --- cfg_t 객체 생성 및 설정 ---
        spike_cfg_instance = new cfg_t(); // 실제 Spike cfg_t에 맞게 초기화
        spike_cfg_instance->isa = "RV32IMC"; // "RV32IMAC" 등으로 실제 필요한 ISA 설정
        spike_cfg_instance->hartids.push_back(0); // 하트 ID (예: 0번 하트)
        spike_cfg_instance->bootargs = nullptr; // 또는 필요에 따라 "bootargs=..." 설정
        // 실제 Spike cfg_t에는 훨씬 더 많은 멤버들이 있으며, 필요한 경우 여기에 추가 설정

        std::cout << "[DPI] cfg_t 인스턴스 설정 완료. ISA: " 
                  << (spike_cfg_instance->isa ? spike_cfg_instance->isa : "N/A")
                  << ", Harts: " << spike_cfg_instance->nprocs() << std::endl;


        // --- sim_t 생성자에 필요한 인자들 준비 ---
        // (이 부분은 Spike 라이브러리 사용 시 실제 객체들로 채워져야 합니다.)
//        std::vector<std::pair<reg_t, abstract_mem_t*>> mems;
        // 실제 Spike에서는 HTIF(Host-Target Interface)를 통해 메모리 구성을 설정하거나,
        // sim_t 생성자에 직접 mems 인자를 전달해야 할 수 있습니다.
        // 현재 더미 mems는 비어있으므로, 실제 Spike는 제대로 로드하지 못할 수 있습니다.
        // 이 부분은 실제 Spike 연동 시 반드시 수정해야 합니다.

        std::vector<device_factory_sargs_t> plugin_device_factories;
        debug_module_config_t dm_config; // 구조체는 직접 생성
        const char *log_path = nullptr;
        bool dtb_enabled = true;
        const char *dtb_file = nullptr;
        bool socket_enabled = true;
        FILE *cmd_file = nullptr;
        std::optional<unsigned long long> instruction_limit;

        std::vector<std::string> args_vec;
        args_vec.push_back("spike"); // argv[0]는 보통 프로그램 자체 이름
        args_vec.push_back(elf_path); // argv[1]은 실행할 ELF 파일 경로

        // --- sim_t 인스턴스 생성 ---
        try {
            spike_sim_instance = new sim_t(
                spike_cfg_instance,         // const cfg_t *cfg
                false,                      // bool halted (초기에는 실행 상태)
                mems,                       // std::vector<std::pair<reg_t, abstract_mem_t*>> mems
                plugin_device_factories,    // const std::vector<device_factory_sargs_t>& plugin_device_factories
                args_vec,                   // const std::vector<std::string>& args
                dm_config,                  // const debug_module_config_t &dm_config
                log_path,                   // const char *log_path
                dtb_enabled,                // bool dtb_enabled
                dtb_file,                   // const char *dtb_file
                socket_enabled,             // bool socket_enabled
                cmd_file,                   // FILE *cmd_file
                instruction_limit           // std::optional<unsigned long long> instruction_limit
            );
        } catch (const std::exception& e) {
            std::cerr << "[DPI ERROR] Spike sim_t 생성 중 예외 발생: " << e.what() << std::endl;
            // 실패 시 모든 자원 정리
            if (spike_cfg_instance) { delete spike_cfg_instance; spike_cfg_instance = nullptr; }
            return 1; // 실패 반환
        }


        // Spike 초기화 추가 단계 (Spike API에 따라 다름)
        // spike_sim_instance->set_debug(true); // 디버그 모드 설정
        // spike_sim_instance->load_program(elf_path.c_str()); // sim_t 생성자에서 이미 처리될 수도 있음
        // spike_sim_instance->configure(); // 시뮬레이터 구성

        // --- processor_t 인스턴스 가져오기 ---
        // (get_core는 0번 코어를 반환한다고 가정)
        spike_cpu_instance = spike_sim_instance->get_core(0);
        if (!spike_cpu_instance) {
            std::cerr << "[DPI ERROR] Spike processor_t 인스턴스를 가져오지 못했습니다." << std::endl;
            // 실패 시 자원 정리 (sim_t 소멸자에서 processor_t도 정리)
            delete spike_sim_instance; spike_sim_instance = nullptr;
            delete spike_cfg_instance; spike_cfg_instance = nullptr;
            return 1; // 실패 반환
        }

        std::cout << "[DPI] Spike 시뮬레이터 초기화 및 ELF 로드 완료: " << elf_path << std::endl;

        return 0; // 성공 반환
    }


#else
    std::cerr << "[Spike] ERROR: DPI/VPI interface is not defined. Add the option under compiling with g++\n";
#endif

}
