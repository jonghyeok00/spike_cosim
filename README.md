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
  3. make build
     - Compilation & Linking
  4. make sim
     - Spike C++(spike_dpi.cc) compilation in verilog testbench(testbench.v)
     - Run simulation and check the log results.
