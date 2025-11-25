// **** PicoRv32 & Spike co-simulation testbench *** *//

// **** Pre-requisite **** //
1. Install icarus verilog(Iverilog)
  &> sudo apt install -y autoconf gperf make gcc g++ bison flex
  &> git clone https://github.com/steveicarus/iverilog
  &> cd iverilog
  &> sh autoconf.sh
  &> ./configure
  &> make
  &> sudo make install

2. Install verilator
  &> sudo apt-get install git make autoconf g++ flex bison libfl-dev
  &> git clone https://github.com/verilator/verilator
  &> cd verilator
  &> autoconf
  &> ./configure
  &> make
  &> sudo make install

// **** Process **** //
  1. git clone https://github.com/jonghyeok00/spike_cosim.git
  2. source env.sh
     - Must set the below variable for right path.
       **export RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX=/opt/riscv**
  3. make sim
     - Spike C++(spike_dpi.cc) compilation in verilog testbench(testbench.v)
     - Run simulation and check the log results.





// 2025/11/25 내용
1. Makefile 중 libspikeso 의 #215, 216 라인 확인.
   여기 본인 spike 다운로드 경로를 잘 기입할 것.

2. 본인 htif.cc 와 htif.h 경로에 function 추가가 필요함.
	2-1) /home/jhpark/works/cis/riscv-isa-sim/riscv/fesvr/htif.cc
	빈공간에 아래 코드(htif_t::step_once()) 함수를 추가할 것

/***********************************************************/

void htif_t::step_once() {
	uint64_t tohost_val = 0;
  
  auto enq_func = [](std::queue<reg_t>* q, uint64_t x) { q->push(x); };
	std::queue<reg_t> fromhost_queue;
	std::function<void(reg_t)> fromhost_callback =
    std::bind(enq_func, &fromhost_queue, std::placeholders::_1);

	// (A) read tohost
	try {
		if (tohost_addr) {
			tohost_val = from_target(mem.read_uint64(tohost_addr));
			if (tohost_val != 0)
			mem.write_uint64(tohost_addr, target_endian<uint64_t>::zero);
    		//fprintf(stderr, "[PJH_DEBUG] tp1");
		}
	} catch (mem_trap_t& t) {
		bad_address("accessing tohost", t.get_tval());
	}

	// (B) command / idle
	try {
		if (tohost_val != 0) {
			command_t cmd(mem, tohost_val, fromhost_callback);
			device_list.handle_command(cmd);
    		//fprintf(stderr, "[PJH_DEBUG] tp2");
		}
		else {
			idle();
    		//fprintf(stderr, "[PJH_DEBUG] idle");
		}

		device_list.tick();
    	//fprintf(stderr, "[PJH_DEBUG] tp3");

		if (!fromhost_queue.empty() && !mem.read_uint64(fromhost_addr)) {
			mem.write_uint64(fromhost_addr, to_target(fromhost_queue.front()));
			fromhost_queue.pop();
    		//fprintf(stderr, "[PJH_DEBUG] tp4");
		}

	} catch (mem_trap_t& t) {
		std::stringstream tohost_hex;
		tohost_hex << std::hex << tohost_val;
		bad_address("host was accessing memory on behalf of target (tohost = 0x" + tohost_hex.str() + ")", t.get_tval());
	}
}
/***********************************************************


	2-2) /home/jhpark/works/cis/riscv-isa-sim/riscv/fesvr/htif.h
	public: 아래 공간에 아래 코드 추가(protected: 에 넣으면 안됨)
      
	   void step_once();


	2-3) /home/jhpark/works/cis/riscv-isa-sim/riscv/riscv/sim.h
	
	   private 에 있는 void step(size_t n); // step through simulation
	   을 주석 처리 후,
	   public 으로 옮길 것.


	2-4) /home/jhpark/works/cis/riscv-isa-sim/riscv/riscv/sim.h

	   전:
	 	static const size_t IㅑNTERLEAVE = 5000; 
		static const size_t INSNS_PER_RTC_TICK = 100;

       후: 둘다 값을 1 로 바꿀 것
	 	static const size_t IㅑNTERLEAVE = 1; 
		static const size_t INSNS_PER_RTC_TICK = 1;


3. source env.sh 후, make all 을 통해 시뮬레이션 실행

	dump/spike_dump.log : 내가 원하는 step 만큼 PC, instruction 뽑히도록 함.
	dump/spike_trace_all_by_API.log : 이건 우리가 API로 돌린 것에 대한 모든 log 가 뜸(spike 의 --log-comit 과 비슷한 함수)

	현재 엉성하지만 top/testbench.v 의 #358 라인부터 보면서 확인 한번 ㄱㄱ


