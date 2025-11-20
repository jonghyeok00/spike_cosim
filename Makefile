RISCV_GNU_TOOLCHAIN_GIT_REVISION = 411d134
#####################################################################################
#RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX = /opt/riscv <- TODO) Must refer to env.sh !!
TOOLCHAIN_PREFIX = $(RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX)/bin/riscv32-unknown-elf-
#TB_HOME := $(shell pwd)
#OBJ_DIR = $(TB_HOME)/tests/obj
TEST_DIR = $(TB_HOME)/tests/$(TEST_NAME)



#####################################################################################

# Give the user some easy overrides for local configuration quirks.
# If you change one of these and it breaks, then you get to keep both pieces.
SHELL = bash
PYTHON = python3
VERILATOR = verilator
ICARUS_SUFFIX =
IVERILOG = iverilog$(ICARUS_SUFFIX)
VVP = vvp$(ICARUS_SUFFIX)

TEST_OBJS = $(addsuffix .o,$(basename $(wildcard tests/*.S)))
##TEST_OBJS = start.o pico_test.o

##FIRMWARE_OBJS = firmware/start.o firmware/irq.o firmware/print.o firmware/hello.o firmware/sieve.o firmware/multest.o firmware/stats.o
FIRMWARE_OBJS = firmware/start.o firmware/irq.o firmware/print.o firmware/hello.o firmware/sieve.o firmware/multest.o firmware/stats.o firmware/pico_test.o
##FIRMWARE_OBJS = firmware/start.o firmware/pico_test.o


GCC_WARNS  = -Werror -Wall -Wextra -Wshadow -Wundef -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings
GCC_WARNS += -Wredundant-decls -Wstrict-prototypes -Wmissing-prototypes -pedantic # -Wconversion


COMPRESSED_ISA = C

# Add things like "export http_proxy=... https_proxy=..." here
GIT_ENV = true

test: testbench.vvp firmware/firmware.hex
	$(VVP) -N $<

test_vcd: testbench.vvp firmware/firmware.hex
	$(VVP) -N $< +vcd +trace +noerror

test_rvf: testbench_rvf.vvp firmware/firmware.hex
	$(VVP) -N $< +vcd +trace +noerror

test_wb: testbench_wb.vvp firmware/firmware.hex
	$(VVP) -N $<

test_wb_vcd: testbench_wb.vvp firmware/firmware.hex
	$(VVP) -N $< +vcd +trace +noerror

test_ez: testbench_ez.vvp
	$(VVP) -N $<

test_ez_vcd: testbench_ez.vvp
	$(VVP) -N $< +vcd

test_sp: testbench_sp.vvp firmware/firmware.hex
	$(VVP) -N $<

test_axi: testbench.vvp firmware/firmware.hex
	$(VVP) -N $< +axi_test

test_synth: testbench_synth.vvp firmware/firmware.hex
	$(VVP) -N $<

test_verilator: testbench_verilator firmware/firmware.hex
	./testbench_verilator

testbench.vvp: testbench.v picorv32.v
	$(IVERILOG) -o $@ $(subst C,-DCOMPRESSED_ISA,$(COMPRESSED_ISA)) $^
	chmod -x $@

testbench_rvf.vvp: testbench.v picorv32.v rvfimon.v
	$(IVERILOG) -o $@ -D RISCV_FORMAL $(subst C,-DCOMPRESSED_ISA,$(COMPRESSED_ISA)) $^
	chmod -x $@

testbench_wb.vvp: testbench_wb.v picorv32.v
	$(IVERILOG) -o $@ $(subst C,-DCOMPRESSED_ISA,$(COMPRESSED_ISA)) $^
	chmod -x $@

testbench_ez.vvp: testbench_ez.v picorv32.v
	$(IVERILOG) -o $@ $(subst C,-DCOMPRESSED_ISA,$(COMPRESSED_ISA)) $^
	chmod -x $@

testbench_sp.vvp: testbench.v picorv32.v
	$(IVERILOG) -o $@ $(subst C,-DCOMPRESSED_ISA,$(COMPRESSED_ISA)) -DSP_TEST $^
	chmod -x $@

testbench_synth.vvp: testbench.v synth.v
	$(IVERILOG) -o $@ -DSYNTH_TEST $^
	chmod -x $@

testbench_verilator: testbench.v picorv32.v testbench.cc
	$(VERILATOR) --cc --exe -Wno-lint -trace --top-module picorv32_wrapper testbench.v picorv32.v testbench.cc \
			$(subst C,-DCOMPRESSED_ISA,$(COMPRESSED_ISA)) --Mdir testbench_verilator_dir
	$(MAKE) -C testbench_verilator_dir -f Vpicorv32_wrapper.mk
	cp testbench_verilator_dir/Vpicorv32_wrapper testbench_verilator

check: check-yices

check-%: check.smt2
	yosys-smtbmc -s $(subst check-,,$@) -t 30 --dump-vcd check.vcd check.smt2
	yosys-smtbmc -s $(subst check-,,$@) -t 25 --dump-vcd check.vcd -i check.smt2

check.smt2: picorv32.v
	yosys -v2 -p 'read_verilog -formal picorv32.v' \
	          -p 'prep -top picorv32 -nordff' \
		  -p 'assertpmux -noinit; opt -fast; dffunmap' \
		  -p 'write_smt2 -wires check.smt2'

synth.v: picorv32.v scripts/yosys/synth_sim.ys
	yosys -qv3 -l synth.log scripts/yosys/synth_sim.ys

firmware/firmware.hex: firmware/firmware.bin firmware/makehex.py
	$(PYTHON) firmware/makehex.py $< 32768 > $@

firmware/firmware.bin: firmware/firmware.elf
	$(TOOLCHAIN_PREFIX)objcopy -O binary $< $@
	chmod -x $@

firmware/firmware.elf: $(FIRMWARE_OBJS) $(TEST_OBJS) firmware/sections.lds
	$(TOOLCHAIN_PREFIX)gcc -Os -mabi=ilp32 -march=rv32im$(subst C,c,$(COMPRESSED_ISA)) -ffreestanding -nostdlib -o $@ \
		-Wl,--build-id=none,-Bstatic,-T,firmware/sections.lds,-Map,firmware/firmware.map,--strip-debug \
		$(FIRMWARE_OBJS) $(TEST_OBJS) -lgcc
	chmod -x $@

firmware/start.o: firmware/start.S
	$(TOOLCHAIN_PREFIX)gcc -c -mabi=ilp32 -march=rv32im$(subst C,c,$(COMPRESSED_ISA)) -o $@ $<

firmware/%.o: firmware/%.c
	$(TOOLCHAIN_PREFIX)gcc -c -mabi=ilp32 -march=rv32i$(subst C,c,$(COMPRESSED_ISA)) -Os --std=c99 $(GCC_WARNS) -ffreestanding -nostdlib -o $@ $<

tests/%.o: tests/%.S tests/riscv_test.h tests/test_macros.h
	$(TOOLCHAIN_PREFIX)gcc -c -mabi=ilp32 -march=rv32im -o $@ -DTEST_FUNC_NAME=$(notdir $(basename $<)) \
		-DTEST_FUNC_TXT='"$(notdir $(basename $<))"' -DTEST_FUNC_RET=$(notdir $(basename $<))_ret $<



#TEST_NAME = pico_test
TEST_NAME = arith_basic_test

# Compilation & Linking
build:
	mkdir -p $(TEST_DIR)/obj
	riscv32-unknown-elf-gcc -static -c -march=rv32i -mabi=ilp32 -o $(TEST_DIR)/obj/start.o $(TEST_DIR)/start.S
	riscv32-unknown-elf-gcc -static -c -march=rv32i -mabi=ilp32 -Os -I./tests -o $(TEST_DIR)/obj/print.o $(TEST_DIR)/print.c
	riscv32-unknown-elf-gcc -static -c -march=rv32i -mabi=ilp32 -Os -I./tests -o $(TEST_DIR)/obj/pico_test.o $(TEST_DIR)/pico_test.c
	riscv32-unknown-elf-gcc -march=rv32i -mabi=ilp32 -Os -ffreestanding -nostdlib -Wl,--build-id=none,-Bstatic,-T,$(TEST_DIR)/sections.lds,-Map,tests/obj/pico_test.map,--strip-debug \
								   -I./tests \
								   -o $(TEST_DIR)/obj/firmware.elf $(TEST_DIR)/obj/start.o $(TEST_DIR)/obj/print.o $(TEST_DIR)/obj/pico_test.o \
								   -lc -lgcc
	# elf -> lst
	riscv32-unknown-elf-objdump -D $(TEST_DIR)/obj/firmware.elf > $(TEST_DIR)/obj/firmware.lst
	# elf -> bin
	riscv32-unknown-elf-objcopy -O binary $(TEST_DIR)/obj/firmware.elf $(TEST_DIR)/obj/firmware.bin
	# bin -> hex
	python3 scripts/makehex.py $(TEST_DIR)/obj/firmware.bin 32768 > $(TEST_DIR)/obj/firmware.hex
##  riscv32-unknown-elf-gcc -static -c -march=rv32i -mabi=ilp32 -o $(TEST_DIR)/obj/start.o $(TEST_DIR)/start.S
##	spike --isa=RV32I --log-commits /opt/riscv/riscv32-unknown-elf/bin/pk firmware/pico/pico_test.elf > pico_test.log 2>&1
##	spike -l --isa=rv32i --log=spike_log /opt/riscv/riscv32-unknown-elf/bin/pk firmware/pico/pico_test.elf

build2:
	@echo " @ TB_HOME = $(TB_HOME)"
	@echo " @ TEST_DIR = $(TEST_DIR)"
	@echo " @ TOOLCHAIN_PREFIX = $(TOOLCHAIN_PREFIX)"
	mkdir -p $(TEST_DIR)/obj
	riscv32-unknown-elf-gcc -static -c -march=rv32imc -mabi=ilp32 -o $(TEST_DIR)/obj/start.o $(TEST_DIR)/start_JS.S
	riscv32-unknown-elf-gcc -static -c -march=rv32imc -mabi=ilp32 -Os -o $(TEST_DIR)/obj/riscv_arithmetic_basic_test_0.o $(TEST_DIR)/riscv_arithmetic_basic_test_0_JS.S
	riscv32-unknown-elf-gcc -march=rv32im -mabi=ilp32 -Os -ffreestanding -nostdlib -Wl,--build-id=none,-Bstatic,-T,$(TEST_DIR)/sections_JS.lds,--strip-debug \
								   -I./tests \
								   -o $(TEST_DIR)/obj/firmware.elf $(TEST_DIR)/obj/start.o $(TEST_DIR)/obj/riscv_arithmetic_basic_test_0.o \
								   -lc -lgcc
	# elf -> lst
	riscv32-unknown-elf-objdump -D $(TEST_DIR)/obj/firmware.elf > $(TEST_DIR)/obj/firmware.lst
	# elf -> bin
	riscv32-unknown-elf-objcopy -O binary $(TEST_DIR)/obj/firmware.elf $(TEST_DIR)/obj/firmware.bin
	# bin -> hex
	python3 scripts/makehex.py $(TEST_DIR)/obj/firmware.bin 32768 > $(TEST_DIR)/obj/firmware.hex

##  spike --isa=RV32IMC --log-commits /opt/riscv/riscv32-unknown-elf/bin/pk tests/arith_basic_test/obj/firmware.elf > tests/arith_basic_test/obj/firmware_spike.log 2>&1

spikelog:
	# instruction log
	spike -l --log=dump/spike_inst_log --isa=rv32imc /opt/riscv/riscv32-unknown-elf/bin/pk $(TEST_DIR)/obj/firmware.elf
	# reg/mem log
#spike --log-commits --log=spike_reg_log --isa=RV32IMC /opt/riscv/riscv32-unknown-elf/bin/pk $(TEST_DIR)/obj/firmware.elf

dutlog:
	#testbench.trace -> tracelog
	python3 scripts/showtrace.py dump/testbench.trace tests/arith_basic_test/obj/firmware.elf | tee dump/dut_log

spikelogconv:
	#spike_*_log -> spike_conv_*_log
	python3 scripts/convert.py dump/spike_inst_log dump/spike_conv_inst_log
	# compare dut_log/spike_conv_*_log
	python3 scripts/compare.py dump/dut_log dump/spike_conv_inst_log 



logcompare:
	# converted_log(spike), tracelog(dut) compare
	python3 convert.py firmware/spike_inst_log ./converted_spike_inst_log


libspikeso:
	# make shared object file
	g++ scripts/spike_dpi.cc -o scripts/libspike.so -fPIC -shared -std=c++17 \
					-I/opt/riscv/include -I/opt/riscv/include/riscv -I/opt/riscv/include/fesvr -I/usr/local/include/iverilog -I/usr/share/verilator/include/vltstd \
					-L/opt/riscv/include -L/opt/riscv/include/riscv -L/opt/riscv/include/fesvr -L/usr/local/include/iverilog -L/usr/share/verilator/include/vltstd \
					-L/opt/riscv/lib -lriscv -lfesvr -lpthread -lgmp -lmpfr -lmpc -ldl -Wl,-rpath=/opt/riscv/lib \
					-DVPI_WRAPPER
	cp scripts/libspike.so scripts/libspike.vpi

# Spike co-simulation
sim:
	mkdir -p $(TB_HOME)/dump
	iverilog -g2012 -o top/testbench.vvp top/testbench.v top/picorv32.v -DVPI_WRAPPER -DCOMPRESSED_ISA
	vvp -M . -m scripts/libspike top/testbench.vvp +trace +vcd

all:
	make build2
	make libspikeso
	make sim


clean:
	rm -rf $(TB_HOME)/dump $(TB_HOME)/scripts/libspike.* $(TEST_DIR)/obj top/testbench.vvp




download-tools:
	sudo bash -c 'set -ex; mkdir -p /var/cache/distfiles; $(GIT_ENV); \
	$(foreach REPO,riscv-gnu-toolchain riscv-binutils-gdb riscv-gcc riscv-glibc riscv-newlib, \
		if ! test -d /var/cache/distfiles/$(REPO).git; then rm -rf /var/cache/distfiles/$(REPO).git.part; \
			git clone --bare https://github.com/riscv/$(REPO) /var/cache/distfiles/$(REPO).git.part; \
			mv /var/cache/distfiles/$(REPO).git.part /var/cache/distfiles/$(REPO).git; else \
			(cd /var/cache/distfiles/$(REPO).git; git fetch https://github.com/riscv/$(REPO)); fi;)'

define build_tools_template
build-$(1)-tools:
	@read -p "This will remove all existing data from $(RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX)$(subst riscv32,,$(1)). Type YES to continue: " reply && [[ "$$$$reply" == [Yy][Ee][Ss] || "$$$$reply" == [Yy] ]]
	sudo bash -c "set -ex; rm -rf $(RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX)$(subst riscv32,,$(1)); mkdir -p $(RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX)$(subst riscv32,,$(1)); chown $$$${USER}: $(RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX)$(subst riscv32,,$(1))"
	+$(MAKE) build-$(1)-tools-bh

build-$(1)-tools-bh:
	+set -ex; $(GIT_ENV); \
	if [ -d /var/cache/distfiles/riscv-gnu-toolchain.git ]; then reference_riscv_gnu_toolchain="--reference /var/cache/distfiles/riscv-gnu-toolchain.git"; else reference_riscv_gnu_toolchain=""; fi; \
	if [ -d /var/cache/distfiles/riscv-binutils-gdb.git ]; then reference_riscv_binutils_gdb="--reference /var/cache/distfiles/riscv-binutils-gdb.git"; else reference_riscv_binutils_gdb=""; fi; \
	if [ -d /var/cache/distfiles/riscv-gcc.git ]; then reference_riscv_gcc="--reference /var/cache/distfiles/riscv-gcc.git"; else reference_riscv_gcc=""; fi; \
	if [ -d /var/cache/distfiles/riscv-glibc.git ]; then reference_riscv_glibc="--reference /var/cache/distfiles/riscv-glibc.git"; else reference_riscv_glibc=""; fi; \
	if [ -d /var/cache/distfiles/riscv-newlib.git ]; then reference_riscv_newlib="--reference /var/cache/distfiles/riscv-newlib.git"; else reference_riscv_newlib=""; fi; \
	rm -rf riscv-gnu-toolchain-$(1); git clone $$$$reference_riscv_gnu_toolchain https://github.com/riscv/riscv-gnu-toolchain riscv-gnu-toolchain-$(1); \
	cd riscv-gnu-toolchain-$(1); git checkout $(RISCV_GNU_TOOLCHAIN_GIT_REVISION); \
	git submodule update --init $$$$reference_riscv_binutils_gdb riscv-binutils; \
	git submodule update --init $$$$reference_riscv_binutils_gdb riscv-gdb; \
	git submodule update --init $$$$reference_riscv_gcc riscv-gcc; \
	git submodule update --init $$$$reference_riscv_glibc riscv-glibc; \
	git submodule update --init $$$$reference_riscv_newlib riscv-newlib; \
	mkdir build; cd build; ../configure --with-arch=$(2) --prefix=$(RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX)$(subst riscv32,,$(1)); make

.PHONY: build-$(1)-tools
endef

$(eval $(call build_tools_template,riscv32i,rv32i))
$(eval $(call build_tools_template,riscv32ic,rv32ic))
$(eval $(call build_tools_template,riscv32im,rv32im))
$(eval $(call build_tools_template,riscv32imc,rv32imc))

build-tools:
	@echo "This will remove all existing data from $(RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX)i, $(RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX)ic, $(RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX)im, and $(RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX)imc."
	@read -p "Type YES to continue: " reply && [[ "$$reply" == [Yy][Ee][Ss] || "$$reply" == [Yy] ]]
	sudo bash -c "set -ex; rm -rf $(RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX){i,ic,im,imc}; mkdir -p $(RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX){i,ic,im,imc}; chown $${USER}: $(RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX){i,ic,im,imc}"
	+$(MAKE) build-riscv32i-tools-bh
	+$(MAKE) build-riscv32ic-tools-bh
	+$(MAKE) build-riscv32im-tools-bh
	+$(MAKE) build-riscv32imc-tools-bh

toc:
	gawk '/^-+$$/ { y=tolower(x); gsub("[^a-z0-9]+", "-", y); gsub("-$$", "", y); printf("- [%s](#%s)\n", x, y); } { x=$$0; }' README.md
	


.PHONY: test test_vcd test_sp test_axi test_wb test_wb_vcd test_ez test_ez_vcd test_synth download-tools build-tools toc clean
