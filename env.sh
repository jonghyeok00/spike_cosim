#!/bin/bash

# Please Set the below arguments
export RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX=/opt/riscv
export MY_ISA="RV32IMC"
export TEST_NAME=arith_basic_test

# Do not touch the below arguments
export TB_HOME=$(pwd)
export TEST_DIR=$TB_HOME/tests/$TEST_NAME
export MY_ELF_PATH="$TEST_DIR/obj/firmware.hex"
export MY_PK_PATH="$RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX/riscv32-unknown-elf/bin/pk"

echo ============================================================================
echo TB_HOME: $TB_HOME
echo RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX: $RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX
echo TEST_NAME: $TEST_NAME
echo TEST_DIR: $TEST_DIR
echo MY_ELF_PATH: $MY_ELF_PATH
echo MY_PK_PATH: $MY_PK_PATH
echo MY_ISA: $MY_ISA
echo ============================================================================

alias tb='$TB_HOME'
