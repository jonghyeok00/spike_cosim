#.include "user_define.h"
#.globl _start

#TS_ADD_BEGIN
.globl main
.section .text
#_start:           
#                  .include "user_init.s"
#                  li x6, 0
#                  beq x5, x6, 0f
#
#0: la x2, h0_start
#jalr x0, x2, 0
#h0_start:
#                  li x9, 0x40001104
#kernel_sp:        
#                  la x10, kernel_stack_end
#
#trap_vec_init:    
#                  la x9, mtvec_handler
#                  ori x9, x9, 0
#
#mepc_setup:       
#                  la x9, init
#
#custom_csr_setup: 
#                  nop
#
#init_machine_mode:
#                  li x9, 0x1800
#                  li x9, 0x0
#                  mret
#init:             
#                  li x0, 0xb
#                  li x1, 0xabd72183
#                  li x2, 0xf0408206
#                  li x3, 0x80000000
#                  li x4, 0x0
#                  li x5, 0x0
#                  li x6, 0xdd6448b0
#                  li x7, 0x80000000
#                  li x8, 0x0
#                  li x9, 0x0
#                  li x11, 0x6000b5f2
#                  li x12, 0x21fe98d
#                  li x13, 0xc
#                  li x14, 0xb5162aa2
#                  li x15, 0x5fc112f8
#                  li x16, 0x28d8a144
#                  li x17, 0x0
#                  li x18, 0x0
#                  li x20, 0x7
#                  li x21, 0x0
#                  li x22, 0x80000000
#                  li x23, 0xb7afac35
#                  li x24, 0x3
#                  li x25, 0x0
#                  li x26, 0xf013c419
#                  li x27, 0x2
#                  li x28, 0x80000000
#                  li x29, 0x80000000
#                  li x30, 0xfb45316b
#                  li x31, 0xfafcd204
#                  la x19, user_stack_end
main:             
				  //Stack Save
				  addi sp, sp, -16
				  sw ra, 12(sp)

				  li           a1, 0xdc61c65 #start riscv_int_numeric_corner_stream_4
                  li           tp, 0x4f871c63
                  li           t2, 0xffffffff
                  li           t5, 0xffffffff
                  li           t3, 0xaf94dde4
                  li           gp, 0xffffffff
                  li           a7, 0xc8abe52b
                  li           s5, 0x80000000
                  li           ra, 0x80000000
                  li           s8, 0x0
                  nop
                  lui          t3, 20966
                  sub          s5, gp, t2
                  sub          gp, t2, s5
                  sub          gp, a7, t3
                  sub          t5, a1, a1
                  addi         t2, ra, 777
                  nop
                  addi         ra, gp, -1052
                  li           t5, 0xb6b7a7b3 #start riscv_int_numeric_corner_stream_20
                  li           s11, 0xffffffff
                  li           s9, 0xae0a6f60
                  li           s0, 0x41ae5c61
                  li           s2, 0x0
                  li           s7, 0x0
                  li           s1, 0xffffffff
                  li           a4, 0xffffffff
                  li           s5, 0x5906f049
                  li           s4, 0x0
                  nop
                  add          s2, t5, s11
                  sub          s2, s0, s11
                  nop
                  lui          s4, 140830
                  add          a4, a4, s4
                  nop
                  add          s2, s4, s9
                  nop
                  auipc        a4, 46347 #end riscv_int_numeric_corner_stream_20
                  li           gp, 0xffffffff #start riscv_int_numeric_corner_stream_8
                  li           t3, 0xffffffff
                  li           t5, 0xadcae01e
                  li           s10, 0x80000000
                  li           s4, 0x6245f672
                  li           a7, 0x0
                  li           t2, 0x80000000
                  li           s7, 0x0
                  li           ra, 0xffffffff
                  li           a3, 0xffffffff
                  lui          s4, 1036154
                  auipc        a7, 31278
                  nop
                  nop
                  auipc        ra, 217909
                  nop
                  add          a3, t3, a7
                  auipc        t5, 201449
                  add          ra, t5, a3
                  li           t3, 0x80000000 #start riscv_int_numeric_corner_stream_11
                  li           s8, 0x0
                  li           ra, 0x0
                  li           a4, 0x0
                  li           a7, 0x0
                  li           a6, 0x80000000
                  li           s1, 0x0
                  li           t6, 0x80000000
                  li           a3, 0x80000000
                  li           s0, 0x44a9ea4d
                  nop
                  lui          a4, 658203
                  sub          s8, s1, s1
                  sub          ra, a4, a3
                  lui          a3, 691752
                  lui          a4, 495756
                  add          a4, t3, a6
                  sub          ra, ra, s1
                  li           a5, 0x0 #start riscv_int_numeric_corner_stream_14
                  li           t6, 0x86e76128
                  li           t2, 0x80000000
                  li           s11, 0xb6f0310d
                  li           gp, 0x0
                  li           t4, 0x8599c10e
                  li           t1, 0x6031856b
                  li           a2, 0xffffffff
                  li           a4, 0x0
                  li           a1, 0xffffffff
                  nop
                  nop
                  nop
                  addi         t2, s11, 1036
                  auipc        s11, 531809
                  add          t6, a4, a4
                  addi         t6, a4, -754
                  lui          gp, 729987
                  auipc        a5, 289965
                  sub          a4, t6, gp
                  nop
                  lui          t1, 139237
                  nop #end riscv_int_numeric_corner_stream_14
                  li           t3, 0xffffffff #start riscv_int_numeric_corner_stream_38
                  li           t1, 0x80000000
                  li           s10, 0x80000000
                  li           s4, 0xffffffff
                  li           s5, 0x80000000
                  li           tp, 0x307599c2
                  li           s0, 0x0
                  li           a1, 0xffffffff
                  li           s6, 0x0
                  li           a5, 0x0
                  sub          a1, s0, t1
                  lui          s10, 458410
                  add          s4, s10, tp
                  addi         s0, a1, 431
                  nop
                  addi         s6, a5, 1397
                  auipc        t1, 851391
                  add          a5, a1, t3 #end riscv_int_numeric_corner_stream_38
                  li           a6, 0x0 #start riscv_int_numeric_corner_stream_28
                  li           t0, 0x0
                  li           s5, 0x0
                  li           s10, 0x0
                  li           s11, 0x80000000
                  li           s0, 0xeeaa417b
                  li           s7, 0x80000000
                  li           s9, 0x80000000
                  li           a1, 0x0
                  li           t5, 0x80000000
                  nop
                  lui          s0, 358594
                  addi         a6, a1, -1557
                  auipc        s9, 984736
                  add          s11, s7, a6
                  add          s11, s10, s7
                  addi         s7, s5, 1657
                  sub          s10, a6, s5
                  add          s10, a6, s9
                  sub          s9, s5, a1
                  nop
                  li           a3, 0x97ecb565 #start riscv_int_numeric_corner_stream_9
                  li           s2, 0x876cc396
                  li           a2, 0x0
                  li           a1, 0xffffffff
                  li           s11, 0x0
                  li           s0, 0x80000000
                  li           s7, 0x0
                  li           t6, 0x8dade320
                  li           s9, 0x125f0631
                  li           t1, 0x0
                  sub          s0, s9, s9
                  auipc        s7, 140758
                  nop
                  nop
                  auipc        a3, 521153
                  add          a3, a1, t1
                  nop
                  lui          s2, 419467
                  add          a3, s11, s7
                  add          s0, s7, t1
                  li           ra, 0x9f89fdbb #start riscv_int_numeric_corner_stream_19
                  li           s7, 0xffffffff
                  li           t2, 0x80000000
                  li           s8, 0x80000000
                  li           s11, 0xffffffff
                  li           a4, 0x0
                  li           t1, 0xffffffff
                  li           gp, 0x0
                  li           s6, 0x0
                  li           s9, 0x80000000
                  add          s9, t2, s7
                  nop
                  add          s11, gp, s9
                  nop
                  lui          t1, 572826
                  lui          ra, 273699
                  add          s7, s7, s7
                  sub          s8, s11, s7
                  addi         s11, s8, 438
                  addi         ra, s8, -1260
                  lui          t1, 207031
                  add          t2, a4, t1
                  nop #end riscv_int_numeric_corner_stream_19
                  li           t6, 0xffffffff #start riscv_int_numeric_corner_stream_15
                  li           s10, 0xffffffff
                  li           s6, 0xffffffff
                  li           t1, 0x80000000
                  li           t3, 0xffffffff
                  li           t2, 0xc71d621c
                  li           a5, 0x80000000
                  li           t5, 0xffffffff
                  li           a7, 0xffffffff
                  li           s4, 0x123b7d93
                  sub          a7, t1, s6
                  add          a7, a7, t6
                  auipc        a7, 209622
                  sub          t2, t1, t3
                  addi         s10, s6, 2003
                  lui          t3, 705329
                  sub          t3, a7, s4
                  sub          t6, s10, t1
                  add          t6, s4, t6
                  li           t3, 0x63b39502 #start riscv_int_numeric_corner_stream_36
                  li           s7, 0x80000000
                  li           a3, 0x0
                  li           t5, 0x0
                  li           s4, 0x80000000
                  li           s5, 0xdd692b4a
                  li           s11, 0xa5b7e46e
                  li           t2, 0x55b94ace
                  li           gp, 0xffffffff
                  li           a1, 0x0
                  sub          t2, s4, t2
                  nop
                  auipc        a1, 961236
                  nop
                  lui          t5, 830653
                  addi         s5, s5, 1933
                  add          t2, s11, a1 #end riscv_int_numeric_corner_stream_36
                  li           t3, 0xffffffff #start riscv_int_numeric_corner_stream_2
                  li           t6, 0x0
                  li           a6, 0x0
                  li           gp, 0x0
                  li           t1, 0x80000000
                  li           tp, 0x8590b98b
                  li           t4, 0x0
                  li           s8, 0xffffffff
                  li           s1, 0x80000000
                  li           a4, 0x0
                  auipc        a6, 851941
                  auipc        t6, 641047
                  nop
                  nop
                  sub          t3, t6, gp
                  nop
                  add          a4, tp, a6
                  add          s1, s8, t3
                  lui          t6, 567367
                  lui          t3, 970256
                  add          gp, tp, t1
                  sub          a6, a4, gp
                  sub          t6, a4, s1 #end riscv_int_numeric_corner_stream_2
                  li           a5, 0x80000000 #start riscv_int_numeric_corner_stream_23
                  li           s0, 0xffffffff
                  li           t4, 0x0
                  li           t0, 0x0
                  li           ra, 0xffffffff
                  li           s6, 0x80000000
                  li           s7, 0x80000000
                  li           s9, 0xafc1be88
                  li           s4, 0xee3c834e
                  li           s2, 0x0
                  add          t4, ra, s9
                  nop
                  lui          s0, 514859
                  sub          t0, s4, s9
                  nop
                  add          s4, t4, t0
                  lui          s0, 168811
                  addi         s4, s2, 1831
                  li           s5, 0x22438c88 #start riscv_int_numeric_corner_stream_3
                  li           s10, 0x80000000
                  li           s6, 0x82b6b0a3
                  li           t4, 0x74a09704
                  li           s1, 0xa60f9ea5
                  li           t0, 0xffffffff
                  li           a1, 0xffffffff
                  li           ra, 0x23df0dbb
                  li           a5, 0xffffffff
                  li           a6, 0x7f277a11
                  lui          a5, 282264
                  add          t4, s6, a1
                  add          t0, s6, t0
                  addi         a5, s10, 126
                  auipc        s6, 565016
                  nop
                  lui          a6, 282792
                  nop
                  sub          t4, s6, s6
                  lui          t4, 788812
                  addi         t0, a1, 528
                  add          a1, a6, s6
                  add          a5, ra, t4
                  li           a1, 0xffffffff #start riscv_int_numeric_corner_stream_12
                  li           t4, 0xffffffff
                  li           s8, 0xffffffff
                  li           a5, 0x80000000
                  li           s9, 0x80000000
                  li           t3, 0x0
                  li           s4, 0xffffffff
                  li           a2, 0x80000000
                  li           s11, 0x80000000
                  li           gp, 0x0
                  auipc        t3, 861585
                  sub          gp, a5, s11
                  lui          a5, 502142
                  lui          t4, 1019575
                  sub          t3, a5, gp
                  addi         t4, a2, 749
                  add          s8, s8, s11
                  addi         s11, t4, 902
                  lui          a2, 71225
                  lui          t3, 491836
                  addi         s8, gp, -224
                  lui          s8, 415997
                  lui          t3, 877385
                  addi         t4, a5, -69
                  li           s9, 0x6fca80fb #start riscv_int_numeric_corner_stream_26
                  li           t3, 0x80000000
                  li           a7, 0x0
                  li           s4, 0xc90aa155
                  li           a5, 0xffffffff
                  li           s0, 0xffffffff
                  li           t6, 0xffffffff
                  li           s6, 0x0
                  li           t4, 0xfaa8d7e9
                  li           a4, 0xffffffff
                  sub          s9, a4, t4
                  lui          s0, 448588
                  addi         t6, a4, 1700
                  add          a7, a4, t4
                  sub          t4, s4, a4
                  addi         s0, s4, 1278
                  addi         a5, s6, 108
                  lui          s4, 775037
                  lui          a7, 730581
                  nop
                  addi         a5, t4, -1897
                  li           t3, 0x0 #start riscv_int_numeric_corner_stream_6
                  li           s5, 0x0
                  li           a4, 0x0
                  li           s7, 0x80000000
                  li           t0, 0x0
                  li           s11, 0x80000000
                  li           s2, 0x80000000
                  li           t5, 0x0
                  li           s6, 0x80000000
                  li           a3, 0xb34de198
                  addi         t0, a4, 1747
                  addi         t5, t0, 1898
                  add          t3, s6, s7
                  auipc        s6, 835549
                  nop
                  add          a3, a3, t3
                  addi         s7, t0, 676
                  add          a4, s5, s5
                  add          t0, s7, t3
                  sub          a4, s7, a3
                  nop
                  xor          ra, s8, a4
                  andi         s7, zero, -776
                  add          t3, s4, zero
                  sra          s0, t3, t6
                  add          s9, s9, s11
                  add          s4, tp, s0
                  xor          t4, t3, sp
                  xor          s7, t1, a7
                  xor          t1, s6, a7
                  add          s7, s4, s8
                  xori         s0, a0, 1190
                  srli         t2, s1, 25
                  sra          ra, s0, a4
                  slt          a5, s8, gp
                  ori          s2, s0, 25
                  slt          s11, s3, t4
                  sltiu        t3, t1, -152
                  slli         tp, gp, 2
                  ori          a5, s6, 352
                  srl          t5, a5, a2
                  xori         s1, a6, -1591
                  sub          a2, t3, a3
                  srai         a6, t0, 24
                  srli         s10, tp, 12
                  or           t5, gp, a1
                  andi         a7, s3, -22
                  sub          a5, sp, t2
                  srli         gp, gp, 11
                  sra          t0, a6, a5
                  srai         a1, a4, 22
                  addi         s10, s3, -1797
                  sra          s0, t1, s5
                  sll          a3, t6, s3
                  slli         s1, sp, 13
                  add          t4, tp, s1
                  auipc        t0, 916411
                  nop
                  add          a3, a6, a1
                  xori         a2, t1, 1184
                  slt          t5, t6, s7
                  sltu         ra, a1, a1
                  add          s10, s6, s5
                  srai         s6, a3, 18
                  slli         zero, a4, 18
                  srli         s6, s2, 27
                  and          ra, ra, t5
                  and          t2, t4, sp
                  slti         a7, gp, -1091
                  lui          a5, 177077
                  lui          s4, 810674
                  slti         t3, a3, -308
                  sub          t6, s6, t0
                  add          a2, a4, s11
                  srai         s4, a4, 0
                  sra          zero, s3, s2
                  srai         s11, zero, 19
                  xor          a7, s3, zero
                  xor          a3, s3, a5
                  and          a3, t3, s8
                  sub          s10, a3, t5
                  sltiu        a1, a3, 73
                  ori          s7, s11, 1846
                  sll          s6, tp, s10
                  sltu         s2, t3, a1
                  srl          tp, t5, a1
                  srai         a3, s10, 25
                  nop
                  or           a1, s3, t0
                  srl          a4, a6, t3
                  xor          ra, s9, t1
                  sub          tp, a6, s8
                  andi         t3, a5, 742
                  slti         s8, s1, 711
                  srli         ra, s3, 5
                  ori          t0, sp, 1692
                  li           s0, 0xe9eb9c89 #start riscv_int_numeric_corner_stream_24
                  li           t5, 0x80000000
                  li           t2, 0x2e9c1df9
                  li           a5, 0x0
                  li           s8, 0xffffffff
                  li           s6, 0xffffffff
                  li           s5, 0xffffffff
                  li           s10, 0x55a81e5f
                  li           tp, 0xc730e21b
                  li           a3, 0x80000000
                  addi         tp, s0, -717
                  nop
                  auipc        a5, 289765
                  addi         s5, s6, 1260
                  sub          a3, s8, t2
                  nop
                  add          s8, s6, s0
                  add          a3, t2, s0
                  sub          a5, t5, a3
                  sub          tp, s10, tp
                  sub          s0, a3, s8 #end riscv_int_numeric_corner_stream_24
                  slli         gp, ra, 18
                  sltiu        s10, s6, 1656
                  srai         s6, gp, 23
                  or           ra, tp, t3
                  addi         s9, tp, -271
                  srai         s1, s8, 20
                  sll          tp, a2, t4
                  xori         s4, s5, -244
                  sra          s5, sp, s1
                  sub          s5, a4, s8
                  sub          t5, a3, t0
                  and          t1, a5, t0
                  srl          t1, t4, t6
                  sra          ra, a4, t4
                  sub          a3, ra, a3
                  srai         s8, a0, 7
                  srai         ra, s1, 12
                  xori         s5, t0, 1424
                  and          s10, s6, gp
                  slli         t4, t0, 25
                  add          t1, s10, gp
                  and          t6, s2, a6
                  sub          ra, zero, t6
                  sll          a1, a0, s0
                  xori         s7, ra, -1955
                  sltu         gp, s4, a2
                  sll          a3, a7, a5
                  xori         a5, tp, -1332
                  sltu         t1, a5, s4
                  add          a7, t3, s7
                  addi         tp, a6, 1888
                  srl          s7, t4, t3
                  xori         a3, gp, -1776
                  and          s9, a1, s5
                  sll          t2, t3, a7
                  and          a1, t0, t2
                  xori         a2, a1, 1963
                  or           tp, t5, t3
                  andi         zero, zero, -1431
                  auipc        s4, 142804
                  addi         t2, t1, 42
                  lui          zero, 54041
                  sll          t1, t4, s5
                  srai         t6, s11, 3
                  srl          s0, s0, t0
                  slti         s5, t4, -1785
                  and          a3, s9, s2
                  sra          s10, s4, t5
                  auipc        a2, 132992
                  or           t6, t6, t2
                  slti         tp, s7, 530
                  sltiu        t4, a3, 1526
                  auipc        t0, 281597
                  xor          s2, t6, a5
                  sub          s4, tp, a1
                  sltiu        zero, s7, 800
                  or           gp, a7, t2
                  li           s10, 0x7f377eee #start riscv_int_numeric_corner_stream_35
                  li           ra, 0x0
                  li           t0, 0x0
                  li           s9, 0x0
                  li           a6, 0x9b46a85f
                  li           a7, 0x80000000
                  li           tp, 0x80000000
                  li           s7, 0x0
                  li           t2, 0x2da12e60
                  li           a2, 0x80000000
                  nop
                  nop
                  addi         a2, s7, -995
                  lui          a6, 458412
                  add          a2, a6, a2
                  lui          a2, 237361
                  lui          a7, 428503
                  addi         a2, ra, -1888
                  add          s7, s9, ra
                  sub          a2, t2, t2
                  addi         s7, s10, 590
                  sub          t0, a6, t2
                  lui          t2, 128689
                  auipc        s9, 878633 #end riscv_int_numeric_corner_stream_35
                  sll          t4, a2, t0
                  addi         s5, t0, 1033
                  srai         s8, a0, 2
                  slti         a7, s4, -925
                  add          t6, a7, zero
                  slti         a1, a5, -1340
                  sltu         s0, s5, a4
                  slt          t2, s1, a4
                  lui          t3, 594065
                  or           t3, a2, s11
                  xor          s5, s6, s4
                  xori         s0, t6, -1314
                  auipc        s10, 592325
                  slti         t1, t5, 628
                  and          s7, s4, s4
                  srl          s8, a5, a2
                  ori          s5, a2, -1167
                  sub          a4, t2, s8
                  sra          s8, a2, s0
                  xori         t3, t4, -1415
                  slli         t1, t4, 15
                  and          t1, s6, t0
                  slli         t4, s7, 7
                  srai         t4, t2, 8
                  addi         t6, a3, -380
                  andi         t2, ra, 2041
                  srl          zero, s8, s7
                  srl          t2, t4, s3
                  add          s4, s9, a4
                  sub          t3, a2, s2
                  sltiu        zero, a5, -1971
                  andi         t6, s11, -1120
                  sltu         a5, s4, a2
                  and          t1, a7, tp
                  slt          s4, s0, s6
                  auipc        s5, 293761
                  srai         t3, zero, 30
                  sltu         s6, ra, s2
                  sub          a4, a1, t5
                  and          s11, s10, a5
                  srli         s5, a6, 20
                  xor          t1, s11, gp
                  srai         s5, s8, 1
                  addi         a5, ra, 1716
                  nop
                  sltiu        t6, s11, 731
                  xori         s8, ra, 976
                  slt          a1, a4, s3
                  slli         ra, t5, 4
                  auipc        s6, 703818
                  sltiu        t5, s0, 1997
                  srai         t1, s1, 26
                  xor          s10, t0, s8
                  sll          a6, s7, s6
                  sll          a4, t0, s4
                  li           s9, 0x80000000 #start riscv_int_numeric_corner_stream_27
                  li           a5, 0x478e893c
                  li           t4, 0xffffffff
                  li           s11, 0x2b481001
                  li           a7, 0xffffffff
                  li           t0, 0xffffffff
                  li           s10, 0x831dc982
                  li           t1, 0x80000000
                  li           s6, 0x62a2bee7
                  li           ra, 0x80000000
                  add          s11, s11, a5
                  lui          a7, 736299
                  add          a5, s6, a7
                  addi         a7, s9, 1603
                  auipc        s10, 378549
                  add          a7, s11, a7
                  lui          t0, 593134
                  sub          t4, ra, t4
                  lui          t1, 361023
                  lui          s10, 437412
                  addi         s9, t0, -416
                  add          a7, s6, t0
                  sub          a5, t4, a5
                  addi         a5, s6, -420
                  sub          t1, s11, a7
                  lui          ra, 499067
                  sub          a7, t0, t4
                  add          ra, s11, ra
                  nop
                  nop
                  andi         a1, a6, 917
                  or           t4, t6, a7
                  and          a4, s9, t2
                  srli         gp, t3, 29
                  lui          a3, 103372
                  andi         s9, a7, 857
                  ori          a4, t0, 1523
                  andi         s6, s5, 317
                  slli         zero, t4, 10
                  srli         t5, ra, 19
                  and          s9, a4, a4
                  nop
                  srl          s1, sp, t5
                  xori         t4, a1, -63
                  slli         t6, s5, 5
                  xor          s6, t1, t4
                  slti         a7, gp, 125
                  xori         s6, gp, 1253
                  sub          s6, a6, s6
                  auipc        s1, 125984
                  addi         a3, tp, -767
                  sra          s8, a7, a5
                  xori         gp, s8, 1755
                  auipc        tp, 466460
                  xori         s7, s2, 741
                  srli         a7, s2, 6
                  auipc        a3, 816086
                  ori          s7, s0, 1139
                  sltu         a5, a7, a4
                  addi         s4, s4, 54
                  slt          a7, t2, a1
                  lui          s1, 919515
                  sub          zero, s11, s2
                  addi         a1, zero, -119
                  auipc        s11, 904636
                  sra          a7, ra, t2
                  sltu         s8, a3, a0
                  xori         s7, a1, -32
                  nop
                  addi         t2, a6, -1510
                  lui          t5, 974723
                  slti         zero, a1, 492
                  sll          a1, s7, a1
                  sub          a3, t1, t2
                  srai         t6, s3, 30
                  lui          s6, 925524
                  srai         a4, a4, 31
                  or           t6, t6, sp
                  sub          a2, s5, s0
                  srli         s6, s8, 0
                  or           s2, gp, s9
                  sub          tp, s11, s7
                  or           s0, s8, a6
                  xori         a5, s8, 393
                  slt          a2, s1, zero
                  slti         s9, s5, 1953
                  xor          a4, t2, a0
                  slli         t2, t5, 26
                  nop
                  addi         s9, s10, 258
                  nop
                  sltiu        t1, a5, 1343
                  sub          ra, a1, s11
                  sltu         s11, s8, t3
                  sra          a2, t0, a7
                  sub          t1, a7, s0
                  and          s1, s6, s10
                  or           t0, s3, s4
                  srl          s11, a7, a5
                  srai         s10, a6, 29
                  xor          ra, s9, a2
                  sub          s10, s7, t2
                  sra          t0, a1, a5
                  ori          ra, s2, 1716
                  auipc        s11, 828864
                  sub          s1, a6, a5
                  add          s8, s7, t3
                  sltiu        s1, s9, -1502
                  addi         s8, a1, -765
                  addi         tp, s1, -1965
                  xor          t1, t3, t2
                  xor          s10, s4, s8
                  add          s7, t6, a1
                  sltu         t5, s9, s11
                  sll          s6, a4, t2
                  ori          s7, a2, 1645
                  xor          s11, a3, t4
                  and          zero, t0, s8
                  sub          a7, s2, s1
                  sltu         t0, s9, a2
                  and          t5, t1, t2
                  xori         s5, a5, 1195
                  srl          a2, s7, tp
                  nop
                  sll          s4, t5, t6
                  sll          s8, zero, s11
                  ori          t1, a0, 499
                  slti         t6, a0, 1686
                  add          zero, s11, a0
                  sub          s1, s8, t2
                  ori          t3, s9, -592
                  andi         s6, s11, 1973
                  nop
                  or           t6, t4, s10
                  srli         s4, t4, 31
                  slt          tp, a1, s0
                  add          a5, s5, ra
                  or           a4, a3, t6
                  sll          zero, s6, t1
                  ori          s11, s11, -1121
                  srai         s4, a6, 4
                  xori         t6, s7, -902
                  addi         s1, a5, -1181
                  slli         s5, s5, 8
                  auipc        s1, 636733
                  nop
                  auipc        s0, 235145
                  and          s2, s10, t6
                  ori          t2, s5, -1974
                  slli         zero, a1, 6
                  slli         zero, s5, 18
                  slli         t0, a6, 26
                  sra          t1, a6, s6
                  sll          gp, sp, s9
                  auipc        t4, 406212
                  slti         s6, s1, -230
                  lui          a3, 851274
                  srai         a7, a4, 26
                  andi         t1, a5, 1142
                  xor          s1, ra, s11
                  lui          a2, 566547
                  slti         s0, t6, 1238
                  sltiu        s10, a3, 427
                  and          s2, s1, s8
                  andi         s7, tp, -1757
                  nop
                  addi         s4, s4, -710
                  and          s6, s5, s0
                  slti         gp, zero, 1013
                  lui          t1, 81834
                  slt          s5, t0, s11
                  xori         t1, t6, 899
                  nop
                  sltiu        a3, t3, -320
                  sub          t6, a2, t1
                  slli         a6, tp, 16
                  sra          t4, ra, s11
                  slti         s8, s10, 1404
                  srl          s4, s7, s4
                  sra          zero, s7, a3
                  lui          ra, 973594
                  addi         s9, s5, 1674
                  slt          s7, sp, t0
                  sra          s9, t4, tp
                  nop
                  lui          t3, 13582
                  andi         s8, a3, 1593
                  srai         ra, s3, 0
                  lui          t4, 301034
                  and          s5, t0, a4
                  sra          s5, a6, s3
                  xor          s6, t6, s8
                  sltu         a5, s0, s9
                  srai         zero, a3, 20
                  nop
                  sltiu        t6, a0, 224
                  xor          t5, a0, a5
                  slti         s2, a2, 1691
                  ori          s5, s10, -1816
                  xori         ra, s6, -553
                  lui          t2, 30506
                  xori         a3, t4, -113
                  or           s1, t6, a0
                  auipc        a6, 799501
                  or           s5, s3, s4
                  srai         ra, a3, 23
                  ori          s5, zero, -2001
                  nop
                  sltiu        s6, gp, 1348
                  addi         s5, a7, -941
                  xori         t3, s7, 663
                  sub          a2, s3, a2
                  srai         zero, a0, 13
                  sltu         gp, t3, s2
                  addi         t4, tp, 794
                  auipc        gp, 872829
                  slt          a5, s10, s4
                  andi         zero, s1, 1841
                  sltu         s11, s10, a7
                  slli         s6, t1, 20
                  srli         gp, gp, 28
                  xori         s11, s0, -732
                  xori         s0, s6, 1082
                  xor          s7, s8, tp
                  slti         gp, a2, 192
                  sra          tp, a1, s6
                  sll          t3, a1, t6
                  xor          a2, s9, s5
                  srli         a4, a4, 10
                  srl          s1, a6, s10
                  slt          s1, s9, ra
                  xori         a1, t2, 1601
                  andi         t1, sp, -501
                  slli         zero, t1, 10
                  or           a4, s8, s9
                  andi         a4, s9, 542
                  slti         a7, s3, -1687
                  sub          a3, t5, s11
                  srl          s5, t5, s11
                  and          ra, s8, s8
                  sltu         s2, a3, ra
                  ori          t0, a2, -8
                  srai         s2, s6, 12
                  addi         s10, t4, -1548
                  addi         a7, s7, -588
                  and          a5, a3, t2
                  xor          s0, s6, s2
                  and          t5, a0, s9
                  srli         s5, a3, 16
                  add          s4, s3, tp
                  slti         s2, t2, 195
                  lui          s5, 331090
                  xor          tp, t6, ra
                  xor          zero, s0, s8
                  andi         a5, t2, 2008
                  addi         ra, s6, 1492
                  xori         s0, s2, -671
                  nop
                  sll          gp, s3, s6
                  auipc        s7, 807059
                  or           t6, s11, a2
                  sll          s9, s9, s4
                  slli         t4, s11, 24
                  auipc        a6, 49852
                  lui          s6, 480360
                  nop
                  andi         a6, s4, 489
                  ori          a1, t4, 1317
                  add          t2, sp, s4
                  xor          t5, s9, a3
                  andi         a1, t5, 1362
                  slti         t2, gp, 449
                  xor          s6, s3, s5
                  and          s2, s2, ra
                  srli         a6, a4, 10
                  addi         s11, t5, 317
                  sltu         t6, s11, s5
                  srai         s8, s9, 0
                  and          s9, gp, a3
                  xor          t5, s0, gp
                  xor          zero, t0, t1
                  slti         s10, a0, -1645
                  auipc        a6, 486347
                  slli         gp, t6, 30
                  sub          s8, t1, a2
                  or           a2, a0, s0
                  sll          a4, s9, tp
                  lui          a3, 152737
                  sra          s5, t4, a7
                  ori          a3, a4, 1336
                  sub          t1, s4, s6
                  andi         t1, t4, -1623
                  sltu         a6, t5, a0
                  add          t5, a0, a2
                  andi         s6, s2, 336
                  or           a4, s2, zero
                  lui          t2, 55
                  lui          t4, 510531
                  andi         s1, a0, 102
                  auipc        a1, 582557
                  lui          t2, 153741
                  slli         ra, a2, 27
                  ori          s6, tp, -1986
                  andi         tp, t1, 1620
                  or           a4, tp, a2
                  ori          t0, s6, -726
                  andi         s8, a6, 379
                  auipc        t2, 205142
                  slti         a4, s1, 1914
                  and          s11, tp, zero
                  sra          s8, a2, s0
                  srl          a3, t2, s4
                  sltiu        a2, a7, -916
                  srai         t1, zero, 1
                  sra          s11, ra, t5
                  or           a5, a2, s2
                  srl          tp, s4, a0
                  ori          tp, a1, 1614
                  and          a7, t0, t1
                  lui          s10, 860641
                  sub          a2, t0, a0
                  ori          s11, a7, 513
                  sra          a5, a6, s10
                  nop
                  nop
                  or           tp, s7, t6
                  ori          s5, t3, -195
                  srai         a4, s6, 16
                  and          a5, s8, s11
                  andi         s6, s3, -305
                  and          s6, t0, s7
                  sra          t4, zero, a7
                  slli         s0, tp, 16
                  srl          a5, s1, t5
                  xor          s8, s6, zero
                  sra          s4, t0, gp
                  nop
                  nop
                  xori         s1, t2, -1523
                  add          a7, t1, s7
                  slli         s10, a4, 25
                  lui          t6, 533212
                  ori          a7, s7, -90
                  slt          t4, t5, t5
                  srai         t3, s8, 9
                  xor          tp, s2, a7
                  ori          a2, a2, 769
                  and          t3, a1, s9
                  nop
                  srl          a3, s1, a2
                  srl          a4, s4, s6
                  and          s5, s6, t2
                  auipc        s1, 404714
                  slti         tp, sp, 945
                  sub          a3, tp, t3
                  xori         a5, a1, -140
                  srli         s5, a1, 22
                  auipc        a2, 467524
                  andi         a5, s5, 1773
                  auipc        s8, 98257
                  slt          t6, s0, t3
                  lui          a5, 476474
                  auipc        s5, 945355
                  srl          zero, t0, t0
                  xor          t5, s6, s7
                  sltu         s0, s5, t0
                  add          a7, s0, s5
                  srai         t6, s3, 24
                  auipc        a4, 109913
                  nop
                  lui          t2, 839935
                  sltu         s6, s6, a1
                  slt          s9, s6, t2
                  srl          t3, s10, s8
                  andi         s8, t4, 454
                  andi         t1, t5, -519
                  lui          a5, 480797
                  srli         tp, s2, 20
                  auipc        a1, 500029
                  nop
                  slti         a2, a3, -1638
                  lui          s2, 416885
                  or           s7, sp, t3
                  slt          zero, t2, s1
                  addi         a3, s4, -468
                  sub          a3, s2, s0
                  or           s9, a3, gp
                  and          s6, t2, s5
                  sll          s0, t3, s2
                  srai         t1, s4, 19
                  sub          s2, zero, t1
                  slti         a6, a3, 1054
                  xor          a1, s0, s5
                  sra          a3, a5, s5
                  nop
                  sltiu        s8, sp, -747
                  nop
                  slli         t0, s6, 27
                  slli         s8, s11, 8
                  sltu         s11, t4, t6
                  addi         s0, s11, -21
                  and          t3, s8, s7
                  ori          s11, t1, -985
                  xor          a3, t6, t1
                  ori          ra, s7, 782
                  nop
                  xori         t4, s0, 785
                  addi         s0, a7, -1319
                  xor          s7, a7, a4
                  addi         gp, s7, 701
                  slt          s5, s1, s5
                  nop
                  sltiu        s6, ra, -870
                  and          s7, a2, t0
                  sra          s9, s8, s10
                  sra          s2, ra, t4
                  sra          a4, a2, tp
                  slti         zero, ra, -1014
                  nop
                  sltiu        t5, s9, 1356
                  slti         t0, s3, 798
                  srl          s5, t4, s0
                  or           s2, s7, t0
                  srli         t3, t4, 0
                  lui          s5, 1040342
                  sub          s0, s5, gp
                  add          t1, s11, s0
                  or           s6, s4, s4
                  srai         s4, t3, 4
                  xori         t1, s2, -201
                  sra          t4, gp, t6
                  srl          s8, s4, a3
                  nop
                  slti         s4, tp, -1325
                  sll          s6, a0, s8
                  slt          s2, s4, s0
                  andi         tp, s4, -1793
                  sltu         a3, s2, a0
                  or           s4, s0, s4
                  nop
                  andi         s9, a1, -1292
                  sltiu        t4, s1, -267
                  slti         t2, a1, -787
                  sra          a5, t5, t0
                  add          s0, t5, sp
                  sub          t3, t2, t0
                  addi         t4, s10, 1645
                  slt          s6, a1, ra
                  srai         t4, s3, 20
                  nop
                  and          a5, s6, zero
                  sub          t3, a5, gp
                  srli         s7, gp, 4
                  sra          t4, zero, t0
                  srl          a2, t4, t1
                  slli         s10, s1, 18
                  nop
                  xori         s8, a7, -400
                  addi         s2, t6, 715
                  and          s4, s0, s2
                  slt          t3, s11, a5
                  slt          a3, a4, s11
                  xori         gp, s11, 1711
                  auipc        tp, 948360
                  sra          t6, t2, zero
                  xor          a6, a3, t4
                  sll          s0, a0, t4
                  sltiu        t5, s2, -487
                  srl          s6, a6, s0
                  ori          a6, sp, -1153
                  slti         s11, s8, 1038
                  or           s0, s11, s7
                  slt          s1, zero, s11
                  xori         s4, s0, 1511
                  srai         s8, s10, 9
                  sra          t3, s10, s0
                  slt          t5, s6, s3
                  lui          s8, 797181
                  sll          zero, s2, tp
                  srai         s1, s7, 30
                  auipc        s1, 348813
                  ori          s2, t5, 24
                  sra          t0, t6, s4
                  auipc        a2, 115528
                  sll          s2, s10, a0
                  sub          gp, t4, s5
                  sra          s5, s11, s9
                  xori         s2, a2, 1315
                  slli         s4, s11, 11
                  addi         t5, a7, -67
                  sra          s0, s3, s6
                  and          s6, tp, tp
                  sltu         t1, s5, s4
                  xor          s0, s8, s7
                  ori          a2, a4, -613
                  slt          t0, t3, t4
                  add          a5, t6, s4
                  sltu         s2, ra, s5
                  srl          ra, gp, t6
                  slt          s0, s6, s1
                  ori          s5, s1, -1142
                  slti         s4, a2, -345
                  xori         s7, s9, 566
                  auipc        t1, 972159
                  xor          s2, s3, tp
                  slti         s9, t6, -736
                  srli         tp, a7, 16
                  slti         s9, a6, 704
                  or           a2, t5, ra
                  sub          s1, t6, t4
                  slli         s10, ra, 26
                  or           a1, s3, sp
                  srli         t2, t2, 9
                  sra          a4, t5, s3
                  andi         s10, s4, -35
                  add          t4, t4, s3
                  sltiu        s6, s4, 872
                  slli         t3, s11, 29
                  auipc        a5, 586936
                  ori          t4, t3, -1333
                  or           t5, s4, a2
                  sll          a1, s4, zero
                  add          s4, t3, a0
                  andi         t1, s10, 1660
                  sub          s10, zero, a4
                  slti         s5, t3, 1427
                  auipc        t3, 773756
                  xori         s9, a3, -1813
                  sra          t2, t6, s4
                  srl          a2, t4, t5
                  andi         s1, t4, -870
                  andi         gp, t6, -825
                  andi         s1, t5, -726
                  srai         t1, s10, 15
                  nop
                  add          t1, t4, a3
                  and          t2, s10, s1
                  slli         s6, s0, 7
                  slti         s8, tp, -1304
                  add          a3, s7, s6
                  srli         s5, t0, 11
                  srai         s6, ra, 11
                  or           a1, a0, s0
                  sra          t2, s1, s3
                  sub          t1, s11, a4
                  nop
                  sltiu        s0, a2, -620
                  srl          t6, t1, gp
                  sltu         t4, t6, s6
                  auipc        t1, 1025150
                  sltiu        t1, a6, 1138
                  andi         s8, s2, -1135
                  andi         s8, s11, 1512
                  xori         a6, s4, -1184
                  slti         a6, s3, -193
                  sltu         s1, a1, gp
                  sub          ra, s2, t6
                  add          a6, s9, s11
                  nop
                  lui          t3, 416277
                  srl          s8, zero, s4
                  addi         t3, t4, -307
                  slli         s6, s11, 21
                  srli         t6, a6, 16
                  or           a2, s7, a3
                  xori         s11, a3, -1089
                  xori         ra, zero, -54
                  addi         s0, ra, 533
                  add          a7, a6, a5
                  ori          t6, a7, 1182
                  sltu         s9, tp, s8
                  slt          t0, s7, s4
                  sub          s2, a2, t3
                  srli         s5, s10, 19
                  slti         a5, s5, -1833
                  addi         a4, a7, -1213
                  sltiu        gp, s1, 1838
                  sub          s8, s3, s0
                  or           t4, sp, s8
                  auipc        t2, 503839
                  lui          gp, 211755
                  addi         a1, t4, 1930
                  sltiu        s1, s0, 1535
                  and          a6, s0, t1
                  srl          a3, s6, a4
                  nop
                  sll          gp, t0, s11
                  srli         ra, ra, 24
                  sra          t0, a1, s10
                  sub          t1, s9, a6
                  and          t1, tp, a4
                  nop
                  auipc        t5, 1006425
                  sra          s7, s6, a3
                  addi         gp, t0, 115
                  and          zero, a2, s7
                  xori         t6, t3, 32
                  sll          t6, s5, t3
                  slt          s9, a5, s8
                  nop
                  slt          s1, gp, s10
                  xor          s7, t4, zero
                  slti         s9, t5, 1717
                  andi         a3, s3, -1039
                  srli         s5, t0, 25
                  ori          s7, t4, -1468
                  lui          s0, 996475
                  sra          zero, s5, a1
                  slt          s5, t6, a7
                  xori         a4, t4, 1920
                  slti         s8, s8, 744
                  ori          a1, s9, -1171
                  auipc        s5, 787961
                  sll          a6, t0, s10
                  ori          t5, s11, 1589
                  slli         s0, t3, 28
                  slti         t4, t3, 1093
                  or           s2, tp, t6
                  nop
                  xor          s1, a5, s11
                  sub          s10, s3, t2
                  sll          s6, gp, t5
                  slt          t1, s2, s1
                  add          a5, a7, s6
                  nop
                  slti         s8, gp, -278
                  sub          a6, a3, a7
                  xor          a3, t0, a3
                  srl          a5, a3, s2
                  addi         t2, s4, -1976
                  addi         s9, a0, 1285
                  slti         zero, a2, 1511
                  add          tp, t3, a1
                  sll          s6, t3, s10
                  auipc        a1, 21467
                  xori         t4, t6, -1534
                  ori          t5, a4, -2038
                  slli         a2, t6, 3
                  srai         a4, a2, 28
                  srai         s9, t1, 6
                  srai         t0, s10, 14
                  sltiu        s7, s8, 517
                  auipc        s8, 683831
                  srli         a1, gp, 14
                  add          s11, s6, s10
                  or           t4, a5, s8
                  slt          a7, t6, a6
                  slt          zero, a0, a5
                  srli         t1, s8, 18
                  or           t5, ra, s10
                  sra          t6, s9, s5
                  addi         a2, a6, 536
                  sltiu        s0, a5, 1216
                  xor          a6, a1, s2
                  nop
                  sltiu        a6, gp, -297
                  xor          t4, t1, s7
                  ori          a2, t2, 1349
                  lui          a5, 179869
                  sltu         s0, a0, s4
                  addi         tp, a7, 467
                  xor          tp, s6, a3
                  lui          s6, 128511
                  srl          gp, s4, t5
                  auipc        t6, 582360
                  nop
                  xor          s1, s2, t6
                  srli         s11, s2, 21
                  lui          tp, 342638
                  addi         s11, s3, -83
                  xor          s5, s8, s2
                  sltiu        tp, ra, 1438
                  srai         tp, t4, 11
                  nop
                  andi         a5, a2, 1714
                  sub          t0, a0, zero
                  sra          a1, a2, s6
                  xori         t2, s7, -1545
                  slt          zero, t4, t3
                  slt          t4, a4, a4
                  sltu         a6, a1, tp
                  sltu         s5, gp, s2
                  ori          s5, s3, 707
                  slli         t1, t0, 6
                  lui          s6, 265002
                  andi         t2, a6, 365
                  srl          s6, a4, a5
                  auipc        s8, 37030
                  xori         a3, t1, 1475
                  andi         s9, t2, 921
                  or           t6, s2, a6
                  slt          t5, s11, s8
                  srai         a4, a1, 27
                  lui          s5, 843296
                  add          s9, s4, a7
                  sltu         t4, s6, t6
                  sltu         s5, s9, s6
                  srl          zero, ra, t4
                  slli         tp, ra, 21
                  ori          s2, s9, -119
                  sra          s10, a0, s8
                  xor          a7, t0, a0
                  srli         s0, zero, 1
                  add          t0, s10, a3
                  ori          t3, s1, -1355
                  sra          a7, s9, t0
                  nop
                  or           tp, t2, tp
                  xor          a7, t5, s2
                  sra          s4, s8, s5
                  slt          a2, t3, zero
                  sltiu        s6, a6, 911
                  xori         s5, a7, 354
                  srli         s9, s1, 18
                  sltu         s11, a4, ra
                  auipc        s9, 1028720
                  andi         tp, s0, -1667
                  xori         t0, t1, 1884
                  andi         a3, a1, -1939
                  sltu         s10, s8, s9
                  slt          t3, s1, tp
                  sra          ra, a0, a6
                  sltu         s5, s0, sp
                  sltu         a7, t0, a6
                  srai         tp, a3, 23
                  slt          a4, t3, s11
                  slti         t4, s11, 83
                  lui          t6, 957616
                  add          a5, s3, zero
                  srl          a7, gp, gp
                  sra          t5, s4, tp
                  lui          t3, 1013318
                  sltu         s11, t4, s1
                  srl          a5, t5, s7
                  auipc        a3, 439688
                  slti         a3, t2, 430
                  lui          s2, 480927
                  xori         a7, a3, -1606
                  sra          ra, s11, a3
                  xori         a7, t2, -566
                  or           a6, a3, ra
                  xor          s5, t0, s3
                  sub          ra, t2, s6
                  or           t4, a0, a6
                  xor          tp, s0, a2
                  slt          s8, a7, s3
                  slt          a1, s5, a7
                  slti         t2, s5, 187
                  andi         s4, a0, -694
                  slti         s9, a1, 540
                  srli         s10, t5, 15
                  and          a2, tp, t4
                  addi         s1, ra, 550
                  sll          ra, s8, t5
                  nop
                  add          s0, tp, t6
                  srl          t2, s10, t5
                  slt          s5, a1, s0
                  sltu         a5, t2, a5
                  slti         s11, tp, 95
                  addi         gp, t2, 260
                  slt          s9, ra, t2
                  sub          ra, tp, tp
                  sltiu        t4, s3, -635
                  sra          s11, s2, s11
                  auipc        t5, 254398
                  sltu         s1, t4, a2
                  sltu         t3, t3, a5
                  nop
                  sub          gp, gp, t4
                  sra          s1, a2, zero
                  sltu         t1, t1, s7
                  sltiu        s6, t2, 1375
                  srai         s6, t2, 29
                  sll          s0, tp, s8
                  add          t3, s7, t2
                  nop
                  slti         tp, s5, 1589
                  auipc        s7, 181091
                  auipc        a1, 377813
                  nop
                  andi         t1, s5, -1076
                  xori         t0, t1, -607
                  lui          zero, 966552
                  nop
                  and          gp, a2, a1
                  lui          zero, 793269
                  slli         a4, t5, 20
                  sra          a1, s9, a1
                  auipc        a3, 74845
                  add          t3, s3, s2
                  sltu         s11, t1, t2
                  ori          s9, t5, -325
                  srai         t3, s1, 18
                  sub          zero, s11, t5
                  ori          a7, t5, -74
                  sltu         a4, s9, a7
                  slti         s8, t3, -1965
                  sub          s0, s1, a0
                  sub          zero, a6, s5
                  srli         s8, s5, 19
                  add          t4, t5, t1
                  sll          t3, s4, s4
                  srl          s9, s2, a3
                  lui          a2, 154465
                  srli         a7, t2, 5
                  lui          s4, 849964
                  xori         t6, s0, -1240
                  and          ra, a1, a4
                  sll          a3, ra, a6
                  sll          tp, s11, s7
                  sll          t3, a4, a4
                  and          a5, ra, tp
                  or           a1, a3, zero
                  addi         t4, t1, 630
                  sub          a1, s11, a0
                  lui          s5, 716840
                  xori         ra, a1, 1581
                  sltiu        t4, s8, -1439
                  sll          zero, s10, zero
                  srli         tp, s2, 8
                  auipc        s5, 588655
                  slli         a1, s6, 25
                  sub          a1, a7, s10
                  srli         s8, s0, 20
                  srai         s11, s0, 16
                  slti         s11, s4, -1080
                  xori         a1, s9, 247
                  sll          t4, s4, a5
                  andi         s6, sp, 786
                  ori          a5, s8, 23
                  slti         s1, t4, -121
                  andi         s10, s5, -1132
                  lui          t2, 538126
                  sll          t4, a1, t3
                  xori         t3, t2, -1300
                  sra          s11, t1, a0
                  nop
                  ori          t2, s1, 1620
                  add          a3, t4, s5
                  slli         s6, tp, 21
                  slt          a5, s7, s0
                  sltu         s9, s1, t0
                  srai         s11, a1, 14
                  ori          s2, s3, -668
                  slti         ra, t0, 29
                  slli         a6, s7, 7
                  lui          s4, 872409
                  nop
                  nop
                  sltu         tp, t5, s4
                  srli         zero, a6, 24
                  srli         t1, s11, 3
                  addi         a3, a3, 1192
                  srl          a6, a5, s4
                  srli         s6, t1, 27
                  or           s5, a5, s1
                  slti         t1, s2, 1697
                  srli         t0, tp, 2
                  or           gp, s7, s5
                  sub          t5, sp, s3
                  ori          s10, s10, 1466
                  slt          t1, a0, s6
                  slli         a6, ra, 21
                  sra          s4, t0, t4
                  sltiu        t4, s1, -517
                  xor          s6, t1, gp
                  srai         s7, s2, 16
                  srai         s10, tp, 25
                  sll          t5, s8, s8
                  andi         a7, s5, -1828
                  sltu         s6, s5, t2
                  sra          t3, ra, s9
                  and          s1, sp, a0
                  xor          a2, gp, t6
                  add          s5, t4, s9
                  xori         s6, tp, 625
                  and          s11, s5, t3
                  sll          a7, a3, s4
                  slti         a6, tp, 1422
                  sltiu        t0, t2, 974
                  sltu         t6, s1, tp
                  andi         s0, s7, 944
                  sltu         t3, s10, ra
                  xori         a6, s10, -2037
                  srai         a4, t5, 14
                  xori         t1, s0, 251
                  nop
                  sub          t6, s6, a5
                  addi         s9, a5, -1702
                  sub          tp, a4, t4
                  or           s7, ra, a6
                  ori          s8, t1, 539
                  lui          s9, 243906
                  sub          t5, ra, a3
                  sub          t3, a0, gp
                  and          a5, a1, a6
                  sltu         a4, a0, s9
                  add          t5, a7, a2
                  xor          s2, s11, s6
                  srli         tp, s10, 4
                  sltu         ra, sp, gp
                  sltu         s7, t0, ra
                  andi         s7, s5, -1177
                  xor          t2, t3, a0
                  and          a4, s4, tp
                  sll          tp, t6, t6
                  srai         s1, s8, 9
                  sll          s6, a3, s1
                  sub          s6, s7, s4
                  sra          gp, t6, s10
                  sra          s8, zero, t3
                  andi         a2, t3, -1049
                  sra          s11, zero, s3
                  andi         s8, a7, 277
                  sub          a7, a6, gp
                  ori          t1, s9, 1763
                  sub          s8, s8, s5
                  slli         ra, s3, 31
                  add          t3, s3, a2
                  addi         t0, a6, -1886
                  sltu         s0, s10, t2
                  andi         t3, sp, -1599
                  auipc        s5, 94301
                  sll          s9, s0, s8
                  slti         gp, s2, 1153
                  slt          s11, tp, s1
                  sra          zero, s7, t5
                  sll          t6, s9, t1
                  and          s1, t4, s0
                  auipc        t1, 66647
                  sra          s8, ra, a1
                  andi         s2, t1, 1683
                  sltu         a6, sp, t5
                  sltiu        s9, s9, -1082
                  sub          a4, s1, tp
                  and          a3, tp, a0
                  slli         s10, t1, 26
                  srl          s9, s4, sp
                  or           zero, s2, ra
                  add          t6, s6, s9
                  srl          a4, s8, sp
                  and          t1, t2, a1
                  or           a2, s7, a3
                  sub          a7, t5, s1
                  slti         s8, a7, 1532
                  srai         s1, t6, 13
                  srai         s1, sp, 18
                  sra          s4, s11, t5
                  srli         s9, a7, 2
                  lui          a6, 106152
                  andi         ra, s3, -425
                  auipc        s5, 598573
                  sra          t5, s10, t2
                  or           a4, s10, s11
                  lui          t4, 542161
                  andi         a4, a4, 615
                  addi         t6, t5, -1875
                  and          gp, a5, a2
                  sra          a1, t6, a4
                  sub          s4, s3, a2
                  sltiu        gp, s3, -1884
                  xor          s8, s4, s1
                  slti         s7, a7, -131
                  srli         a4, a1, 3
                  xori         a7, a6, 1437
                  slli         s6, s2, 20
                  add          a7, t3, zero
                  ori          s5, gp, 1113
                  srli         tp, a1, 20
                  sll          s9, s9, s8
                  nop
                  slti         a4, s9, 1880
                  add          ra, gp, tp
                  srl          s0, a2, s2
                  sub          s2, a0, s6
                  slt          tp, t1, a1
                  srai         tp, s3, 28
                  ori          t6, s7, 1431
                  sra          a4, s9, t5
                  auipc        s10, 976963
                  or           t5, t0, s5
                  addi         t1, s4, 694
                  sll          s6, tp, s0
                  srli         s2, t5, 3
                  slli         a4, s0, 14
                  sltiu        s1, s3, -438
                  xor          s9, s3, gp
                  and          ra, gp, t3
                  nop
                  or           gp, a1, ra
                  sll          s0, a3, s3
                  slli         zero, gp, 27
                  nop
                  addi         a5, t5, 255
                  xor          t6, t0, a6
                  sll          a2, a0, s3
                  sll          s0, s5, s11
                  and          s6, t0, t2
                  sltu         t1, s2, t5
                  addi         s10, a3, -1480
                  sll          a5, s9, sp
                  auipc        s7, 482099
                  lui          a2, 316422
                  andi         tp, t3, 1356
                  addi         s7, t2, 1703
                  ori          s9, s4, 982
                  srai         a3, a5, 8
                  sub          t5, s6, a1
                  sll          t3, sp, t5
                  srl          t6, s7, t4
                  sltiu        t5, t1, -130
                  and          a2, a1, a3
                  xori         a4, s3, 208
                  srai         a7, ra, 22
                  sra          a4, a6, s4
                  sll          a2, t5, s7
                  slt          a2, a7, tp
                  andi         s5, t2, -655
                  slti         s10, s2, -330
                  sltiu        gp, gp, 631
                  slli         t2, s1, 22
                  sltu         t4, gp, a7
                  or           t2, t6, a0
                  srli         gp, t1, 3
                  add          a6, s2, s8
                  andi         s4, ra, 97
                  or           zero, t2, s3
                  add          zero, s0, s4
                  ori          s0, t5, -739
                  slli         t4, s4, 31
                  lui          t2, 723008
                  or           zero, gp, a1
                  auipc        s9, 96283
                  slt          a2, s0, sp
                  lui          a3, 156696
                  sub          t1, a7, t6
                  or           gp, s5, a3
                  srli         a3, a7, 9
                  andi         a6, a4, -1902
                  srai         a1, s0, 0
                  srl          a5, t1, a4
                  slli         a5, gp, 26
                  sltiu        a7, s2, 1761
                  auipc        s8, 254767
                  addi         s7, s2, -160
                  nop
                  srl          gp, t0, s5
                  slt          a6, s9, s8
                  or           s7, s7, s10
                  sltiu        s4, a5, -1986
                  sll          a7, tp, a0
                  or           a2, a5, zero
                  sra          t2, s4, t5
                  or           gp, tp, s6
                  sra          a3, s4, s1
                  slli         zero, t3, 4
                  slt          s5, tp, a4
                  xor          a2, s6, s10
                  srai         t3, a6, 14
                  auipc        s10, 835698
                  slti         a1, t1, 295
                  slti         s6, s8, -1453
                  sll          a2, s4, a1
                  sra          s5, t1, s9
                  addi         a1, s8, 742
                  srai         s8, s2, 1
                  srl          s10, s8, s10
                  nop
                  sub          t2, s9, a3
                  auipc        t4, 52896
                  auipc        s6, 404391
                  slli         s5, s1, 26
                  sltu         a4, t2, s7
                  addi         a7, s4, -1788
                  add          gp, t5, t1
                  sub          s7, s0, a7
                  ori          s7, gp, -947
                  nop
                  lui          tp, 152137
                  slti         s7, t4, 713
                  andi         zero, s1, 1070
                  and          a4, t5, t6
                  sub          s8, a5, tp
                  sub          zero, a5, a2
                  or           s2, s7, t4
                  srl          a4, s3, a4
                  sltu         s5, t1, a1
                  srai         s11, t2, 6
                  sub          t4, s9, a6
                  andi         s7, s8, 236
                  xor          t1, a3, t5
                  sltu         s5, a7, s5
                  srl          a7, gp, s4
                  sra          s11, s4, zero
                  sltiu        a5, gp, -433
                  add          s7, a1, t0
                  sll          s0, t3, zero
                  sub          s4, s3, s9
                  srli         s4, tp, 1
                  srai         s11, t2, 5
                  li           t6, 0x0 #start riscv_int_numeric_corner_stream_7
                  li           s4, 0x0
                  li           t2, 0x0
                  li           s5, 0x80000000
                  li           t0, 0xffffffff
                  li           s0, 0x80000000
                  li           s9, 0x98b34100
                  li           s10, 0x80000000
                  li           ra, 0xffffffff
                  li           t5, 0x0
                  addi         ra, ra, 1331
                  add          s9, t2, t2
                  sub          s9, t2, s5
                  auipc        t0, 573914
                  add          t2, t0, s9
                  nop
                  sub          s4, t5, s9
                  addi         t0, ra, 555
                  nop
                  sltu         gp, s3, t2
                  sltiu        t6, s7, -274
                  andi         ra, a2, -1974
                  xor          ra, ra, s0
                  srl          t1, s7, a2
                  ori          t3, a7, -510
                  srai         a7, a0, 1
                  sltiu        a7, sp, 1072
                  sra          a6, s4, s3
                  add          s11, s10, s0
                  nop
                  srl          t3, t1, s5
                  sub          ra, s11, t5
                  addi         s9, s2, 1803
                  auipc        tp, 473366
                  nop
                  add          t1, t5, sp
                  sra          s2, t1, a4
                  and          t5, s1, ra
                  or           s9, gp, s11
                  sltiu        s6, s5, 1635
                  srli         s9, a1, 0
                  add          s4, s0, s0
                  slli         s1, s3, 18
                  xor          gp, a2, tp
                  add          a7, a6, s4
                  srl          s5, t2, t1
                  ori          s10, t5, -1483
                  xor          a2, t1, a1
                  sub          t6, s1, gp
                  sltiu        a3, s4, 375
                  add          s5, s5, s6
                  ori          t6, t1, -1126
                  andi         s2, t6, 668
                  srai         s6, sp, 22
                  slti         s10, a0, 1614
                  srai         a7, t2, 26
                  sra          t4, a6, zero
                  andi         t0, s7, 1128
                  srli         t4, t5, 16
                  srl          s10, t6, s1
                  slti         t3, t1, -280
                  srli         tp, s7, 26
                  li           ra, 0xaf801b16 #start riscv_int_numeric_corner_stream_25
                  li           a3, 0xffffffff
                  li           s9, 0xffffffff
                  li           s5, 0xb6fdc30b
                  li           a6, 0xffffffff
                  li           t4, 0x0
                  li           s8, 0xffffffff
                  li           s10, 0x0
                  li           s4, 0x8d32c95e
                  li           t6, 0x80000000
                  lui          s4, 85229
                  nop
                  nop
                  add          s8, s4, t4
                  lui          ra, 928253
                  nop #end riscv_int_numeric_corner_stream_25
                  sra          t4, s7, a5
                  slti         a5, t1, -624
                  sub          a1, a4, a7
                  sltu         t2, a7, gp
                  srai         a3, a3, 6
                  slt          s2, s9, a0
                  ori          t4, sp, 574
                  slti         t3, a3, 67
                  ori          s11, s9, -1396
                  sll          s9, a6, s3
                  auipc        s11, 846259
                  sub          ra, s8, t0
                  sltiu        s11, s0, -528
                  and          s4, t2, a1
                  sub          t3, s3, t2
                  sltu         a5, t3, ra
                  addi         s5, s7, 1307
                  sltu         s5, s4, zero
                  lui          gp, 123503
                  slti         t3, gp, 1631
                  xori         s5, ra, -193
                  ori          a3, a7, 850
                  or           a2, s2, s8
                  or           t4, s8, a4
                  slli         s9, s9, 19
                  srl          t2, s2, s9
                  andi         s0, t6, -280
                  slli         t1, s1, 15
                  lui          t1, 391320
                  srai         t2, ra, 19
                  slti         t6, s5, -794
                  andi         s8, s1, 1090
                  and          zero, a3, s1
                  ori          a5, tp, 361
                  sra          s7, s1, a4
                  sub          s0, t5, a3
                  addi         a6, a0, 1337
                  andi         a7, gp, 109
                  lui          s0, 346194
                  and          t1, ra, t2
                  sll          s1, s5, t0
                  xor          a2, s0, s3
                  sub          a7, s0, t5
                  slt          ra, s7, ra
                  lui          tp, 57804
                  or           s2, a7, t0
                  and          t6, t1, tp
                  sub          t0, t3, a1
                  ori          a7, t1, -752
                  srl          a3, s1, s2
                  slli         s8, a4, 4
                  or           t6, a4, a2
                  srl          s7, s11, sp
                  sltiu        s11, tp, -942
                  srai         a6, a3, 27
                  andi         a7, t3, -70
                  add          a7, s7, s8
                  xor          s4, tp, t4
                  xori         s11, a4, -1426
                  srli         t5, a7, 27
                  add          s11, s4, s8
                  sltu         tp, s8, t6
                  nop
                  and          t0, ra, a4
                  xori         t6, s5, 117
                  slli         s5, gp, 5
                  sub          s0, s6, s6
                  sll          a3, ra, a3
                  srai         s0, t1, 1
                  and          t6, a1, s9
                  sub          s0, a2, t4
                  addi         s4, a7, -1071
                  srl          ra, s10, t6
                  sll          s10, t6, s7
                  srl          tp, s1, t0
                  srli         s10, s11, 28
                  or           t5, t1, s4
                  sltu         s7, a6, tp
                  addi         s7, s1, -588
                  srai         a3, s3, 17
                  srli         t0, s7, 10
                  xor          s4, t1, tp
                  xor          a2, sp, t4
                  auipc        t2, 651128
                  sub          s1, s3, a7
                  slli         s10, a0, 21
                  xori         t5, s5, -1176
                  ori          s7, t5, -618
                  slt          a7, gp, gp
                  addi         tp, a0, -1853
                  sub          a5, t3, a0
                  slli         tp, s10, 1
                  sub          gp, t5, sp
                  slli         s9, tp, 11
                  addi         t6, gp, 1703
                  sub          t4, t2, a4
                  sltu         s5, a4, t2
                  lui          a3, 556055
                  andi         a5, gp, -1296
                  xori         t0, a1, -269
                  srl          t4, gp, s2
                  li           t4, 0xffffffff #start riscv_int_numeric_corner_stream_21
                  li           a3, 0xa09dbfb0
                  li           s8, 0x80000000
                  li           s5, 0x0
                  li           s4, 0xc915d407
                  li           a7, 0xffffffff
                  li           a4, 0x80000000
                  li           t5, 0xffffffff
                  li           tp, 0x80000000
                  li           a6, 0x80000000
                  auipc        t5, 463174
                  auipc        s5, 624616
                  addi         s5, s5, 1698
                  lui          a7, 90269
                  lui          tp, 61556
                  nop
                  nop
                  add          t4, s8, t4
                  xori         a5, s8, 1822
                  sra          s11, t3, s5
                  sll          s10, a2, s2
                  auipc        a6, 214806
                  srl          a3, a6, a5
                  auipc        t2, 465444
                  srli         a2, a0, 15
                  srai         s4, s10, 4
                  xori         t2, a7, 1879
                  sub          a2, s7, t5
                  add          t1, a0, a5
                  srai         a3, s11, 10
                  li           a5, 0xffffffff #start riscv_int_numeric_corner_stream_18
                  li           t1, 0x0
                  li           s8, 0x125d542a
                  li           ra, 0x8cdb0f64
                  li           s0, 0xffffffff
                  li           s10, 0xc6c401d0
                  li           t0, 0x0
                  li           t6, 0x0
                  li           s1, 0x80000000
                  li           t4, 0xffffffff
                  nop
                  sub          s8, t1, t6
                  auipc        s8, 251520
                  lui          t0, 480885
                  lui          t0, 656385
                  addi         ra, s10, -729
                  lui          s8, 338034
                  lui          s8, 136752
                  lui          t6, 391219
                  auipc        s10, 763373
                  lui          ra, 400230
                  lui          t6, 713254
                  auipc        s1, 548944 #end riscv_int_numeric_corner_stream_18
                  ori          t3, a4, 465
                  sltiu        t0, t0, 815
                  slt          t3, s11, tp
                  auipc        a2, 204618
                  auipc        s9, 809471
                  slt          a2, a1, t3
                  srl          a7, sp, s10
                  addi         a5, a1, -1618
                  srl          a4, s8, a0
                  xori         s0, s1, 965
                  and          s7, t0, s7
                  slti         tp, s6, -1751
                  slt          s10, s11, t4
                  sub          a1, a7, ra
                  sltiu        tp, t2, -2013
                  srai         s8, t2, 12
                  sra          t0, a0, t2
                  slt          s4, s2, s2
                  andi         t2, s4, 761
                  addi         t0, a7, -208
                  sub          a6, gp, a4
                  ori          a1, gp, -1977
                  sltu         t2, s1, a6
                  srl          s6, gp, tp
                  auipc        s0, 61675
                  slt          tp, sp, a3
                  sll          s6, t6, a7
                  slt          gp, t5, s2
                  or           s11, s8, gp
                  nop
                  ori          a2, s1, -1923
                  ori          s8, s1, -930
                  xor          t3, s11, t4
                  andi         t6, s8, 1762
                  sub          a6, s1, s11
                  and          a3, s6, s0
                  addi         s7, t4, -1421
                  add          zero, zero, s0
                  ori          a3, s6, -1202
                  addi         a1, s6, -1779
                  and          s10, s4, a4
                  xori         t1, t0, 930
                  auipc        s1, 299033
                  sltu         s7, s4, s0
                  slti         a3, zero, 54
                  slti         t4, t6, 453
                  add          a7, s6, t0
                  auipc        s2, 366133
                  sll          s7, a7, s1
                  xor          tp, a4, a1
                  srl          s9, s2, a3
                  sra          a1, s10, t5
                  slli         s1, zero, 30
                  xor          zero, t2, s0
                  xori         s2, s10, 262
                  and          a7, a5, t6
                  srl          s1, a2, a6
                  and          t2, a1, a5
                  sltu         a4, tp, zero
                  ori          s6, gp, 471
                  sra          s2, s0, t5
                  and          t4, zero, tp
                  srli         s9, s7, 23
                  nop
                  andi         a1, s3, -520
                  lui          s11, 15829
                  sll          s6, a4, a7
                  sltiu        t6, s4, -247
                  sltiu        zero, a0, 1188
                  lui          s5, 954804
                  add          t2, s11, t1
                  srai         a3, s5, 5
                  or           s0, tp, s3
                  or           a5, zero, a2
                  ori          a5, a6, -92
                  slt          gp, a4, zero
                  slli         a3, zero, 30
                  srli         t1, s8, 8
                  xor          t0, s1, s11
                  add          zero, s5, s4
                  ori          s5, a1, -690
                  xor          ra, s4, zero
                  xor          zero, a4, t4
                  slli         ra, gp, 14
                  xori         gp, a2, -228
                  slti         s5, s11, -486
                  xori         t1, s11, -1764
                  slt          t6, t2, t5
                  srli         a4, a1, 26
                  addi         s4, ra, -971
                  auipc        a1, 71189
                  add          s9, a4, s6
                  auipc        t3, 639860
                  andi         gp, s5, -1654
                  and          t0, a2, s8
                  nop
                  andi         a7, s10, -1083
                  li           s11, 0xffffffff #start riscv_int_numeric_corner_stream_30
                  li           a7, 0x993da936
                  li           t6, 0x0
                  li           t3, 0xcec01988
                  li           t0, 0x45077b83
                  li           s2, 0x80000000
                  li           t5, 0x80000000
                  li           t4, 0x0
                  li           s7, 0x80000000
                  li           s5, 0x6584c3e0
                  auipc        s11, 502512
                  auipc        s5, 667915
                  addi         t4, t4, 1221
                  nop
                  sub          s2, t3, t3
                  sub          s7, s5, a7 #end riscv_int_numeric_corner_stream_30
                  addi         tp, s8, 2038
                  xor          s2, s1, t5
                  sra          a4, s0, sp
                  slt          a2, ra, s2
                  sltiu        a5, s3, 184
                  sltiu        t3, zero, 549
                  or           t0, s10, s10
                  slti         t1, t0, -1618
                  or           s7, gp, s3
                  add          zero, s1, s8
                  sra          s7, t2, a7
                  ori          a2, t0, 1767
                  slti         tp, a6, -1753
                  srl          s7, s2, ra
                  add          ra, a3, t6
                  addi         t3, sp, 854
                  or           t4, s11, t5
                  nop
                  sub          a3, t0, a4
                  auipc        s2, 113270
                  slt          a5, s1, s8
                  sltiu        s2, s4, -1336
                  srl          s9, s3, s5
                  ori          t6, tp, 772
                  slt          a6, s5, s7
                  sll          zero, a5, s6
                  slt          s6, t0, a7
                  add          t3, a5, t3
                  srli         s0, t4, 28
                  xor          s1, ra, s2
                  xor          s8, s9, zero
                  li           s1, 0x8ab27bda #start riscv_int_numeric_corner_stream_5
                  li           s2, 0x52d908c0
                  li           t6, 0x80000000
                  li           a2, 0x80000000
                  li           a4, 0x0
                  li           s11, 0x0
                  li           a5, 0xe0caaf49
                  li           tp, 0x80000000
                  li           a1, 0x0
                  li           s5, 0x80000000
                  addi         t6, s1, -2007
                  auipc        a1, 312597
                  add          s1, a5, s5
                  add          t6, a4, a5
                  addi         a2, tp, -1235
                  addi         s11, a4, -162
                  nop
                  srli         s2, a2, 12
                  slt          tp, s11, a5
                  sra          a5, s9, s1
                  lui          a4, 854596
                  and          gp, s3, s3
                  srai         s2, s5, 18
                  srai         a1, s1, 9
                  slt          zero, s5, a1
                  sub          s7, t2, a0
                  lui          s10, 407755
                  andi         t0, t6, 1866
                  add          t0, a4, zero
                  nop
                  addi         s1, s4, 1424
                  or           s9, a6, t5
                  slti         zero, gp, 422
                  addi         zero, t4, 1640
                  xori         a4, a5, -1007
                  nop
                  sltu         a2, a2, a7
                  and          s8, t5, t5
                  sltiu        a7, a2, 1062
                  addi         t0, s0, 1487
                  srli         t6, t3, 2
                  slt          ra, zero, s3
                  lui          s2, 782080
                  sra          s4, t5, a7
                  srai         s10, t4, 28
                  addi         s9, tp, 1590
                  srl          zero, s9, s3
                  srai         s1, a3, 5
                  lui          t6, 784226
                  sltiu        s8, s10, -1997
                  addi         s5, zero, 1436
                  auipc        a7, 774191
                  sltiu        s1, s11, -1136
                  sub          t4, t6, t1
                  xori         s7, sp, -1078
                  and          a6, a3, tp
                  srai         a4, s9, 7
                  sltiu        a1, a0, 1451
                  sltiu        s7, gp, 2001
                  add          s10, a7, s3
                  slti         a7, s3, -535
                  nop
                  sltiu        zero, gp, -1022
                  andi         a2, s9, 67
                  slli         tp, s8, 23
                  xor          t2, zero, s7
                  srai         a3, s2, 28
                  slt          s9, gp, gp
                  xori         gp, t4, 1900
                  srai         s0, s4, 6
                  andi         a5, a3, -1732
                  or           s8, t5, t4
                  sltu         t2, a3, t2
                  andi         a1, a4, -1406
                  or           a7, sp, t6
                  ori          s4, zero, -1044
                  srli         zero, t6, 11
                  srai         s11, a0, 18
                  srli         s6, a4, 15
                  sltu         s11, t6, s3
                  xori         s11, a0, -1557
                  auipc        s8, 309958
                  xor          s4, tp, s3
                  sltiu        a5, s8, -1270
                  slt          a4, a1, s1
                  sltiu        tp, a3, -710
                  sll          a6, t6, t2
                  auipc        t4, 897930
                  sll          a5, s3, t2
                  addi         s0, s4, -1085
                  auipc        t5, 25392
                  slt          s10, t2, a2
                  xori         t3, s5, 40
                  slti         s8, s9, -1488
                  srli         t3, t5, 22
                  sltiu        t6, a7, -1149
                  slt          s6, a0, t2
                  sub          t1, a1, s8
                  auipc        s6, 505428
                  auipc        s4, 257637
                  lui          t0, 918461
                  auipc        a2, 140707
                  srai         a2, s6, 14
                  nop
                  srai         s9, a7, 10
                  srli         s7, t3, 2
                  sra          s6, gp, t0
                  add          s9, a6, s4
                  add          s0, a3, s2
                  sub          a4, sp, sp
                  auipc        a1, 120296
                  nop
                  sltiu        s1, s2, -881
                  add          s9, s11, t6
                  slli         a1, s6, 27
                  ori          a2, s6, 1345
                  andi         s10, a2, -1256
                  sra          a2, a7, a6
                  nop
                  or           a1, ra, a5
                  xori         s6, s1, -739
                  lui          s0, 538924
                  srai         zero, a3, 15
                  sra          s9, ra, sp
                  ori          t4, s11, 1389
                  srl          a4, zero, t3
                  xori         s6, s0, -795
                  srai         s10, s5, 25
                  srl          a3, a2, t6
                  andi         a5, a6, -410
                  slt          s4, a4, tp
                  slt          s2, s5, s3
                  add          a1, a5, a2
                  srli         s4, s3, 1
                  li           a3, 0x80000000 #start riscv_int_numeric_corner_stream_17
                  li           s5, 0xd2f968a6
                  li           s4, 0x0
                  li           tp, 0xffffffff
                  li           t0, 0x80000000
                  li           t3, 0x0
                  li           s10, 0x80000000
                  li           s11, 0xf1dc9374
                  li           a4, 0xffffffff
                  li           s8, 0xffffffff
                  add          s11, a3, tp
                  auipc        t0, 56963
                  addi         s4, a4, -1930
                  sub          a4, t3, t0
                  lui          t0, 671204
                  addi         s5, a3, -1034
                  lui          s5, 747224
                  auipc        s5, 934185
                  sltiu        a1, a3, 1364
                  ori          t5, a3, 1101
                  sll          t6, s2, t3
                  add          t3, t4, ra
                  lui          t3, 285946
                  ori          s7, ra, 741
                  xori         t5, t6, 721
                  lui          gp, 457310
                  srli         t3, s2, 2
                  nop
                  or           a6, t6, s7
                  slli         a6, t6, 25
                  nop
                  ori          s5, a0, 737
                  slt          gp, s11, s9
                  slt          s6, t6, s9
                  addi         s8, s2, 812
                  srl          zero, t0, t2
                  ori          s7, a5, 1524
                  nop
                  andi         s2, s5, 338
                  sltu         ra, t0, gp
                  addi         s10, a7, 1082
                  and          t2, s6, t5
                  srai         s8, t4, 15
                  sltiu        a6, tp, 1350
                  li           a6, 0x80000000 #start riscv_int_numeric_corner_stream_13
                  li           t2, 0xb286d0bf
                  li           a3, 0x0
                  li           s9, 0x80000000
                  li           t6, 0xe78b3bd7
                  li           gp, 0xffffffff
                  li           a4, 0x80000000
                  li           s10, 0xa6290404
                  li           s5, 0x5280d01d
                  li           s1, 0x0
                  add          t6, a6, a4
                  add          s5, t2, s9
                  auipc        s9, 510139
                  srai         t4, a2, 0
                  srl          s9, s0, gp
                  nop
                  srli         s10, t2, 18
                  slli         s9, a5, 2
                  srai         a7, s0, 4
                  and          t0, ra, a6
                  srli         s4, s8, 15
                  slli         a7, gp, 15
                  xori         a1, s1, 1670
                  add          zero, a1, a5
                  sltiu        t2, s1, 487
                  lui          t6, 632216
                  srai         t6, s0, 23
                  and          t5, a0, a5
                  ori          a2, t4, -1166
                  slti         s10, a6, -776
                  srl          s6, a5, t4
                  slt          s0, a1, sp
                  sra          s4, s2, t1
                  ori          a3, a4, -1981
                  srli         s4, s8, 0
                  srai         a2, zero, 18
                  srl          a4, s10, a3
                  lui          t3, 28532
                  srl          s8, s0, a6
                  sltu         t4, s0, a4
                  or           s0, s4, a1
                  srai         a4, sp, 26
                  sub          t0, t5, t4
                  sll          ra, s0, t3
                  slti         s0, t0, -1952
                  addi         s9, a6, -1100
                  slli         tp, tp, 1
                  or           a7, a1, a5
                  sra          s8, a1, s6
                  or           t2, a1, t5
                  srli         zero, a2, 28
                  auipc        t5, 83041
                  srai         s9, gp, 27
                  xori         t1, sp, 91
                  srai         s1, t0, 29
                  lui          s0, 718365
                  sra          t2, a5, t3
                  or           t1, s10, a7
                  slti         a4, s6, 1896
                  slti         t3, a1, 137
                  add          t6, ra, s7
                  xori         a2, a5, 108
                  slli         s4, s2, 29
                  slt          s9, t6, s4
                  sub          s10, sp, s4
                  srl          s2, a1, a2
                  sra          a7, tp, a6
                  srli         t6, s6, 13
                  sltu         s6, a5, t4
                  xori         a3, s7, -632
                  slti         s1, a4, -469
                  lui          gp, 300185
                  srli         ra, t5, 4
                  and          s2, ra, a0
                  auipc        s5, 51381
                  xori         ra, s10, 1003
                  nop
                  and          s4, t1, tp
                  sll          t5, s8, s3
                  sub          a3, t3, s0
                  xori         a2, t3, -255
                  slli         t5, a7, 11
                  sltu         t5, s0, s0
                  xor          t4, s1, zero
                  slli         s11, s2, 9
                  nop
                  slt          s11, gp, t4
                  and          s1, s3, a4
                  and          t1, s2, t0
                  sub          s0, s2, s6
                  andi         s8, t2, 795
                  and          s2, t5, s4
                  slli         tp, s0, 5
                  xori         t3, t0, -1298
                  sltu         s6, t5, t0
                  nop
                  sltu         s7, s0, zero
                  xor          a4, s6, a0
                  slt          a6, s0, t1
                  srl          s2, s8, a3
                  slli         s11, s7, 16
                  andi         zero, a6, -578
                  ori          s6, a0, -198
                  ori          a7, t1, 1392
                  lui          t3, 514434
                  slti         s8, s1, 196
                  srl          a6, a2, a7
                  sltu         zero, s4, a5
                  srai         a4, s2, 28
                  andi         ra, a4, 1020
                  nop
                  and          t6, t0, t3
                  sltiu        s8, a1, -1803
                  srai         a1, s4, 27
                  andi         zero, t1, 341
                  srai         t5, t2, 30
                  sra          a7, s1, a5
                  sll          s0, sp, s3
                  srai         s10, a6, 15
                  xor          s11, a7, a1
                  sltiu        t0, s8, 652
                  sltu         a4, a6, a2
                  lui          s6, 957485
                  sll          s4, tp, a7
                  or           t3, a4, s4
                  srli         ra, a7, 27
                  sll          t5, t0, t3
                  add          s1, s5, a7
                  sll          a5, a1, t5
                  slt          s11, a3, a4
                  sub          a3, a6, a7
                  srl          s0, s3, a3
                  sub          zero, s8, t1
                  ori          s8, ra, -675
                  ori          a4, t6, 2046
                  slt          s0, zero, t2
                  sub          tp, sp, sp
                  and          t5, a6, s3
                  addi         s0, tp, 1707
                  srai         s1, zero, 13
                  nop
                  sltiu        s6, a2, 825
                  slt          t4, a6, s3
                  ori          s2, t2, 1662
                  srl          s0, t5, s6
                  sltu         s0, s7, t5
                  slti         t3, gp, 1214
                  or           s11, a6, zero
                  andi         a5, sp, -1191
                  sra          s9, sp, t3
                  lui          a6, 13259
                  sltiu        s2, a1, -1766
                  addi         t2, a0, -705
                  sltu         t3, s1, s0
                  addi         gp, s9, 1159
                  or           s4, t2, s9
                  sra          t0, a5, s7
                  andi         t2, s5, -1628
                  slli         a4, s4, 28
                  sub          s5, s7, s0
                  lui          a5, 923047
                  xori         tp, s0, -279
                  srl          a1, t2, a3
                  slli         t0, s5, 3
                  add          ra, a0, s8
                  auipc        a7, 527245
                  nop
                  slti         t0, s8, 1979
                  slti         s5, t4, -158
                  slli         s10, t3, 0
                  xori         t0, a1, 857
                  auipc        s5, 592115
                  andi         t4, gp, 300
                  slli         t5, sp, 25
                  xor          a4, s4, s6
                  slti         s11, a4, -359
                  slt          s6, t6, tp
                  sltiu        a6, a2, 877
                  auipc        t0, 799839
                  sltiu        s7, s9, -1274
                  srli         s4, s2, 10
                  add          t5, s11, s6
                  slt          gp, s2, a5
                  auipc        a1, 790223
                  sltiu        ra, t0, -1784
                  sltu         t4, s5, t3
                  or           gp, s3, t4
                  slti         s11, t6, -1281
                  xor          s0, t5, s5
                  andi         tp, t0, -555
                  slt          a3, a3, a3
                  sltu         tp, s3, s5
                  srai         a2, t4, 18
                  xori         s8, t1, -908
                  srl          s2, s6, s8
                  srl          s10, s5, tp
                  nop
                  xori         a6, a5, 1204
                  auipc        t3, 925462
                  sltiu        a3, a6, -129
                  nop
                  slt          s10, sp, t6
                  slt          ra, s4, a5
                  slti         a3, tp, -738
                  xori         s6, t1, 185
                  auipc        a7, 274287
                  sra          a3, a6, s8
                  auipc        s5, 716580
                  xori         a2, ra, 1308
                  ori          tp, a5, -466
                  or           t3, s6, s11
                  slli         zero, a4, 15
                  add          a6, a3, a7
                  andi         t0, s0, -821
                  andi         t4, t0, -810
                  ori          s9, t1, 1873
                  and          t3, s2, s2
                  srli         s11, s11, 9
                  lui          a7, 160669
                  nop
                  addi         s2, a7, 1878
                  lui          a2, 1003351
                  srli         a5, a7, 5
                  sra          t4, zero, s3
                  or           s0, s2, a5
                  sll          s8, s11, a5
                  sltu         s2, a3, s8
                  srli         a5, s5, 30
                  nop
                  nop
                  nop
                  srl          gp, t3, s1
                  ori          t0, s11, -1434
                  addi         s8, a5, -823
                  srli         s8, sp, 24
                  addi         t1, a0, 753
                  slti         t0, ra, 288
                  sltu         t1, a1, t3
                  add          a6, gp, s11
                  sra          t3, a3, s2
                  srl          zero, t4, s9
                  auipc        zero, 712577
                  and          s6, s9, s8
                  srai         t1, s6, 17
                  sra          s9, zero, s9
                  sltiu        a6, s8, 795
                  sub          s0, t1, ra
                  or           zero, gp, zero
                  auipc        a2, 436657
                  srl          s5, t0, t6
                  srl          a2, t2, a3
                  xori         a4, t3, 882
                  lui          s0, 524997
                  nop
                  ori          s4, s1, -719
                  ori          gp, s6, -1797
                  sra          a1, a7, s5
                  sra          s2, zero, s6
                  lui          s10, 557587
                  sltu         a4, s9, a5
                  srli         t1, s11, 28
                  srai         s11, sp, 1
                  lui          s5, 145501
                  srai         t4, a4, 18
                  sltu         gp, s9, s5
                  lui          s7, 668127
                  auipc        s0, 224881
                  sra          t0, t3, s11
                  lui          a4, 982886
                  srai         s0, t6, 31
                  srai         t2, s0, 3
                  ori          t6, s9, -1912
                  sub          a7, a7, t3
                  ori          t2, t4, -1320
                  addi         s8, s7, 69
                  xor          a6, s11, s11
                  srai         s4, ra, 0
                  or           t0, ra, a0
                  slt          t2, t6, gp
                  lui          t2, 728880
                  lui          t3, 419086
                  and          gp, a4, s8
                  add          s8, a6, s11
                  andi         t6, t0, 1402
                  and          s10, t5, gp
                  ori          t5, a1, -613
                  sltiu        tp, s4, -1702
                  nop
                  sra          s7, a3, t3
                  srai         a7, t2, 18
                  srl          a4, ra, s2
                  nop
                  srl          zero, ra, tp
                  srai         s9, s3, 26
                  and          s11, t0, ra
                  slt          t4, s0, s10
                  sub          t2, a2, s4
                  and          t2, s9, t4
                  slti         gp, a0, -1782
                  ori          tp, t3, 1633
                  auipc        t0, 293408
                  or           t4, t5, a2
                  slt          s7, s7, t4
                  srl          s10, zero, s5
                  sltiu        ra, sp, 1097
                  add          t2, a0, zero
                  sra          a5, t0, s1
                  sra          a7, a0, gp
                  sltiu        s5, a3, 419
                  auipc        tp, 578139
                  or           t6, a7, t2
                  slli         s0, t6, 8
                  add          s1, t0, tp
                  slt          zero, s8, t1
                  andi         a5, s3, 1551
                  xor          a4, s0, t4
                  srli         s6, tp, 25
                  sra          t3, s8, s0
                  xor          t2, s8, t0
                  lui          t6, 893729
                  add          t0, a4, sp
                  slli         a2, a2, 6
                  slti         t5, s5, 601
                  ori          t6, a3, -1818
                  xor          s11, s11, zero
                  nop
                  ori          a5, s3, -450
                  nop
                  and          s0, s3, s11
                  auipc        a4, 259854
                  or           a4, t5, a6
                  srli         a7, t5, 24
                  auipc        zero, 388586
                  add          a1, t6, s8
                  srli         a5, s9, 3
                  srl          gp, a6, t3
                  nop
                  or           s0, gp, a3
                  li           t3, 0x0 #start riscv_int_numeric_corner_stream_33
                  li           t6, 0xe862265e
                  li           t2, 0x80000000
                  li           s5, 0x0
                  li           ra, 0x80000000
                  li           s9, 0x4ec80d23
                  li           a6, 0x63b109d
                  li           s11, 0x80000000
                  li           t0, 0x33ab1409
                  li           s7, 0xffffffff
                  lui          t2, 191923
                  addi         ra, t0, -953
                  addi         s5, s9, 1553
                  add          ra, s5, t0
                  auipc        t3, 805403
                  addi         s11, t2, 1117
                  lui          s5, 22214
                  auipc        t3, 642182
                  lui          s5, 774666
                  add          t3, t3, t6
                  auipc        t3, 179794
                  andi         ra, ra, 552
                  srl          t2, a6, s8
                  srli         ra, t5, 12
                  srli         s5, s2, 26
                  andi         zero, ra, 1888
                  and          t4, ra, t0
                  add          ra, a1, s9
                  sltu         a6, t3, s5
                  lui          s5, 8647
                  xori         t0, s4, -605
                  slt          a3, a2, s3
                  add          tp, s9, tp
                  sub          t5, a3, t1
                  sltiu        s0, a3, -478
                  nop
                  xor          t5, tp, s3
                  sra          s7, t0, a1
                  slti         s9, s3, 1066
                  sra          a1, s1, sp
                  andi         gp, t3, -770
                  sra          t3, s9, s4
                  sub          a4, a4, s1
                  ori          a3, t3, 1678
                  srli         a1, t2, 2
                  slt          a7, sp, sp
                  sltu         ra, t2, s3
                  lui          t6, 699184
                  srli         s1, s2, 30
                  slti         t2, t6, 1767
                  sltiu        s6, a1, 1370
                  andi         a6, s7, 968
                  sra          t2, a6, s2
                  lui          t4, 263207
                  sll          t1, a2, a1
                  slt          s1, t4, t4
                  and          s0, s8, t6
                  sub          t1, t6, a4
                  auipc        s2, 820850
                  sll          t2, a4, s0
                  sll          s2, s4, t5
                  ori          a4, a7, -644
                  sll          s0, t6, a1
                  srl          tp, s10, s0
                  sll          s4, ra, s4
                  sll          ra, a3, t0
                  slli         s7, s7, 17
                  add          a2, a5, a5
                  lui          s9, 786777
                  addi         s10, t3, -318
                  slli         tp, t3, 24
                  sub          s9, ra, s10
                  lui          zero, 191022
                  add          t4, s0, s6
                  sra          s10, a4, gp
                  sltu         t6, zero, zero
                  sltu         s10, zero, zero
                  andi         t6, a7, 1883
                  sub          s2, t4, tp
                  sltu         t0, s8, s9
                  or           t4, s8, t0
                  sltu         tp, sp, s3
                  ori          s8, ra, 1542
                  srli         a3, sp, 12
                  xori         t1, a1, -1684
                  addi         a6, s5, 642
                  srl          s1, tp, zero
                  xor          t0, sp, tp
                  sub          a2, s1, a5
                  slti         s1, s9, 883
                  sra          ra, s10, s6
                  sub          t1, ra, s10
                  and          s9, s7, t4
                  xori         s9, s8, -905
                  xori         ra, s4, -755
                  sub          a7, t1, a4
                  srli         s11, t1, 18
                  slli         t4, s6, 12
                  ori          zero, zero, 573
                  auipc        a1, 30570
                  xor          t1, a5, s9
                  srli         s9, t1, 23
                  xor          s1, s11, t5
                  and          a2, s5, t1
                  nop
                  addi         s1, s1, -1106
                  sra          s10, zero, a1
                  srli         s2, s7, 21
                  srli         s8, a2, 0
                  or           gp, t3, t4
                  srl          a3, t2, s0
                  srl          s2, t5, a5
                  add          tp, zero, t4
                  add          a7, sp, s10
                  auipc        gp, 685813
                  xori         a4, a3, 808
                  sll          ra, s0, s10
                  lui          s8, 1001219
                  addi         t0, t2, -1709
                  srli         s11, s2, 8
                  srai         a3, s7, 10
                  srli         s1, s7, 2
                  srai         t4, a0, 0
                  addi         s11, s6, -482
                  addi         s4, t3, -1211
                  slti         t6, a2, -1009
                  xor          s10, a1, zero
                  addi         s2, a4, 416
                  addi         a7, s11, 932
                  addi         ra, s11, -28
                  xor          t6, s2, s3
                  add          t3, a7, a0
                  auipc        t0, 361318
                  sub          s10, s8, s6
                  sltiu        t6, t2, -641
                  slli         ra, s3, 7
                  auipc        a3, 80093
                  nop
                  srl          tp, s9, s0
                  srl          a2, tp, a0
                  lui          s1, 110824
                  addi         s10, a1, 839
                  or           s9, a7, t3
                  sltu         s4, s2, s6
                  addi         s2, a2, 62
                  srli         tp, a3, 26
                  nop
                  nop
                  slt          t5, s10, s6
                  nop
                  sll          t1, t6, ra
                  add          s4, s3, a7
                  sub          a4, sp, a0
                  srl          a5, sp, t3
                  and          t3, a3, s0
                  and          s4, t6, t0
                  or           tp, t1, sp
                  andi         a4, a4, 1921
                  sltu         a2, t1, s3
                  auipc        t6, 770795
                  ori          s8, s1, 1117
                  sra          a4, a6, a0
                  lui          gp, 413167
                  or           t1, zero, s3
                  sll          s2, gp, a1
                  li           s6, 0x80000000 #start riscv_int_numeric_corner_stream_29
                  li           t5, 0x80000000
                  li           t3, 0x80000000
                  li           s7, 0xffffffff
                  li           ra, 0x0
                  li           t1, 0x80000000
                  li           s8, 0x80000000
                  li           gp, 0x0
                  li           a5, 0xffffffff
                  li           s4, 0x80000000
                  lui          s7, 382382
                  nop
                  sub          s6, ra, s7
                  addi         s6, t3, -1523
                  nop
                  lui          gp, 296921
                  slli         s8, a0, 2
                  sra          tp, s2, s8
                  andi         s4, s6, -772
                  sra          s5, sp, a7
                  sltiu        s1, t1, 202
                  slti         s11, s0, -1711
                  xori         a1, a0, -723
                  xor          a6, s2, s6
                  sra          a1, tp, s4
                  ori          ra, s8, -1120
                  andi         a6, s3, -710
                  srli         a4, ra, 11
                  srli         t1, s4, 27
                  xori         s0, a3, 409
                  slli         s1, s9, 16
                  sub          t4, t6, s1
                  lui          zero, 679680
                  srai         a1, gp, 12
                  andi         a2, ra, 393
                  srli         t3, t4, 15
                  sub          a5, s10, t4
                  addi         s5, t5, 1289
                  nop
                  and          s9, s11, s2
                  lui          tp, 1003818
                  and          a6, a3, a4
                  xor          gp, a4, t4
                  xor          s4, s10, s5
                  slti         t1, s11, 747
                  sll          s8, s0, s8
                  auipc        a5, 813138
                  xori         t1, s1, -1263
                  auipc        s4, 823948
                  sub          t2, tp, a4
                  ori          s5, t4, -572
                  slli         s10, t3, 27
                  srai         a5, s11, 7
                  slt          s10, a3, a5
                  srl          s6, a1, t6
                  slli         t2, ra, 3
                  sub          s4, s1, a2
                  nop
                  sltu         a6, s8, s10
                  lui          gp, 628304
                  addi         a2, a0, 468
                  nop
                  auipc        a3, 623661
                  andi         s5, t0, 1578
                  nop
                  and          t5, t2, t1
                  xor          s6, a5, a2
                  andi         a1, t3, -945
                  sub          a1, s11, tp
                  sra          t6, a1, gp
                  srai         s1, t3, 18
                  slt          a5, a2, s7
                  addi         s11, ra, -1042
                  add          gp, t4, gp
                  sub          s6, s11, ra
                  add          tp, s4, s1
                  addi         ra, a4, 755
                  addi         ra, s1, -732
                  addi         a3, t2, 174
                  xori         ra, a5, -104
                  andi         t2, s7, 1145
                  sltiu        a2, gp, 2015
                  ori          t3, s9, 566
                  sltiu        s10, s5, 1173
                  or           s6, s8, a4
                  ori          a5, a0, 563
                  srl          t0, s4, t6
                  auipc        a4, 311189
                  nop
                  slli         s10, t4, 0
                  xor          tp, a0, sp
                  srli         s1, s10, 5
                  sll          s0, s7, a1
                  add          s4, s9, s9
                  or           t2, a6, t6
                  addi         s10, t0, 1672
                  sltiu        zero, s11, -1857
                  lui          s0, 811243
                  or           s5, s3, a6
                  sra          s5, a6, a6
                  auipc        t2, 112509
                  ori          a6, a3, 1655
                  srl          zero, s0, tp
                  sltu         t6, t1, gp
                  or           t2, s9, sp
                  sub          s4, s1, gp
                  add          s5, zero, s11
                  sub          t2, t4, t2
                  sltu         s11, s8, s5
                  sltu         ra, t5, a7
                  ori          s1, a7, -1278
                  slli         s4, a6, 3
                  or           s2, t3, ra
                  sltiu        s8, s7, 554
                  xori         s10, a6, 695
                  addi         s1, tp, 194
                  lui          a4, 322189
                  add          gp, s5, a0
                  slti         zero, gp, 450
                  auipc        s6, 612489
                  slt          a6, s4, sp
                  sra          s5, a0, s1
                  srl          s8, tp, s0
                  ori          t0, t0, -316
                  xori         s6, a6, -643
                  slli         a3, t2, 0
                  srai         gp, s11, 1
                  slt          t1, zero, t4
                  lui          a4, 68975
                  auipc        s10, 365205
                  lui          s4, 846596
                  slt          s6, s1, a2
                  add          s8, a2, a0
                  lui          t4, 100304
                  lui          t0, 567917
                  sll          tp, t6, t5
                  slt          a1, t6, s5
                  sra          a5, s9, gp
                  auipc        a1, 281870
                  srl          t5, a5, s0
                  ori          s0, a0, -1126
                  srli         s2, a6, 22
                  sll          a1, t4, t6
                  slli         a5, a0, 7
                  sra          a6, zero, t5
                  xor          t2, ra, t1
                  srli         a3, s4, 23
                  sltu         s7, t1, tp
                  srai         t1, zero, 16
                  sltu         t5, gp, s0
                  xori         s0, a4, -544
                  slti         a4, a0, -1432
                  ori          s4, a0, -823
                  srli         ra, a7, 25
                  slli         tp, sp, 11
                  andi         s8, t0, 390
                  or           t3, s3, s7
                  sra          s8, s3, t6
                  xor          s5, a2, a0
                  or           s9, t2, a2
                  srl          a4, s9, s5
                  auipc        s7, 982488
                  sll          zero, a1, t1
                  or           t5, a6, a0
                  or           s9, a4, zero
                  sltu         ra, t2, s4
                  and          tp, s0, a6
                  srl          t6, s6, s6
                  sra          s7, zero, ra
                  or           a3, t3, t1
                  or           s2, ra, s8
                  slli         t6, a0, 14
                  srai         s6, s7, 17
                  sra          zero, s1, t0
                  sll          s8, a3, t5
                  slti         s10, s3, 1691
                  add          zero, s10, s9
                  lui          s9, 361425
                  sra          s5, sp, zero
                  andi         t1, s1, 427
                  ori          s11, a4, 299
                  or           s1, s10, s3
                  xor          a5, s10, s4
                  xori         s11, a1, -1749
                  lui          s0, 248028
                  sltu         a2, sp, a1
                  srli         t1, s11, 8
                  and          tp, s1, a5
                  xor          s0, a2, a2
                  or           s1, t4, t5
                  sltu         s2, t5, s5
                  sub          a5, a6, s11
                  sltiu        gp, s6, -1247
                  sra          a5, s11, zero
                  srli         t1, s2, 4
                  xor          t1, s2, s0
                  ori          s7, s2, -1694
                  sra          s6, t1, s0
                  srai         s8, s4, 26
                  ori          a7, s3, -821
                  sltiu        s11, s5, 1939
                  addi         t5, t6, 854
                  slt          s10, s7, s11
                  lui          zero, 15530
                  xor          s0, s6, a0
                  slt          t5, s3, a3
                  slt          gp, t6, t0
                  srli         a7, t5, 27
                  srli         t4, sp, 13
                  sltiu        t0, t4, -1171
                  srl          ra, sp, s8
                  slt          s0, s0, s11
                  ori          t6, a5, -263
                  slt          a5, t6, t4
                  ori          s5, a2, 1589
                  nop
                  sltu         s1, a2, s0
                  srai         s0, t4, 12
                  sll          a4, sp, sp
                  sltiu        s1, a2, 356
                  slt          a3, a5, a5
                  slti         a1, t1, -1476
                  and          ra, t1, a2
                  srl          s2, t0, t0
                  xori         t3, a4, 85
                  ori          s5, s0, 1495
                  andi         t6, s6, 15
                  lui          t0, 29187
                  srai         t0, a7, 0
                  srl          t4, a3, s1
                  slt          a7, a0, s7
                  andi         t3, t0, -291
                  lui          s8, 408216
                  xori         s8, s10, 385
                  andi         s2, tp, 1583
                  sra          s0, t1, t6
                  slti         s7, s5, 1804
                  ori          tp, t4, -1442
                  slli         s5, s7, 4
                  sub          a4, s10, s11
                  add          s8, s0, s5
                  slti         s5, s9, 1790
                  sltiu        t4, a5, -1287
                  lui          t0, 423674
                  slt          a7, s6, zero
                  sra          s1, a4, s7
                  sll          t3, s3, t2
                  addi         a7, t4, 366
                  add          t4, s7, s2
                  sltu         gp, s3, gp
                  lui          a4, 180102
                  xori         t4, s2, -498
                  auipc        a5, 135303
                  add          s0, gp, t2
                  slt          s9, s7, a6
                  or           s9, s2, t4
                  auipc        a7, 611813
                  andi         gp, s4, -78
                  lui          a1, 599746
                  andi         a2, s6, 1731
                  add          s8, tp, gp
                  sltiu        zero, sp, -1837
                  slti         a2, s11, -1476
                  slt          gp, t3, s7
                  nop
                  sltu         s1, a6, a5
                  nop
                  slt          s11, t1, s3
                  srai         tp, a3, 3
                  srli         ra, s7, 13
                  srli         a5, a2, 30
                  ori          a4, a1, -421
                  addi         s2, a7, -640
                  srai         t1, a3, 13
                  srai         s9, a7, 26
                  or           t1, t5, a0
                  nop
                  or           gp, s8, s10
                  srl          ra, t1, a5
                  add          a7, a5, s4
                  andi         t5, t6, 1568
                  sra          t6, a2, t4
                  auipc        s5, 482068
                  add          a3, tp, zero
                  slli         a5, t3, 29
                  or           s4, t2, gp
                  slt          a4, t2, gp
                  xor          a4, a5, s6
                  slti         a7, s5, 1878
                  lui          s5, 855881
                  sub          a1, a5, s1
                  slti         s2, a7, 2009
                  or           s5, s10, t6
                  lui          t0, 552748
                  slli         s2, s6, 9
                  sll          a4, a0, a2
                  slli         s8, s11, 26
                  sra          a4, a4, t3
                  auipc        t0, 309812
                  andi         s5, sp, 1930
                  lui          a5, 976471
                  slt          s1, t0, ra
                  andi         tp, t0, -1236
                  or           s8, a4, t6
                  srl          s7, a6, a6
                  srl          a1, t2, s6
                  addi         s11, s11, 774
                  xori         a1, s8, 1067
                  slli         s5, a6, 22
                  addi         t4, s2, 849
                  sltiu        t0, s1, -1259
                  sltu         s1, s8, t2
                  slt          a6, a6, t2
                  slti         s2, t5, 385
                  sltu         t1, sp, t0
                  or           s5, s7, zero
                  nop
                  auipc        ra, 601467
                  nop
                  nop
                  and          a6, t3, a5
                  sub          t0, t5, t5
                  lui          ra, 267856
                  nop
                  srl          s4, s1, t2
                  slli         s6, s6, 14
                  xor          zero, s3, s1
                  slt          s1, t4, t5
                  sub          t6, s10, a7
                  sub          tp, t5, s9
                  sra          a5, sp, t6
                  sltu         s0, s11, s0
                  srl          s7, ra, t3
                  sub          t3, t5, t6
                  or           a1, t0, a2
                  sub          a5, s9, s11
                  xor          a7, s9, s6
                  srli         s8, a7, 28
                  slti         s7, t3, 1578
                  and          a3, s5, a0
                  srl          ra, s9, zero
                  sll          a2, s10, a3
                  sll          s0, t1, a4
                  srl          a5, s1, a0
                  addi         t4, a7, -1296
                  auipc        t5, 759802
                  nop
                  auipc        s9, 575490
                  xori         gp, s11, 773
                  andi         gp, t0, 1348
                  xori         a1, a5, 308
                  sll          s10, a7, a3
                  sra          a1, zero, a2
                  sltu         a6, s8, t1
                  andi         s2, gp, -1996
                  slli         a4, a5, 30
                  nop
                  sub          t2, t4, a5
                  slli         t1, a5, 22
                  or           t4, s6, s5
                  or           s1, s5, s7
                  sub          s4, s11, s11
                  srai         t5, ra, 5
                  sltiu        s11, gp, 436
                  sub          a1, s0, s3
                  srai         a3, ra, 19
                  slt          s10, a6, s9
                  and          a4, a6, t1
                  srli         a4, t2, 27
                  lui          s1, 912262
                  or           a3, t6, ra
                  sltiu        s7, s2, -1039
                  ori          s2, s4, 1460
                  sltu         a6, a0, a6
                  andi         t4, s2, 797
                  sltiu        t5, a4, 1372
                  slti         ra, a4, -611
                  nop
                  srli         tp, tp, 7
                  slt          s1, s6, s11
                  add          t3, s2, a7
                  addi         s2, s6, 1219
                  xor          t4, s1, t4
                  sub          zero, a0, t5
                  srai         t1, zero, 29
                  sltiu        a1, s8, 547
                  ori          a1, s5, -1240
                  sra          t0, s10, s10
                  andi         zero, s9, 835
                  slt          s10, a7, a0
                  or           t6, a1, s11
                  ori          a7, zero, 323
                  and          s8, gp, a4
                  sub          s0, s2, gp
                  lui          a1, 681032
                  ori          ra, a7, 1154
                  slli         t2, a7, 20
                  andi         s5, s8, 464
                  sll          s10, zero, t5
                  or           t0, t3, s0
                  srai         a1, a2, 26
                  auipc        a1, 1025935
                  slt          a2, a6, ra
                  srli         a3, t5, 6
                  sub          t6, s11, s5
                  sub          s8, a6, t2
                  lui          a6, 712661
                  sll          t5, s4, s4
                  slt          s2, s11, a1
                  addi         t1, t4, 1681
                  sll          a5, s7, a3
                  or           t5, s6, t5
                  xori         s6, t1, 2033
                  add          t4, tp, s2
                  sub          t3, s11, t1
                  lui          t4, 592039
                  addi         t3, sp, 1923
                  andi         s4, t6, -589
                  xor          s10, s4, s2
                  add          t3, zero, t3
                  add          s4, a1, s11
                  ori          s10, s3, -383
                  andi         t4, a2, 1078
                  xori         s9, t6, 970
                  srai         t0, s7, 2
                  sltiu        a1, a6, -1965
                  xori         a2, s1, -1293
                  auipc        a2, 966413
                  srai         t1, s8, 5
                  sra          zero, a5, a6
                  sltiu        a2, gp, -287
                  sub          t4, t1, t2
                  or           s4, tp, s8
                  or           tp, a6, tp
                  slli         a1, zero, 6
                  slt          zero, t1, t3
                  xori         a1, a3, 1270
                  auipc        tp, 891298
                  xori         a1, a3, -1177
                  andi         a3, sp, -37
                  xor          a6, t1, s2
                  sll          s10, s11, a7
                  or           a2, s8, s11
                  addi         t1, tp, 800
                  srl          s7, a3, t4
                  sltu         zero, s4, s11
                  srai         a1, s2, 25
                  addi         t6, zero, -152
                  or           t2, a6, s11
                  sltiu        ra, gp, 501
                  ori          s8, a7, -695
                  addi         a1, t6, -1897
                  lui          s10, 271569
                  addi         t2, zero, 1802
                  sra          t1, s4, a1
                  or           ra, s6, t5
                  sra          s9, tp, t1
                  and          a4, a4, s2
                  xori         a7, t0, 70
                  lui          t0, 451239
                  slli         t3, s9, 10
                  sltiu        a7, a5, 1603
                  addi         s11, s0, -1170
                  and          a2, s4, a6
                  srai         s8, s9, 10
                  or           s11, t6, zero
                  xori         s1, s10, 710
                  sra          t2, sp, s0
                  ori          s8, a5, -1392
                  addi         t5, t0, 1057
                  addi         a6, s9, -105
                  add          a4, s3, a0
                  srai         t5, s10, 7
                  andi         a3, zero, -736
                  srai         t1, t1, 14
                  sub          s8, t1, s5
                  xori         s6, t2, -1715
                  slt          t4, s1, tp
                  slli         s6, t0, 25
                  lui          t1, 59966
                  sltiu        a3, s7, 198
                  srai         s5, s8, 31
                  slli         s8, a7, 5
                  add          a7, sp, tp
                  lui          s9, 844328
                  andi         a2, s6, -892
                  sltiu        a3, a4, -586
                  addi         a6, s6, 986
                  andi         tp, sp, -2031
                  add          a6, s7, a7
                  auipc        s4, 566762
                  add          t0, a1, s3
                  nop
                  add          a1, ra, a0
                  sltu         t0, s3, a1
                  or           s8, s7, tp
                  srai         s10, a1, 27
                  srli         s5, s2, 28
                  srai         t4, t6, 18
                  sub          a2, zero, t4
                  ori          a6, s7, 1800
                  lui          a1, 249920
                  sltu         t3, sp, a4
                  sll          a6, t0, s11
                  srli         zero, gp, 11
                  sltu         a2, t1, t1
                  nop
                  ori          s6, s8, -286
                  auipc        t5, 589381
                  and          a1, s10, s7
                  andi         t4, s10, 1506
                  and          s9, t0, s10
                  slli         s8, s1, 3
                  sltiu        s1, s7, 1406
                  sub          zero, t5, t5
                  slt          t6, t2, t4
                  or           tp, s3, a1
                  and          tp, s1, s3
                  srai         s1, a5, 6
                  lui          a6, 222263
                  sub          s0, s2, s2
                  slli         s4, sp, 7
                  add          s11, s9, s1
                  andi         a5, t2, 1526
                  srl          s5, a0, s3
                  srl          s10, a2, s8
                  add          s4, s8, s5
                  ori          a2, s9, 1023
                  sltiu        s2, tp, -51
                  add          zero, gp, t6
                  slli         t5, s2, 26
                  addi         s11, t5, -465
                  nop
                  ori          tp, t5, -1184
                  ori          t2, gp, 1277
                  and          s2, a1, s1
                  xori         tp, s5, -875
                  lui          ra, 470566
                  srl          a1, zero, a1
                  xor          s11, s4, s6
                  srli         s8, t5, 13
                  sub          a5, a5, sp
                  or           s7, s3, a5
                  slli         zero, s9, 0
                  or           a3, sp, t0
                  xori         s5, s7, -2033
                  xori         a5, a0, 618
                  sltiu        s5, tp, -317
                  sltiu        gp, ra, 1991
                  slt          a3, ra, s5
                  andi         s5, s6, -1369
                  sltu         a3, s7, t0
                  auipc        ra, 789854
                  slli         s1, t3, 20
                  andi         s7, s1, -809
                  lui          t4, 807321
                  or           t3, sp, a1
                  andi         a3, a4, -906
                  srli         t4, a0, 15
                  and          s5, s6, t3
                  slli         ra, a3, 12
                  addi         t6, s1, -243
                  auipc        a3, 525310
                  sub          a1, t6, a1
                  srai         t0, a6, 29
                  lui          s4, 59077
                  andi         a2, t1, 1507
                  nop
                  addi         t6, t0, -1027
                  or           s1, ra, a2
                  sltiu        t6, tp, 1193
                  slt          s9, a2, s11
                  or           s11, s6, s2
                  slt          s1, t1, s5
                  andi         t6, s6, 511
                  slli         t3, zero, 10
                  slti         s2, t6, -960
                  srli         s6, s8, 22
                  and          ra, a7, s0
                  srli         a1, s4, 10
                  addi         gp, s6, -1140
                  slt          s5, gp, t4
                  slt          a6, a0, a3
                  srai         a3, a4, 1
                  xor          t4, zero, s4
                  sll          s8, gp, s4
                  xor          s4, a1, a5
                  sll          s11, s8, t5
                  slt          a4, a6, a6
                  srl          s2, t2, s3
                  slli         s1, t1, 2
                  sltiu        s1, s6, -541
                  ori          tp, ra, -1427
                  sltiu        s10, zero, -1479
                  sub          s2, s2, s10
                  slti         a4, a5, -2028
                  sltu         s10, s2, tp
                  srai         t4, s7, 10
                  slt          a6, s3, gp
                  auipc        ra, 883437
                  sll          a4, zero, t5
                  xori         a2, s1, 10
                  or           s1, ra, s0
                  xor          s8, tp, a5
                  andi         gp, s1, -14
                  slli         s10, a0, 29
                  slli         s0, a4, 19
                  ori          a7, s5, -1721
                  or           a1, tp, a2
                  andi         s10, t2, 1384
                  and          a5, s8, s0
                  sltiu        a4, t5, -1111
                  and          s8, ra, t0
                  nop
                  slti         a7, gp, -1029
                  add          ra, s1, s0
                  addi         tp, a6, 1236
                  slti         s9, a0, -1511
                  slt          s4, zero, t4
                  slt          t5, s6, t6
                  and          s9, t2, tp
                  lui          s11, 915816
                  xori         s10, a0, -257
                  sll          a1, sp, s11
                  sltu         a2, sp, a0
                  addi         s5, s4, 1811
                  sra          s10, a3, t3
                  sra          zero, a2, s3
                  or           t3, t4, s5
                  lui          s7, 43221
                  srai         a4, t6, 14
                  slli         t2, t0, 22
                  or           t6, s2, gp
                  sub          a5, s6, t3
                  lui          zero, 193523
                  sub          t1, s0, s3
                  slt          a4, t1, s11
                  lui          t1, 995449
                  andi         t4, s5, -307
                  sltiu        a4, s3, -1462
                  ori          t6, s7, 269
                  srli         s9, t5, 19
                  lui          t3, 597145
                  sub          gp, s7, t6
                  xori         ra, s10, 411
                  andi         a3, zero, 1779
                  slt          t5, s9, s8
                  srai         s6, a3, 28
                  lui          a3, 878579
                  slti         s2, t6, -851
                  nop
                  sll          t0, s9, s9
                  sub          a4, s4, ra
                  sub          a7, a4, s1
                  andi         s0, a1, 842
                  sll          ra, s10, t0
                  add          a2, s3, zero
                  or           gp, s0, s9
                  or           gp, a3, a3
                  xori         t6, s6, 1748
                  add          t3, t2, s2
                  xor          s4, zero, t3
                  slt          a5, a5, a4
                  srai         tp, a1, 9
                  sub          zero, s3, ra
                  andi         s4, s5, -1800
                  nop
                  sll          s9, a7, s11
                  or           a2, t6, a5
                  srai         zero, s7, 15
                  srai         a6, s3, 8
                  slli         ra, a3, 16
                  srai         a4, s9, 22
                  slli         s10, s3, 10
                  lui          t5, 812634
                  slli         s11, gp, 18
                  sra          a5, t0, t5
                  ori          t5, s3, -1231
                  lui          a4, 752648
                  lui          s5, 817598
                  sll          gp, t1, t2
                  sub          s9, sp, t2
                  lui          s8, 846618
                  or           s9, s8, ra
                  slli         s9, a5, 31
                  srai         a7, t4, 10
                  or           t4, s9, s7
                  srai         tp, a6, 22
                  auipc        s5, 137616
                  sub          t0, a0, s8
                  ori          a1, s8, -1618
                  sll          ra, s7, a1
                  slti         s4, t1, 537
                  sra          s2, s6, s0
                  or           s11, t4, a3
                  lui          s7, 584047
                  sltu         s11, a1, t2
                  srli         a6, s3, 19
                  add          s8, a6, t0
                  xor          s4, s6, a3
                  slti         t0, t6, 1759
                  ori          a1, a7, 13
                  addi         s7, t6, 1041
                  ori          s2, s8, 1551
                  srai         s8, s1, 30
                  and          t5, s3, a1
                  slt          a7, t3, a4
                  srai         t0, t5, 20
                  or           ra, t2, a4
                  srai         s4, a4, 9
                  srl          t4, s6, a2
                  sltu         s4, t6, gp
                  nop
                  ori          a7, s11, 122
                  nop
                  auipc        a6, 333610
                  sll          s11, s4, s3
                  slt          a3, a5, s9
                  sra          s1, tp, a2
                  slt          a4, t5, t4
                  addi         s8, s9, -1101
                  and          s1, s9, a0
                  srai         s0, s7, 24
                  slt          s7, t3, t4
                  slli         t5, a5, 1
                  or           t4, ra, t4
                  slt          s11, s5, t1
                  ori          s7, a4, -298
                  srl          s2, s2, s10
                  srl          a2, t5, a2
                  ori          s0, t0, -599
                  ori          zero, s3, 1772
                  or           s8, a6, a1
                  sll          t3, s2, s3
                  xor          s1, s6, t1
                  ori          t4, s0, 992
                  sll          t2, a6, s5
                  sll          s2, s8, s11
                  or           s0, s0, s3
                  lui          s5, 471972
                  nop
                  addi         s9, s7, 1311
                  sltiu        a6, gp, -1078
                  sltiu        s6, zero, 1856
                  slti         s5, s4, 1237
                  xor          s6, s5, zero
                  slt          t1, t4, a2
                  addi         t5, a3, 1321
                  andi         s6, t5, -2015
                  lui          zero, 159879
                  and          s10, s7, t0
                  slti         s11, a1, 1023
                  andi         ra, s6, -1345
                  auipc        s6, 484549
                  slli         s8, a1, 11
                  add          s7, s0, t3
                  sltiu        tp, s11, -1900
                  xori         s8, s5, 1322
                  slt          a4, zero, a0
                  andi         s4, a7, -2015
                  srl          s2, tp, zero
                  sltu         s11, s10, t2
                  or           gp, s1, a5
                  addi         a6, s1, -932
                  or           s4, s3, t5
                  sra          zero, sp, tp
                  or           t2, t4, gp
                  sltiu        gp, a1, 1968
                  sltiu        t2, a7, -1201
                  srai         s8, s11, 8
                  nop
                  xor          a1, s4, a7
                  sra          s1, s1, sp
                  andi         s9, s8, 1320
                  srl          s6, t5, zero
                  or           s5, gp, t1
                  slli         s8, s0, 8
                  auipc        a3, 797305
                  xori         s5, tp, -1116
                  and          s8, s5, s9
                  ori          gp, a5, -1522
                  sltu         ra, s1, s5
                  sltiu        gp, s5, -2018
                  slt          zero, a0, s5
                  addi         s9, s7, 1310
                  nop
                  sub          t2, s11, s3
                  add          s6, t0, s0
                  and          t4, a4, s3
                  ori          s9, s9, 372
                  sltu         s2, a5, s7
                  auipc        t4, 339246
                  sll          s0, t3, a4
                  ori          a3, s0, 1793
                  srai         a5, t5, 28
                  and          t2, s2, zero
                  srl          s10, s0, t1
                  sltu         s10, a1, s8
                  or           t0, s3, s10
                  slti         zero, s3, 1988
                  auipc        t6, 922596
                  xori         t4, a6, -1682
                  srai         a1, t0, 25
                  srl          s7, s2, a5
                  sltiu        s6, a2, 31
                  sll          s10, s3, s0
                  and          t1, t1, sp
                  addi         t4, s4, -1609
                  ori          t0, s6, -1084
                  or           a5, a0, s1
                  srl          s7, t1, a0
                  add          s8, sp, a4
                  srli         zero, s3, 18
                  nop
                  lui          a4, 504788
                  andi         tp, a3, 1974
                  xor          s7, t1, zero
                  sra          a2, s0, s6
                  lui          zero, 531273
                  xori         zero, zero, -1155
                  slli         t5, t4, 3
                  slli         a4, s10, 25
                  auipc        tp, 540709
                  slti         t2, zero, 514
                  nop
                  addi         t6, sp, -861
                  or           s0, a5, a4
                  add          a3, sp, t3
                  sltiu        a2, tp, 908
                  lui          a2, 118503
                  sub          a1, t4, a0
                  sub          gp, t4, s6
                  sltu         a6, zero, tp
                  and          t6, tp, s7
                  xori         a2, s8, 425
                  slt          s4, t2, ra
                  xori         t3, s8, 1554
                  sub          a3, gp, s8
                  sra          t4, s1, a4
                  slli         s11, s2, 28
                  slli         s7, sp, 31
                  sub          a5, s1, a5
                  add          zero, a0, t1
                  slli         a4, a2, 31
                  sltiu        gp, s10, -5
                  and          s10, s4, a5
                  add          t4, s9, s6
                  sra          s8, a4, s1
                  addi         s8, t1, 1332
                  xori         ra, t0, 186
                  andi         a7, s6, -516
                  xor          tp, s3, tp
                  srli         a6, t1, 26
                  lui          s10, 83705
                  ori          s5, a5, -616
                  srl          a4, zero, s2
                  sltu         s2, a5, s9
                  slli         t0, t1, 31
                  addi         s0, a5, 1616
                  addi         tp, s1, -361
                  slt          s0, s8, zero
                  sra          t4, a1, s5
                  slt          a1, s7, a1
                  auipc        a5, 954982
                  srai         t5, ra, 0
                  andi         s6, a6, 615
                  sll          a7, s2, a4
                  addi         s7, a3, 1422
                  sll          s0, s2, s0
                  slti         s7, s2, 734
                  slt          s10, a3, a5
                  andi         s1, s8, -612
                  add          a4, gp, s3
                  lui          t4, 667127
                  slti         s0, s8, -1744
                  srl          s2, s5, s0
                  sll          t2, a7, a3
                  addi         s0, a1, -1616
                  addi         t5, t6, -1475
                  ori          a3, a6, -481
                  sltu         s8, a4, a2
                  slli         t0, s4, 16
                  sltu         s7, t0, s1
                  sub          t1, a1, s9
                  add          s9, gp, t3
                  and          s11, s8, a5
                  xor          t6, t3, a2
                  sub          t0, gp, t1
                  add          a6, t6, s2
                  and          s0, t4, s11
                  slli         t6, s3, 17
                  srai         a1, s4, 27
                  slt          t3, sp, a1
                  srai         gp, gp, 25
                  srli         s7, s2, 29
                  andi         t1, a3, -1460
                  srai         gp, t3, 7
                  slt          s6, s3, gp
                  sll          s0, t3, s7
                  srli         a4, a5, 7
                  auipc        s11, 551108
                  ori          s5, s3, -1190
                  srai         t1, ra, 9
                  sra          zero, t0, a5
                  srl          s5, tp, a7
                  and          zero, a7, s5
                  ori          s1, a4, -787
                  ori          t1, a5, 1104
                  or           a3, a7, a2
                  auipc        s2, 708784
                  slti         ra, sp, -1306
                  srl          t3, a3, t4
                  sra          a4, s11, a6
                  srai         s4, s9, 13
                  sltu         s0, s6, t3
                  xor          s10, a0, t4
                  xori         s0, s5, -677
                  srli         s0, s3, 25
                  sra          ra, s2, ra
                  xor          a2, s0, a7
                  xori         a3, s1, -1926
                  or           gp, s7, sp
                  add          t2, s8, zero
                  auipc        a3, 287290
                  srai         a4, t0, 23
                  sll          s8, t1, s6
                  ori          s0, s7, -1139
                  and          s5, s7, s4
                  addi         a4, a4, -1351
                  slli         s5, s9, 20
                  sub          a4, s11, a7
                  srl          t5, t6, s10
                  andi         s0, sp, -1327
                  addi         gp, s3, -286
                  addi         t5, t3, 1491
                  and          s6, t5, s8
                  or           s10, s10, t3
                  lui          t5, 453778
                  sltu         s2, t0, s8
                  andi         a5, s4, -508
                  addi         s7, t6, -1860
                  xor          t1, zero, s6
                  xori         s5, s5, 1985
                  ori          s8, a0, 1687
                  xor          s0, ra, sp
                  srai         s9, s6, 20
                  slt          tp, t6, t2
                  andi         zero, t2, 1104
                  sra          zero, a7, gp
                  xori         t0, s5, -82
                  auipc        zero, 949323
                  or           a7, s3, s8
                  srl          s1, s11, s6
                  srl          a3, gp, s5
                  sub          t0, a5, s9
                  andi         zero, s2, -803
                  auipc        s0, 881465
                  sub          zero, tp, t4
                  xori         t2, a4, -1135
                  slti         s2, t5, 1007
                  xori         s9, a5, 626
                  xor          s10, gp, gp
                  li           s2, 0xe021ffb9 #start riscv_int_numeric_corner_stream_22
                  li           s11, 0x80000000
                  li           tp, 0x734ed117
                  li           t1, 0x0
                  li           a3, 0x0
                  li           s0, 0xffffffff
                  li           s7, 0xba84f225
                  li           t3, 0x0
                  li           ra, 0x80000000
                  li           s1, 0x0
                  add          t3, ra, t1
                  nop
                  nop
                  nop
                  add          s0, s11, s1
                  add          ra, s2, t3
                  auipc        tp, 911930
                  nop
                  sub          t3, s11, tp
                  nop
                  auipc        s1, 901966
                  auipc        s0, 54078
                  lui          s11, 311453
                  addi         s2, s7, 1840
                  lui          s11, 156839
                  lui          s7, 891753 #end riscv_int_numeric_corner_stream_22
                  srl          t6, s1, s1
                  xori         t4, t5, -477
                  sll          t4, a7, s5
                  sra          t6, t5, s6
                  andi         s5, s0, 1466
                  sltu         a3, s9, a1
                  add          s5, a7, tp
                  xori         s4, ra, -737
                  lui          s11, 161678
                  srli         t5, t6, 14
                  sra          gp, s7, s3
                  xor          s1, t1, tp
                  sltu         s0, a0, gp
                  nop
                  sub          t1, t3, s7
                  sra          tp, s3, a5
                  lui          s7, 825445
                  addi         ra, s3, 704
                  sltiu        t6, a2, -1101
                  andi         ra, sp, 1794
                  slt          a2, t5, t6
                  slt          s8, a6, tp
                  sll          s11, t2, a0
                  sll          s5, s10, ra
                  nop
                  sub          s0, s8, ra
                  and          t5, a6, s11
                  and          a3, t4, s5
                  andi         s9, s2, 76
                  slt          s11, s11, sp
                  lui          a7, 706812
                  sltiu        s10, t6, -1256
                  slli         zero, tp, 14
                  addi         s8, s2, 1734
                  slli         t1, sp, 1
                  andi         s0, s8, 919
                  auipc        t0, 916994
                  srai         a3, t1, 13
                  auipc        a2, 938696
                  and          t3, s9, sp
                  sll          a4, t0, s1
                  nop
                  andi         gp, a7, -707
                  slli         t6, t0, 12
                  srl          t2, s11, a6
                  sub          ra, t6, a0
                  slti         s4, t3, 638
                  slli         ra, s3, 29
                  andi         s0, t4, 1840
                  slti         s2, s9, -1038
                  or           a5, gp, tp
                  xori         t6, s5, -1743
                  or           s5, s11, zero
                  sra          gp, s6, ra
                  and          t2, s7, t3
                  addi         s4, a6, 1111
                  and          a1, a3, t5
                  sub          s8, a5, s3
                  auipc        a5, 838109
                  sll          s10, sp, a3
                  slti         a3, gp, -1428
                  slti         a2, t0, 279
                  lui          a6, 7548
                  add          a2, s10, s1
                  srl          a1, s11, a4
                  slli         zero, a5, 26
                  xor          s9, a3, a4
                  xori         a4, s1, -1937
                  slli         a4, gp, 0
                  sll          t6, t0, t0
                  srli         s9, t5, 15
                  sltu         s6, s2, s8
                  xori         s5, s3, 529
                  sll          tp, a3, s0
                  addi         t2, a7, -867
                  ori          gp, s3, -1046
                  add          t2, s11, a5
                  sltu         s9, t5, tp
                  xori         t3, s3, -1280
                  auipc        s9, 390016
                  andi         a4, a4, -1720
                  ori          tp, t3, 498
                  xori         s0, t0, -37
                  srai         s11, ra, 30
                  slli         t2, ra, 15
                  lui          t3, 74034
                  sub          t1, t5, s6
                  lui          zero, 604331
                  srli         s7, gp, 6
                  sltiu        t4, a7, -1253
                  sltiu        s7, s1, -1659
                  srl          s11, a5, a6
                  sll          tp, t3, a2
                  add          a2, t3, t2
                  and          s6, s2, s2
                  addi         s4, a0, -697
                  auipc        s1, 1045833
                  xori         a3, zero, -774
                  sltiu        t3, a4, 253
                  sll          zero, sp, t4
                  and          t0, a6, sp
                  addi         t0, tp, -737
                  sub          t0, a0, a1
                  slt          t3, t5, t0
                  sub          a1, s1, s10
                  andi         s2, t5, -606
                  slt          t5, tp, s6
                  or           s1, a2, t6
                  lui          s7, 512489
                  xori         t5, t5, 1283
                  slt          s1, t1, tp
                  ori          t5, t2, 854
                  add          a5, s5, t4
                  sll          t3, ra, s6
                  xor          t3, s8, t6
                  srli         s0, t3, 5
                  or           s5, t5, a1
                  add          t0, a3, s2
                  or           s0, t3, s6
                  andi         s11, s10, 1391
                  addi         tp, a0, 1733
                  srl          a7, a2, s10
                  sltu         t2, sp, zero
                  srl          a4, sp, a7
                  lui          s2, 97039
                  srai         s7, s4, 2
                  srai         t2, sp, 15
                  sra          a6, t3, s8
                  slli         ra, t4, 23
                  add          s10, t4, a7
                  sltiu        a7, s3, 900
                  and          t1, a0, gp
                  xor          a7, a7, s4
                  andi         s9, s5, -1862
                  srai         s7, s2, 29
                  xori         s9, t0, -1790
                  xori         a6, t6, -338
                  srl          tp, s4, sp
                  srli         t5, t3, 4
                  or           ra, ra, zero
                  slti         s2, s10, 1953
                  sltu         t6, t0, sp
                  lui          t2, 584546
                  sub          zero, s11, t6
                  lui          t0, 598236
                  srai         s6, s8, 31
                  auipc        s1, 119413
                  auipc        t1, 591088
                  ori          ra, s9, 1627
                  sra          a6, gp, a2
                  sub          a2, a6, t6
                  sltu         s7, ra, s10
                  slti         s0, ra, -978
                  slti         a1, s0, -225
                  and          gp, s8, a1
                  xor          t6, a5, s2
                  xor          t0, s7, s10
                  xor          t1, s8, a6
                  and          s2, s4, s6
                  auipc        s4, 949543
                  andi         a7, a7, 447
                  addi         t4, a1, 60
                  srai         t4, s0, 10
                  xor          t3, s0, s10
                  auipc        a7, 78457
                  sltiu        tp, a7, 812
                  sub          a3, s1, sp
                  addi         s5, s11, -963
                  or           s10, t6, a7
                  sra          a7, s1, zero
                  sltu         s5, t6, t1
                  auipc        a5, 317125
                  sltiu        t1, a6, -1849
                  add          a2, s11, s0
                  and          s9, zero, s7
                  sra          a7, tp, s0
                  auipc        t0, 100216
                  xori         s7, a1, 1573
                  srai         s11, gp, 2
                  srli         s5, t1, 14
                  sub          s9, a2, s3
                  slli         t6, s4, 2
                  slti         s9, t0, -28
                  slti         t0, s9, 1389
                  nop
                  and          a6, a3, s7
                  slli         a5, t2, 25
                  or           t0, s4, a6
                  sub          t5, a1, tp
                  sltiu        s4, t3, 398
                  xor          s0, s2, s1
                  srli         t0, s11, 19
                  sra          zero, s6, s10
                  sltiu        a5, t1, 583
                  nop
                  slt          s10, a2, s10
                  srai         s2, t6, 13
                  add          s5, a5, a6
                  lui          s2, 420065
                  xori         a5, s7, 986
                  slli         t0, s10, 20
                  xor          s9, t3, a1
                  lui          s4, 399433
                  sltiu        a2, t5, 1610
                  srl          a2, a0, a2
                  add          s10, t6, s1
                  ori          a1, s6, 1531
                  ori          s2, s10, -1802
                  sll          s11, a4, a0
                  sra          s6, s5, s7
                  add          s2, s4, t1
                  nop
                  sltiu        s2, a6, 298
                  ori          a4, ra, -1794
                  xor          gp, t2, a7
                  srli         ra, s8, 27
                  andi         t0, s10, -361
                  slt          s4, s5, s7
                  sra          tp, s0, t3
                  sll          s1, a3, tp
                  andi         s9, s2, 1142
                  and          a3, t2, t4
                  andi         t5, a1, -1903
                  andi         t0, s5, -1440
                  slti         a1, s4, 114
                  xor          a5, s5, s11
                  auipc        a1, 984681
                  xori         gp, sp, -1467
                  slti         s8, t6, -1607
                  srai         s1, s3, 7
                  ori          s0, t6, -1034
                  sltiu        a1, a3, -1419
                  srli         s4, zero, 14
                  andi         s9, s9, 1988
                  slli         t0, a5, 12
                  auipc        s4, 685925
                  srli         t1, t2, 31
                  slli         a7, s0, 22
                  srai         t0, s10, 11
                  srai         s7, s8, 0
                  slli         a7, s6, 15
                  sltiu        a2, s4, -1108
                  srai         a4, sp, 3
                  and          s2, a6, a7
                  nop
                  ori          s2, a2, -275
                  srai         t2, t2, 18
                  ori          gp, s8, 1640
                  nop
                  auipc        s9, 271168
                  sub          t2, s5, s2
                  srl          a1, s11, a4
                  addi         gp, zero, 82
                  sltiu        t3, s11, 769
                  ori          s0, a5, 83
                  andi         a1, a5, 146
                  andi         zero, t1, -1507
                  srai         s6, t4, 8
                  sltu         a5, sp, a4
                  ori          ra, s1, -1347
                  slt          gp, a0, a1
                  slti         s8, t6, -560
                  srl          s5, s1, a7
                  xori         a4, s2, 1903
                  and          s10, gp, a0
                  nop
                  xori         s6, a3, -1917
                  or           a7, tp, t2
                  xori         t4, s10, 983
                  srai         s6, t4, 24
                  sll          a3, t3, t4
                  ori          s6, a4, 1291
                  xori         s9, a1, 1349
                  slt          a4, s8, s9
                  sltiu        a2, a6, 1344
                  srli         a2, s3, 11
                  slt          t4, a0, s1
                  slt          a2, s10, s2
                  or           a5, a0, s11
                  srli         s2, t3, 14
                  sra          a2, t0, s9
                  slti         s7, s11, -1149
                  addi         a2, s8, -947
                  slli         t0, a1, 21
                  slt          a3, s4, s8
                  andi         t3, t2, 1763
                  slli         t0, a6, 30
                  or           gp, t5, a0
                  addi         a5, t0, -690
                  auipc        s7, 853925
                  sra          a2, t2, s2
                  srl          s7, a4, s9
                  lui          a6, 191385
                  nop
                  sub          t0, a3, a3
                  or           s2, s6, s7
                  srli         s11, a4, 12
                  srai         a3, t3, 0
                  lui          tp, 1003743
                  and          s4, s10, zero
                  lui          t2, 839110
                  srl          a3, s7, s5
                  xor          zero, t5, t1
                  xor          t0, s3, s10
                  andi         a5, t3, 1049
                  xori         s0, s9, 130
                  sltu         a3, t6, tp
                  auipc        t5, 549453
                  srl          s8, a2, s11
                  lui          s6, 691400
                  ori          s5, s1, -1260
                  sltiu        s4, s8, 230
                  auipc        ra, 243919
                  slli         s2, t5, 13
                  lui          s2, 897746
                  sltu         a3, tp, s11
                  ori          t5, s5, 1379
                  sltu         s5, s9, tp
                  slti         s10, t6, -1722
                  sll          t0, s3, s4
                  andi         s7, s2, 1946
                  sra          s9, s1, s9
                  slli         gp, s5, 10
                  sra          s5, zero, s9
                  andi         s2, s8, -1848
                  or           t0, s5, a1
                  andi         a1, s3, 1684
                  sltiu        t0, s4, -1909
                  srl          s5, s11, gp
                  sll          s2, s1, t3
                  addi         s0, s6, -1552
                  add          a7, t4, s9
                  or           t2, s0, s4
                  addi         tp, ra, 788
                  xor          a5, a5, s10
                  sra          a2, s6, t4
                  srl          a5, a6, s4
                  slli         s8, a0, 12
                  sub          s4, s6, t2
                  sll          s6, t3, t3
                  or           zero, t6, zero
                  srl          a6, a5, s0
                  sltiu        a1, t1, 117
                  sltiu        zero, s3, -1864
                  addi         t3, gp, -1618
                  slli         t6, s8, 30
                  srl          a5, ra, t6
                  sltiu        s1, a2, 1385
                  ori          s11, a7, 340
                  srli         a6, s0, 10
                  xor          a2, t0, s11
                  srl          a3, s9, sp
                  srai         s0, t2, 8
                  xori         a2, s11, -309
                  srl          a5, s5, a3
                  and          s1, t6, a7
                  sll          s5, s3, s11
                  and          a7, tp, t0
                  sra          t6, s3, s1
                  slti         s5, t6, 282
                  srai         s1, s11, 0
                  li           gp, 0x80000000 #start riscv_int_numeric_corner_stream_31
                  li           a6, 0x80000000
                  li           t5, 0x80000000
                  li           s6, 0xffffffff
                  li           tp, 0x0
                  li           s1, 0x20bb4537
                  li           a4, 0xffffffff
                  li           t1, 0x80000000
                  li           ra, 0x0
                  li           s11, 0x80000000
                  addi         t5, a4, 1845
                  auipc        s1, 884922
                  nop
                  add          t1, a4, a4
                  auipc        gp, 531301
                  sub          tp, s1, ra
                  auipc        ra, 514087
                  sub          a6, s6, a6
                  nop
                  add          ra, tp, gp
                  add          t1, ra, t1
                  add          t1, a6, tp
                  auipc        tp, 433036
                  sra          s1, s5, a6
                  srl          s9, sp, s8
                  slti         a4, t5, 667
                  or           a4, ra, t3
                  and          t0, t4, s6
                  slti         a4, zero, -1968
                  xori         s4, a3, -1634
                  or           t3, s11, s7
                  and          t2, s2, s9
                  sltiu        a7, gp, -393
                  add          s8, t3, gp
                  ori          a2, t1, -1000
                  lui          a7, 353577
                  lui          a3, 220129
                  andi         s5, s11, -616
                  and          s10, a5, a0
                  auipc        s5, 597061
                  auipc        s7, 899577
                  slt          s11, s5, s0
                  xori         a7, s0, -347
                  srai         s9, a3, 13
                  slt          a3, t2, t0
                  xor          s1, s9, a2
                  srai         s1, a2, 7
                  srli         t3, gp, 5
                  add          s8, tp, s2
                  srai         s7, tp, 27
                  srl          s11, t0, s11
                  andi         t0, sp, 648
                  xor          a4, a4, s7
                  sll          tp, sp, a1
                  slli         a3, s2, 4
                  slt          t3, s6, t2
                  sltu         a5, s4, a1
                  sltu         a7, a7, a7
                  or           s5, a6, s6
                  add          t2, s3, t3
                  slli         t6, s6, 18
                  sll          t4, s5, a0
                  srli         s0, sp, 23
                  ori          s7, t0, -660
                  auipc        s9, 888659
                  slti         a4, a6, -601
                  lui          t4, 258381
                  ori          a6, t5, 769
                  or           s4, s8, s0
                  addi         t5, a0, 70
                  slti         t5, tp, 562
                  srl          s10, s4, t2
                  andi         ra, t1, -1052
                  auipc        a2, 629861
                  nop
                  sra          a2, t1, t0
                  sll          s7, sp, s5
                  xor          a5, a4, a2
                  slti         gp, t1, -422
                  sltu         s2, a5, t6
                  sub          s11, s8, s3
                  slli         s1, s8, 11
                  xor          t3, s5, t1
                  srli         t0, s2, 18
                  andi         s8, a2, 1726
                  sltiu        tp, tp, 969
                  slti         t1, ra, 2016
                  slli         a6, t1, 19
                  srli         gp, s8, 24
                  addi         a3, t1, -1314
                  xori         t1, s4, 1619
                  sll          a4, a1, a6
                  or           zero, gp, a2
                  slt          t4, gp, t0
                  sll          s6, t3, s9
                  sra          s1, zero, t3
                  slli         t5, a3, 28
                  add          tp, tp, s2
                  sll          s4, s9, s8
                  lui          a6, 565954
                  srl          s7, t0, s7
                  or           s6, ra, a2
                  sltiu        t0, t6, -1352
                  sll          t4, a6, zero
                  xor          t6, s10, s6
                  andi         s7, s9, -590
                  slt          s11, s4, a6
                  add          t2, s10, t5
                  addi         s7, a1, -1516
                  sra          gp, a3, a5
                  sub          a7, gp, s8
                  sub          s0, t5, s5
                  sub          gp, s1, sp
                  xori         s5, ra, 365
                  sra          a5, s9, t1
                  auipc        s1, 210621
                  srli         s5, a0, 1
                  sltiu        a4, s10, -119
                  srai         s5, a7, 28
                  or           s0, s2, s11
                  lui          a5, 178342
                  slti         s9, t3, 1432
                  srl          t5, ra, ra
                  slt          t3, a6, a2
                  srli         a4, zero, 20
                  add          ra, sp, s5
                  ori          s7, sp, -302
                  slt          s10, tp, a7
                  srl          t1, s11, s3
                  slti         s8, zero, -1969
                  auipc        a2, 812234
                  auipc        t4, 571432
                  xor          a4, t6, a6
                  srai         a5, s5, 25
                  addi         s9, s9, -934
                  xor          s11, s7, s9
                  sub          t2, a0, t0
                  lui          s8, 713510
                  sltiu        a4, ra, -994
                  add          s4, a0, ra
                  addi         a5, a3, 143
                  add          s8, t6, s8
                  srai         a4, a4, 30
                  slt          s2, a2, a1
                  and          s6, s5, t4
                  srli         s11, s0, 28
                  auipc        a7, 184601
                  sltiu        s5, gp, 295
                  srli         t2, a2, 29
                  addi         t5, a4, 1679
                  or           s2, a3, s5
                  nop
                  sub          s6, t2, a4
                  nop
                  ori          t3, ra, -1032
                  addi         t0, a1, 510
                  sltiu        s6, s4, 22
                  srl          s10, sp, ra
                  andi         s6, s0, -1180
                  slti         s4, s6, 1827
                  sub          a5, a2, a5
                  slti         zero, s5, 1844
                  sltiu        s10, a7, 1303
                  srai         a7, tp, 25
                  xori         a5, ra, -842
                  sltiu        a4, t6, 1041
                  slti         s7, a5, 1787
                  lui          s7, 363749
                  slti         zero, gp, 291
                  nop
                  auipc        a3, 478006
                  slt          a1, t0, s10
                  ori          tp, t2, -1686
                  li           a5, 0x80000000 #start riscv_int_numeric_corner_stream_37
                  li           t5, 0x80000000
                  li           a1, 0x7282fe81
                  li           s11, 0x80000000
                  li           t3, 0x0
                  li           a7, 0xffffffff
                  li           s5, 0x0
                  li           s7, 0xffffffff
                  li           ra, 0x97d1e08d
                  li           tp, 0x0
                  add          t3, a5, a5
                  sub          s7, tp, a1
                  addi         t5, a7, -559
                  lui          ra, 164079
                  sub          s5, s7, a1
                  auipc        ra, 699873
                  nop
                  nop
                  sub          a7, a7, t5
                  sub          ra, t3, tp
                  add          t5, a7, tp #end riscv_int_numeric_corner_stream_37
                  sltu         t5, s5, s5
                  slli         s11, s1, 21
                  or           t2, s10, s6
                  slli         s1, s8, 12
                  sub          a2, a5, s5
                  slt          t6, s6, a2
                  srai         tp, s5, 27
                  ori          s8, t2, -555
                  or           a5, t1, s6
                  sltu         t1, a5, a0
                  xor          t3, a7, s2
                  slt          a3, a6, a6
                  and          t5, t4, a7
                  lui          s11, 880463
                  srli         ra, s5, 27
                  slli         a6, a7, 9
                  lui          s10, 826115
                  addi         t0, s10, 1773
                  sltu         zero, s11, s7
                  addi         s9, gp, 1088
                  lui          s1, 314869
                  xori         t6, s9, 659
                  ori          s0, s5, -1327
                  sub          a4, sp, t0
                  auipc        s8, 119476
                  sub          s0, s2, t2
                  lui          s0, 244195
                  sltu         tp, t3, t0
                  sltiu        ra, zero, -871
                  andi         t6, a5, -1493
                  ori          s4, a6, -652
                  sltiu        s2, sp, 903
                  nop
                  sltiu        s2, gp, 127
                  xori         a4, a7, 621
                  slt          a3, a7, a1
                  slti         t5, a0, 1956
                  slt          a2, sp, s9
                  ori          ra, a5, -2029
                  sltu         s11, zero, t4
                  sltiu        s7, a1, -1558
                  addi         a1, s6, 1786
                  add          t2, t6, s7
                  xori         zero, tp, 1118
                  ori          ra, s11, 176
                  andi         a7, s8, -365
                  srli         s0, a3, 14
                  sra          t2, t6, s10
                  srai         a6, t4, 16
                  addi         s11, zero, 813
                  nop
                  srli         t3, s8, 10
                  srai         s7, zero, 28
                  or           zero, a6, sp
                  srli         t6, zero, 21
                  slti         s5, t2, 2035
                  srl          s10, s5, a1
                  xori         a7, a1, -551
                  srli         gp, a6, 13
                  and          s1, t5, s3
                  add          gp, s1, a7
                  sltu         zero, gp, a3
                  or           s4, a3, a1
                  xor          s11, a5, a6
                  andi         t0, t0, -1217
                  srli         a4, t5, 28
                  xor          a3, t5, a4
                  auipc        t5, 310264
                  sra          t1, t4, t6
                  slli         a6, s4, 1
                  xori         a4, a0, 208
                  xor          s5, ra, a5
                  sra          s5, s11, tp
                  nop
                  slt          a4, ra, a2
                  xor          s1, t0, s10
                  sltiu        t4, s8, -25
                  xor          s10, a3, s6
                  sra          a5, t0, s7
                  slt          s0, t6, a4
                  ori          s11, s1, 1610
                  xor          s2, s11, t5
                  lui          a3, 526322
                  ori          s0, s4, 460
                  xori         gp, s11, 1961
                  sra          s0, t2, a0
                  slli         t2, ra, 6
                  xor          s11, s1, a3
                  srai         s7, zero, 15
                  and          s7, t3, a2
                  slti         zero, t4, 726
                  auipc        a7, 659608
                  xori         s1, t0, -718
                  lui          a6, 885912
                  sll          gp, sp, s7
                  slli         s10, s10, 1
                  sub          a6, a6, t2
                  auipc        t5, 914590
                  add          t4, zero, t2
                  sltu         s10, s4, s1
                  sra          a7, a5, gp
                  addi         t0, s8, 190
                  addi         s4, s8, 69
                  sltu         s9, t3, t0
                  sll          t5, ra, t1
                  srli         s8, s9, 22
                  sltu         a2, s6, zero
                  slli         s2, s2, 11
                  auipc        s0, 352987
                  srai         a1, zero, 16
                  nop
                  srli         s8, ra, 16
                  nop
                  nop
                  nop
                  slli         t6, t0, 21
                  sub          t0, a2, a5
                  sltu         t3, ra, s8
                  slt          t2, s0, s7
                  nop
                  slti         tp, s11, 510
                  lui          t1, 198168
                  srl          t6, s9, a7
                  sltu         a5, a0, s7
                  auipc        s9, 999042
                  sltu         s8, a1, t0
                  andi         s2, s3, -296
                  sltiu        zero, s2, 507
                  sltiu        t2, t1, 1668
                  sra          a7, a7, s1
                  srli         a1, t3, 12
                  srli         a4, t5, 11
                  xor          t3, s1, t1
                  ori          gp, a7, -885
                  srli         t4, s3, 8
                  srli         s2, s5, 28
                  slti         a3, s7, 1867
                  xori         t2, t1, -1083
                  and          a3, a1, ra
                  addi         s4, a4, 154
                  sll          a7, t4, s1
                  srli         t3, t4, 28
                  add          gp, s11, t0
                  auipc        gp, 16774
                  slt          t2, s7, s10
                  slli         zero, s6, 21
                  sltu         t5, t1, s5
                  sra          s8, a3, t6
                  srai         s4, t5, 29
                  slli         s8, s7, 2
                  sub          s1, a1, s1
                  sltiu        t5, a3, 451
                  nop
                  slt          s8, s9, a5
                  andi         tp, s5, -1800
                  andi         t2, t5, -695
                  slti         a1, sp, 1471
                  sll          s10, s1, a5
                  sll          zero, a1, a7
                  sltiu        a3, t5, 142
                  auipc        gp, 367890
                  or           t2, a6, s11
                  nop
                  or           s1, sp, tp
                  xori         a6, s7, -209
                  srai         a7, zero, 28
                  srai         a2, sp, 22
                  auipc        s2, 372937
                  addi         s2, t3, -912
                  nop
                  sub          s4, sp, a2
                  slli         zero, tp, 6
                  slli         gp, s8, 3
                  sub          s0, s0, s5
                  lui          s1, 814339
                  ori          s1, s4, 1042
                  sub          s2, a0, a2
                  andi         s10, tp, -1647
                  xor          s1, s6, t6
                  xor          s1, t4, zero
                  sll          a4, s3, tp
                  lui          s4, 925372
                  addi         t5, s2, -1191
                  srai         t1, s6, 5
                  sub          a6, zero, s5
                  xori         t4, t4, -536
                  srai         s1, a2, 20
                  slt          s10, t3, s10
                  slli         s0, s7, 21
                  slli         t2, a3, 17
                  slt          s6, a4, a1
                  slt          tp, a6, s5
                  addi         s1, s3, -463
                  and          s8, a7, t2
                  addi         t3, a4, 1068
                  sltiu        gp, t0, 555
                  sll          s0, a3, t2
                  slli         t0, a1, 17
                  xor          t0, s2, a0
                  sll          a7, s6, tp
                  sub          s6, a6, t0
                  slt          gp, gp, t1
                  srai         s11, s5, 1
                  and          s4, s6, s5
                  xori         gp, a1, 467
                  sra          t6, s6, ra
                  slti         a6, t4, 544
                  andi         s1, sp, 2046
                  srli         s4, t1, 22
                  srl          a1, a6, gp
                  nop
                  sltu         a2, ra, t4
                  srl          a4, s1, t0
                  slti         s0, ra, 336
                  slt          a4, s5, ra
                  slt          a5, s4, s9
                  sra          t4, ra, a3
                  sltu         zero, t5, t0
                  sltu         s10, s11, s11
                  nop
                  xori         s5, a2, -1910
                  slli         t5, t6, 19
                  addi         s11, s2, -2012
                  xor          s0, t2, a0
                  sub          s6, a6, s8
                  slti         a5, zero, -1528
                  add          s7, gp, s5
                  ori          t6, s11, -1004
                  sra          s1, t5, a6
                  slti         s7, t2, 764
                  add          a4, zero, s0
                  or           ra, s3, sp
                  sra          a7, s5, s6
                  sra          ra, a3, ra
                  srli         t5, ra, 12
                  sra          s1, sp, a6
                  or           s2, t1, s10
                  sll          t3, a4, t1
                  nop
                  and          t0, t2, zero
                  ori          zero, ra, -1003
                  lui          t0, 842065
                  or           s4, a5, s1
                  addi         a3, ra, -306
                  slti         zero, s7, -23
                  sub          s2, t0, s10
                  nop
                  sll          s9, t5, a7
                  xor          a7, t2, a7
                  nop
                  xori         s5, t6, 1560
                  srli         a2, t1, 20
                  sll          ra, s10, t0
                  lui          t6, 878498
                  li           t1, 0x80000000 #start riscv_int_numeric_corner_stream_34
                  li           s2, 0x80000000
                  li           a2, 0x80000000
                  li           s5, 0x0
                  li           s7, 0x80000000
                  li           t5, 0x58419079
                  li           s10, 0x0
                  li           s9, 0x0
                  li           s1, 0x525dfb8c
                  li           t0, 0x80000000
                  add          s9, t0, s7
                  sub          a2, s10, s5
                  nop
                  sub          s9, s10, a2
                  add          s2, s10, s7
                  auipc        s9, 976414
                  add          a2, s7, s5
                  sub          s2, s9, t0
                  addi         s2, t1, -1492
                  xori         a3, ra, -307
                  addi         s0, a2, 420
                  xor          s0, a4, t4
                  xori         s8, s8, -728
                  auipc        gp, 811162
                  addi         ra, a3, -1843
                  sub          t1, a0, t3
                  sra          a2, t3, zero
                  sll          t6, a7, t0
                  slti         t6, s0, -1586
                  srl          a5, t6, t4
                  slt          a7, s8, s3
                  andi         a1, a5, 1753
                  sra          t2, t1, sp
                  and          ra, s5, gp
                  xori         a5, s1, -511
                  andi         s6, a5, -1328
                  srl          s8, a2, gp
                  xori         s6, s10, -298
                  addi         s4, t6, 1359
                  slti         s9, a7, -1819
                  lui          s10, 951951
                  add          s7, ra, zero
                  slt          t0, s6, gp
                  or           t1, a7, a3
                  auipc        a7, 881967
                  sltu         s5, a4, s1
                  slti         s1, s2, 1376
                  add          a5, a2, t2
                  srai         a6, a4, 3
                  andi         t6, t2, -789
                  sra          s1, s8, s8
                  nop
                  xori         s10, sp, -1618
                  add          tp, s6, a1
                  auipc        t6, 486449
                  auipc        t2, 1034768
                  srli         a3, s8, 9
                  sltiu        s6, a3, 353
                  slti         s6, a5, -1554
                  slli         t2, s6, 18
                  srai         s5, a7, 22
                  slli         zero, s2, 22
                  and          zero, s0, a6
                  auipc        a1, 284143
                  sub          t0, s5, a7
                  nop
                  srai         t1, a6, 28
                  ori          t0, s9, -1687
                  and          s6, s9, gp
                  xor          a6, s6, t1
                  slti         tp, s0, -170
                  srli         a5, s3, 19
                  add          s11, s3, s11
                  srai         t6, tp, 17
                  sltiu        s11, s10, -1568
                  sub          zero, s8, t6
                  add          t6, s8, s3
                  andi         a5, s11, -1489
                  sltiu        t3, t5, -1804
                  ori          s6, ra, -31
                  sll          t6, a0, s1
                  srai         s9, s8, 14
                  auipc        t5, 658993
                  xori         a5, t4, 656
                  slti         t4, s8, -1221
                  slti         t3, t6, -1141
                  srl          s7, a2, gp
                  xori         s1, s11, -608
                  slti         s8, gp, 1563
                  slti         a7, a3, 584
                  add          a4, t1, t1
                  srli         zero, a1, 29
                  srli         t4, s8, 18
                  sltu         a4, s9, t6
                  nop
                  srli         gp, t3, 28
                  srli         a6, a0, 11
                  sub          t2, zero, sp
                  slli         s6, s9, 3
                  addi         ra, s4, 680
                  or           s2, t5, sp
                  or           ra, t2, a0
                  lui          t1, 806880
                  sra          s0, s10, t1
                  srl          s9, t3, s8
                  sra          ra, s0, s7
                  andi         a5, a5, -606
                  slti         t2, s5, -1920
                  auipc        s11, 115988
                  sra          s11, t4, a7
                  sll          t6, s9, a1
                  lui          a4, 373399
                  sltiu        s5, a7, -368
                  srli         s11, t6, 21
                  sll          t1, s7, s3
                  or           tp, ra, s10
                  sll          t2, s3, s6
                  lui          tp, 204246
                  or           s0, t6, gp
                  slli         s5, s10, 16
                  sra          s11, s4, t6
                  sub          s4, t3, s1
                  slli         a4, s9, 27
                  add          ra, t4, sp
                  sra          a5, zero, a3
                  srai         a7, a4, 2
                  andi         s8, gp, -1964
                  srl          s2, tp, a0
                  srl          a1, a5, a4
                  add          a2, s0, s8
                  srai         a3, s8, 23
                  slt          t0, t2, a2
                  slt          zero, t0, t3
                  sltiu        a7, a4, -1827
                  addi         s2, sp, -1311
                  sll          s8, s7, s7
                  andi         t6, a1, -1086
                  srli         s6, t1, 9
                  add          zero, t3, t4
                  slli         a7, gp, 22
                  nop
                  srl          a5, a7, a7
                  ori          s11, s8, -110
                  addi         t4, t2, 686
                  slli         a6, s3, 31
                  slti         a3, s8, 8
                  nop
                  srli         s11, t4, 19
                  srai         a3, s1, 24
                  srai         s0, t1, 31
                  li           tp, 0x80000000 #start riscv_int_numeric_corner_stream_0
                  li           s2, 0xffffffff
                  li           a6, 0xffffffff
                  li           s8, 0x80000000
                  li           s1, 0x0
                  li           t6, 0xffffffff
                  li           s0, 0xffffffff
                  li           s10, 0x0
                  li           t4, 0x80000000
                  li           t3, 0x0
                  addi         a6, s2, -1419
                  auipc        s8, 700838
                  add          t3, t6, s1
                  lui          t4, 93664
                  lui          tp, 887183
                  addi         a6, s2, 1625
                  add          s1, t6, t3
                  sub          a5, tp, zero
                  or           a6, a5, s5
                  srai         s11, s2, 23
                  addi         s5, t2, -1921
                  or           s11, sp, gp
                  nop
                  slli         s5, zero, 11
                  auipc        a1, 1013034
                  slt          t0, t1, s8
                  srl          zero, s8, t1
                  sub          s10, t2, zero
                  srai         a3, s4, 24
                  sll          a7, sp, t1
                  add          s10, a1, a0
                  srli         s0, s10, 0
                  sll          s6, s7, s4
                  srai         s4, s0, 22
                  add          s9, a5, gp
                  sltu         s4, sp, zero
                  srai         zero, sp, 14
                  sra          zero, a6, a1
                  sll          s11, s2, s4
                  sub          t4, a7, s10
                  sll          t0, s2, t6
                  sub          t5, s3, t4
                  sltu         a4, s3, sp
                  or           s4, a5, s11
                  sltiu        s7, s4, -1700
                  ori          s5, s2, 258
                  auipc        t1, 411278
                  sub          s8, t0, t6
                  add          tp, sp, s8
                  nop
                  ori          a6, zero, -1439
                  slti         zero, a1, 997
                  sra          t5, a1, a4
                  sll          t3, t1, s3
                  sltiu        s7, s4, 267
                  sll          ra, s5, a3
                  srli         s8, a7, 17
                  sub          t3, s9, s3
                  sll          t3, s3, a5
                  slli         s7, t6, 24
                  sltu         s1, t6, s10
                  slti         t5, t4, 53
                  auipc        a1, 361148
                  andi         s11, s2, -1145
                  nop
                  auipc        zero, 232820
                  slli         s0, s3, 17
                  or           a4, a1, s5
                  srl          a3, zero, s7
                  slt          a3, s11, zero
                  sra          a1, gp, t5
                  xor          a6, s11, a2
                  nop
                  sub          t0, t3, a7
                  xor          a1, ra, gp
                  or           t1, s9, t0
                  srai         t6, s10, 8
                  addi         t3, s2, 574
                  nop
                  xor          s8, a7, s6
                  srli         s10, ra, 27
                  sra          s7, s3, zero
                  auipc        tp, 3507
                  slti         t2, t1, -1710
                  or           t1, t6, zero
                  sltu         a4, s1, sp
                  slti         ra, s8, 341
                  slti         t6, zero, 720
                  xori         s11, t1, -1716
                  auipc        s9, 251497
                  xori         t1, t5, 692
                  xor          s6, a7, a7
                  srl          tp, t5, a1
                  auipc        a3, 645349
                  sltu         t5, s1, t0
                  srl          a3, a4, s9
                  ori          zero, a3, -1870
                  srai         tp, a6, 5
                  slt          zero, s10, s6
                  slti         s11, a6, -1796
                  lui          zero, 723853
                  sltiu        s1, a6, 1427
                  sub          a2, a5, s9
                  xori         a6, s1, 1079
                  sltiu        a2, t2, 342
                  srli         s10, s5, 12
                  addi         s0, sp, 1201
                  slli         s10, s3, 17
                  or           tp, a0, a6
                  sub          s0, s5, a1
                  lui          a1, 232534
                  sub          s5, t4, s1
                  addi         s9, s7, -1076
                  srai         t6, s1, 6
                  slt          zero, s9, s9
                  slt          s2, s2, a4
                  slti         tp, t3, 278
                  srli         a3, a4, 14
                  ori          a2, s5, 1173
                  lui          s4, 446415
                  sll          a4, a7, s0
                  sltu         zero, a3, s6
                  sltiu        tp, a6, -369
                  slli         zero, s8, 14
                  xori         s10, s11, -961
                  addi         tp, s3, 1568
                  ori          s5, tp, 1005
                  xori         ra, s3, 566
                  lui          s8, 313224
                  slti         s0, a0, -1403
                  xori         t3, s5, -1098
                  ori          t0, s8, -1586
                  nop
                  sll          s5, t4, a0
                  sltu         s5, t3, a6
                  slt          t3, s2, s10
                  sltu         a2, s4, tp
                  sll          a2, tp, s6
                  sra          s2, a0, s2
                  lui          t2, 224491
                  ori          s9, s5, 903
                  nop
                  sub          tp, t6, gp
                  auipc        s0, 107581
                  xori         t0, zero, 1840
                  auipc        s5, 703972
                  lui          zero, 456456
                  auipc        a7, 984111
                  srli         t2, s2, 9
                  auipc        t5, 896284
                  ori          a4, a0, -772
                  andi         s2, a3, 1421
                  or           a6, s6, s1
                  auipc        a4, 800096
                  auipc        s4, 905901
                  nop
                  xori         zero, a1, -765
                  sub          s10, s2, a3
                  sra          a1, s8, t6
                  slt          t6, sp, t4
                  sra          s11, s2, s9
                  auipc        a4, 739451
                  sll          s7, a1, ra
                  auipc        zero, 485764
                  sll          s10, s9, sp
                  sll          t3, s7, s5
                  add          s6, a6, ra
                  slt          s4, s9, s8
                  xori         a3, a4, 517
                  slt          a6, tp, a1
                  xori         s9, a5, -1710
                  slti         ra, a5, 55
                  sltiu        s9, s11, 1690
                  sltiu        a2, s2, -819
                  li           tp, 0x80000000 #start riscv_int_numeric_corner_stream_39
                  li           a7, 0x0
                  li           a3, 0x0
                  li           t2, 0xd1ac0f9a
                  li           t5, 0x0
                  li           s4, 0x80000000
                  li           a5, 0x0
                  li           s7, 0x96c3d133
                  li           ra, 0xffffffff
                  li           s10, 0x0
                  auipc        a7, 716397
                  auipc        t2, 698487
                  lui          a7, 635365
                  add          a7, tp, ra
                  add          tp, t5, t2
                  auipc        s7, 93845
                  sub          tp, tp, a3
                  add          a5, s7, a5
                  sub          ra, s4, tp
                  add          a7, t2, tp #end riscv_int_numeric_corner_stream_39
                  slli         a5, a2, 5
                  slt          s5, s5, s11
                  sra          t2, a2, a4
                  or           s4, s2, t0
                  srai         s5, s7, 23
                  sltu         s0, s7, s3
                  sltiu        s2, s7, 211
                  sra          a3, a5, s9
                  and          s11, zero, s8
                  lui          s11, 385126
                  addi         s10, s8, -1408
                  xor          s4, s6, tp
                  andi         s8, s0, -1922
                  sltiu        a4, s5, -1043
                  or           a3, zero, t4
                  addi         a5, a5, -1243
                  sra          a7, t3, s2
                  srl          s5, ra, s4
                  slli         s4, a2, 1
                  auipc        s0, 594746
                  add          s10, t1, s1
                  lui          a1, 431521
                  auipc        t4, 587332
                  nop
                  sltiu        a6, a5, 1012
                  and          t3, a7, t1
                  ori          a6, s1, -1600
                  srli         t1, s5, 22
                  lui          a2, 120789
                  sltiu        a3, a7, -541
                  srl          gp, tp, s9
                  srli         s7, sp, 31
                  auipc        t2, 120092
                  auipc        s8, 6132
                  addi         zero, t5, 1090
                  sll          s8, t5, s10
                  xor          s5, sp, s2
                  slt          t3, s11, s2
                  sltu         t2, a6, s9
                  xori         a6, s11, 1171
                  srai         s4, s10, 15
                  lui          t0, 109105
                  xori         t1, s3, 318
                  nop
                  auipc        a3, 803410
                  slt          t0, t4, s0
                  sltiu        a3, s5, 1736
                  andi         a2, t4, 1568
                  xor          t1, zero, t2
                  lui          a4, 141030
                  sll          tp, t6, zero
                  slti         s4, t0, -658
                  add          s6, s1, t1
                  nop
                  lui          ra, 405523
                  slt          s11, a4, a0
                  xori         s11, s9, -295
                  add          s10, t4, t5
                  slli         s8, s5, 28
                  srli         s1, s4, 10
                  nop
                  xor          s6, a0, s2
                  sub          t4, s0, s0
                  slti         s0, t6, -751
                  lui          a2, 1024686
                  andi         a3, s2, -247
                  slli         a5, ra, 21
                  srl          a5, s3, t4
                  and          s10, s9, a6
                  sltiu        s7, a7, 275
                  sub          a5, a1, s6
                  slti         t3, s4, 1304
                  xor          a1, ra, t6
                  srai         s8, t6, 14
                  xori         s5, t6, 1759
                  srai         t6, ra, 23
                  slli         zero, zero, 15
                  addi         a7, a5, 578
                  addi         zero, t3, 667
                  sub          t3, s5, s0
                  sll          t2, a7, s0
                  xori         ra, tp, -1848
                  nop
                  srli         a3, s9, 11
                  xor          s8, s8, s7
                  slli         s8, s11, 10
                  and          a1, zero, t5
                  xori         a1, t1, 2027
                  and          a7, a3, ra
                  sltiu        s11, s1, -444
                  or           t5, a0, a4
                  ori          zero, a5, -1088
                  ori          ra, t3, 1181
                  srai         a2, a0, 25
                  slti         a1, s5, -722
                  slti         s9, zero, 488
                  slti         a6, s8, -417
                  srl          a4, s11, s6
                  nop
                  sll          t2, t2, t5
                  slli         a3, sp, 26
                  add          s9, s8, s3
                  sub          t6, s2, s1
                  lui          s6, 256756
                  nop
                  sltiu        t1, s2, -1605
                  add          t6, s4, t0
                  sra          s10, s0, a2
                  addi         s1, t5, 1015
                  srai         a5, gp, 6
                  slli         s10, s3, 12
                  lui          s2, 674473
                  sltiu        s5, sp, 519
                  srai         ra, a7, 20
                  srl          a7, t3, sp
                  slli         s7, s9, 12
                  slli         s7, t3, 4
                  andi         t5, a0, 272
                  auipc        t6, 842577
                  ori          t0, ra, -1008
                  srli         a2, a7, 22
                  sltu         s0, t3, s6
                  slti         s4, tp, 1028
                  and          a7, a0, s11
                  andi         t4, a7, 1395
                  sub          a4, s1, s5
                  and          t2, t6, t4
                  xori         a7, s8, 554
                  sub          a6, a5, a4
                  srai         a5, t3, 19
                  and          t3, s3, t6
                  sltiu        s1, tp, 1549
                  ori          s9, t1, 1945
                  and          zero, a6, t2
                  slli         s7, s7, 29
                  xor          s0, a4, a0
                  xor          s10, s10, a0
                  addi         t2, a7, -1992
                  and          s2, t3, t1
                  auipc        a7, 515658
                  sll          t2, a7, a0
                  ori          s2, s11, -1424
                  sub          a3, t5, tp
                  sll          a6, a0, a3
                  sltu         s11, t3, zero
                  auipc        a5, 959654
                  sra          a4, zero, t5
                  srli         zero, gp, 6
                  srai         s5, s6, 14
                  lui          s6, 850598
                  sltiu        t3, t4, 581
                  sltu         a2, a2, zero
                  or           s10, zero, a3
                  slti         zero, s6, -140
                  nop
                  slt          s0, a1, s2
                  sltiu        s9, a2, 891
                  add          a4, s9, a0
                  add          s7, gp, t3
                  srl          a5, s9, s0
                  sra          t0, s9, s9
                  nop
                  srai         s9, s6, 21
                  slli         t0, t5, 17
                  sltiu        a3, s4, 629
                  slli         s5, s3, 7
                  auipc        a2, 589041
                  slt          t3, a6, t5
                  srl          s4, s0, s1
                  sll          t5, t4, a7
                  nop
                  and          s1, a0, ra
                  and          a5, s3, tp
                  and          s5, sp, t5
                  sll          a5, s9, t6
                  add          s11, s0, s2
                  sub          s1, t3, s5
                  sltiu        t5, s2, -867
                  and          t1, gp, s10
                  nop
                  srli         s2, a2, 17
                  srai         tp, gp, 30
                  srai         a1, gp, 17
                  xori         s9, a5, -447
                  ori          s4, s3, 230
                  nop
                  sltiu        gp, t3, -1634
                  sltu         s10, s5, t3
                  and          s6, a6, s1
                  sll          s6, a5, s9
                  nop
                  sub          s9, t1, t4
                  lui          t1, 1039817
                  sra          t6, t1, t1
                  ori          t6, a4, -803
                  xori         gp, a1, 1219
                  ori          ra, a5, 419
                  auipc        s11, 1040490
                  sub          t2, t2, sp
                  sll          s10, ra, a3
                  auipc        t1, 451275
                  xori         s1, s5, -448
                  sll          t4, s9, t6
                  andi         s7, a7, 1194
                  slti         s10, tp, 1470
                  sra          s1, s5, tp
                  sra          a5, zero, a5
                  addi         s8, s3, 182
                  slti         gp, a4, 981
                  slti         s11, gp, -1540
                  srli         a2, s1, 7
                  and          a3, t3, a7
                  slti         s0, sp, -983
                  slti         a4, s3, -1524
                  add          a5, s11, s9
                  srl          t6, zero, a1
                  srli         t6, sp, 28
                  slti         ra, tp, -1256
                  or           s4, s8, a1
                  and          s6, t1, t2
                  xor          s0, s5, zero
                  sltiu        a3, s10, 1998
                  sltu         a2, a3, a5
                  srai         s9, t6, 3
                  srli         s9, s11, 26
                  add          s7, t0, t1
                  ori          ra, s6, 940
                  ori          s11, a7, -238
                  lui          t2, 264832
                  sltu         s6, a4, t0
                  add          tp, s2, s9
                  andi         t3, a5, 214
                  slli         s2, t4, 0
                  ori          gp, a5, 1443
                  sll          a2, a6, ra
                  sra          s9, a1, s0
                  ori          t5, tp, -1824
                  sltu         s10, a1, a4
                  nop
                  add          t0, a4, a5
                  sltu         a5, a7, s5
                  lui          zero, 764933
                  addi         zero, s6, 1199
                  slt          s4, ra, s1
                  slt          a2, s1, s7
                  slti         t0, s7, -1883
                  andi         t6, a0, 581
                  slli         t5, s3, 6
                  and          t0, a3, a7
                  xor          s10, a1, a3
                  add          a4, s3, s9
                  lui          t0, 902214
                  slt          t2, sp, s10
                  xori         s2, ra, -1146
                  nop
                  xori         a1, ra, -1053
                  sltiu        t1, t1, 1285
                  nop
                  srl          s0, s5, gp
                  sub          s6, t2, s6
                  xori         a2, t0, -1466
                  add          s5, ra, a4
                  srli         t4, t6, 5
                  srai         s2, ra, 8
                  sra          s0, a6, s8
                  srai         t4, s1, 8
                  sltu         t0, t1, s1
                  sll          t3, s1, sp
                  addi         a3, a5, -1845
                  or           s7, gp, a4
                  slti         a2, a4, -595
                  ori          t1, sp, -103
                  and          a5, sp, s7
                  ori          s4, a1, 566
                  xor          s1, t6, s10
                  and          a2, s4, ra
                  sub          t5, tp, ra
                  sub          a3, sp, s7
                  slli         s1, a5, 7
                  sltu         s0, a4, t3
                  or           s10, a0, zero
                  sll          a2, s8, a2
                  srli         t5, a0, 16
                  and          t4, a6, s6
                  slti         t2, s9, -540
                  sra          zero, a0, a6
                  slti         t5, t4, 1165
                  sub          s2, a6, ra
                  addi         s4, s1, 1538
                  lui          t5, 930044
                  sltu         s9, a4, t0
                  sll          s4, s4, a7
                  ori          a7, ra, 1909
                  addi         t0, a0, 873
                  slti         ra, gp, -640
                  xor          zero, t3, t1
                  auipc        t3, 963402
                  or           a5, t5, a5
                  add          t4, s7, s8
                  xor          a2, a6, ra
                  slt          a2, s11, t4
                  andi         ra, a2, -1854
                  xori         a6, t3, 540
                  xor          s9, s6, t4
                  sub          s8, s4, t6
                  addi         a7, t5, 1536
                  srai         t5, s9, 20
                  nop
                  sltiu        a7, s6, -1353
                  slli         a3, t4, 16
                  nop
                  or           zero, s3, a6
                  sltu         t0, s10, a2
                  or           ra, a3, s6
                  slli         s11, s3, 8
                  srli         zero, a7, 24
                  auipc        s4, 58302
                  srli         t2, a7, 19
                  nop
                  sll          zero, a4, s9
                  add          t2, a7, s1
                  or           t3, s8, s5
                  add          ra, t1, s2
                  sltiu        s8, a3, -1679
                  and          t6, s5, s1
                  add          t2, s2, t1
                  sra          s5, t4, a2
                  auipc        a5, 734662
                  nop
                  slli         gp, t0, 31
                  sra          a7, s3, t1
                  xori         s7, s7, -841
                  and          t0, s3, t3
                  sltu         t5, a6, s9
                  or           s9, t2, a6
                  sll          s6, tp, a6
                  sll          s2, s1, ra
                  srai         s7, s4, 14
                  xor          t1, s1, a2
                  xori         s0, a7, -1189
                  add          a3, s5, t1
                  slli         s8, t0, 11
                  slti         a2, s5, 864
                  sub          s4, s11, a5
                  sra          s9, gp, s6
                  xori         s8, a3, 612
                  ori          s5, s7, -1804
                  slli         s4, a0, 31
                  sra          s2, t1, ra
                  xori         s4, s8, -22
                  add          t6, a1, tp
                  srli         a1, tp, 26
                  slli         s11, s1, 17
                  and          s0, s8, s5
                  sltiu        s9, s0, -1690
                  slt          a6, s3, t2
                  sltiu        s0, t4, 1176
                  xor          a4, s3, zero
                  sltu         s7, a0, gp
                  sltiu        a6, a7, -800
                  or           s10, s4, t3
                  auipc        a5, 825534
                  srli         t4, t6, 11
                  xor          s8, ra, a7
                  xori         s2, tp, 706
                  ori          t5, ra, -59
                  slti         a2, sp, -1774
                  sll          gp, a2, t4
                  and          s11, t0, t1
                  lui          s10, 215394
                  slt          t0, s5, t3
                  xori         tp, s1, 957
                  nop
                  srai         a5, t1, 11
                  slti         s4, a6, -481
                  xor          t3, s8, a3
                  xor          s0, s9, a7
                  sra          a6, a2, s1
                  andi         t2, s1, -1759
                  slli         s8, s6, 30
                  or           s9, a6, s3
                  ori          s1, a2, -877
                  add          s5, t2, a6
                  xori         gp, s1, -1997
                  slti         s9, t0, -40
                  sll          a3, t6, a0
                  auipc        t2, 575619
                  andi         a3, s3, -486
                  srai         s11, a1, 16
                  lui          a6, 887336
                  lui          a4, 659487
                  slli         a1, gp, 26
                  auipc        ra, 249064
                  or           s6, s7, s2
                  ori          a6, a7, 1875
                  slli         t0, a5, 13
                  xor          a4, a4, a3
                  srl          s9, zero, s8
                  andi         s0, a6, -59
                  andi         s8, tp, -1616
                  sra          s1, s0, zero
                  andi         t0, a1, -1793
                  slti         a4, s7, 599
                  nop
                  lui          t1, 519117
                  sltu         t2, ra, s1
                  sll          a1, t0, a0
                  or           t4, a5, t3
                  srli         a5, s2, 25
                  add          a4, tp, t2
                  srai         t5, t0, 12
                  slt          a5, a7, a1
                  ori          ra, t2, 1786
                  srli         a7, s6, 25
                  srli         s5, s11, 14
                  auipc        tp, 813196
                  xori         a3, a3, 366
                  sra          s11, s0, s2
                  sltiu        a5, a2, -392
                  sltu         t6, ra, t5
                  slli         gp, s2, 24
                  auipc        s8, 747192
                  sra          s2, s3, s6
                  slli         t3, s3, 4
                  srl          t2, zero, a2
                  xor          s6, s2, s3
                  sltiu        a1, s4, -1516
                  srli         s4, s2, 18
                  xori         ra, t6, -1779
                  sltu         a5, t4, s5
                  sll          t0, a5, s1
                  srai         s9, a5, 20
                  srai         a2, t0, 16
                  add          t4, a2, t6
                  add          s2, t6, s10
                  xori         t4, a5, 755
                  addi         ra, s5, 324
                  nop
                  xor          a6, sp, zero
                  add          s9, s8, t3
                  lui          s6, 242253
                  ori          s7, a4, 1938
                  sltiu        t1, s0, 496
                  and          a4, s8, t2
                  sll          a2, s4, a0
                  and          a6, t6, sp
                  xor          t4, s5, zero
                  sub          t1, zero, tp
                  nop
                  sll          gp, zero, s6
                  andi         s11, s3, 773
                  andi         s5, t3, 1263
                  nop
                  andi         s7, s8, 1484
                  slti         a2, s4, -1648
                  addi         s4, a5, 1297
                  andi         s2, s11, 1366
                  nop
                  slt          s11, s6, t3
                  srli         t1, t5, 3
                  ori          s0, t0, 419
                  add          t1, a7, t3
                  sra          ra, a1, s0
                  sltiu        s11, a0, -836
                  andi         a1, s6, 1291
                  sltiu        t4, s7, 955
                  slt          a7, s2, s6
                  ori          s11, s7, -776
                  srl          s10, a1, s6
                  auipc        s5, 383630
                  slt          s9, a0, s2
                  sub          s7, a7, t4
                  sltu         t6, t3, s0
                  slli         t4, a7, 10
                  srli         t0, s6, 16
                  ori          s5, a0, -1956
                  sub          t6, s7, t0
                  srai         s4, s10, 13
                  srai         a2, a7, 2
                  and          gp, t3, a0
                  sra          t6, a6, t2
                  sltu         gp, s9, zero
                  xor          s5, ra, t6
                  ori          tp, ra, -735
                  srai         s0, sp, 0
                  slli         t4, t6, 23
                  slti         a6, s9, 768
                  srli         s1, zero, 5
                  slti         a7, t5, -1259
                  andi         ra, a3, -1612
                  addi         a2, sp, -1756
                  nop
                  ori          a4, t0, -73
                  auipc        a3, 286493
                  auipc        a6, 111569
                  nop
                  andi         t2, s1, -1208
                  addi         zero, a2, 686
                  slt          s6, gp, s6
                  nop
                  sltiu        zero, s0, 47
                  xori         t2, s0, -1933
                  nop
                  lui          t3, 1024
                  auipc        a5, 503639
                  ori          a6, a3, 1789
                  xori         a7, tp, -813
                  xori         s11, s7, -499
                  sra          a7, sp, s10
                  sub          gp, t1, t0
                  add          s0, s5, gp
                  slli         t3, a6, 11
                  addi         a1, s6, 1039
                  slt          a1, s9, tp
                  srl          s4, s10, t2
                  addi         s11, s0, -1637
                  srai         a7, a4, 24
                  srli         a4, a1, 15
                  srl          s8, a7, ra
                  lui          t5, 446362
                  sltiu        gp, s4, -221
                  sltu         s5, t6, s3
                  li           s4, 0x80000000 #start riscv_int_numeric_corner_stream_1
                  li           a6, 0x0
                  li           a5, 0xffffffff
                  li           s1, 0x80000000
                  li           a2, 0xcac8ef1b
                  li           t4, 0x0
                  li           a4, 0xffffffff
                  li           gp, 0x0
                  li           t1, 0xffffffff
                  li           t5, 0x87ff74f9
                  auipc        t4, 206494
                  addi         a2, t5, -695
                  addi         s4, t1, -664
                  sub          a5, t5, a6
                  add          s4, gp, a2
                  add          a6, s4, s1
                  nop
                  auipc        t5, 47791
                  lui          s1, 850917
                  srli         s6, t1, 9
                  and          s0, s2, s11
                  sll          s4, t5, s2
                  srai         s8, a4, 17
                  srai         s1, s6, 29
                  andi         a6, s1, -1172
                  andi         t0, s3, -466
                  slti         s8, t5, -1689
                  nop
                  slti         s10, a3, 961
                  sltiu        s2, t0, 964
                  srl          a4, t2, t2
                  srli         zero, t4, 0
                  xori         s9, a4, -1226
                  auipc        a4, 706763
                  andi         a4, a1, 431
                  or           s11, s6, a2
                  andi         s2, a6, 28
                  addi         a4, a1, 1109
                  srli         a6, a4, 10
                  ori          s5, tp, 0
                  srli         a4, t1, 0
                  srli         s11, t5, 15
                  srai         t0, ra, 0
                  addi         a6, s11, -1836
                  sll          tp, s0, s1
                  nop
                  sra          t5, s1, a1
                  sub          s8, zero, s10
                  sltiu        s6, t6, 8
                  sll          s5, t0, s11
                  sub          t1, a5, zero
                  or           s8, s5, a1
                  srli         s5, s6, 3
                  sltu         a3, a6, sp
                  sll          a7, a0, a7
                  addi         t5, a3, -2023
                  andi         s0, t4, -1175
                  and          s8, s3, t1
                  sll          s10, s5, s7
                  sltu         ra, t5, s5
                  sltiu        t0, s8, -1667
                  srl          s4, ra, t3
                  and          a5, s5, s0
                  or           s5, s6, t2
                  or           ra, gp, t5
                  or           s10, ra, zero
                  srai         t2, s4, 14
                  ori          tp, a2, 1730
                  addi         gp, s1, -1758
                  and          a4, t1, a7
                  or           t4, t5, a1
                  and          a5, a3, a5
                  auipc        a6, 97256
                  sll          s7, s7, t0
                  slti         t5, tp, 140
                  slti         s9, s11, -927
                  add          t3, s9, a3
                  add          t3, s11, t6
                  slt          a5, s4, zero
                  slti         t6, s11, -1944
                  srl          a1, s3, sp
                  sll          s0, t1, gp
                  sltiu        ra, a3, -1410
                  srli         t3, s7, 29
                  srl          zero, a3, s10
                  auipc        s0, 867143
                  slli         s6, s2, 13
                  xori         s2, s2, 739
                  add          a4, t6, t1
                  xori         s10, s5, -207
                  ori          t6, zero, 124
                  srl          s8, t0, s11
                  xor          s9, a1, t2
                  addi         a3, t5, 1777
                  sub          s11, ra, a3
                  slli         t3, sp, 26
                  ori          t6, s5, -80
                  add          t1, s5, s7
                  nop
                  sub          t0, t5, t5
                  li           s7, 0xffffffff #start riscv_int_numeric_corner_stream_10
                  li           a3, 0x80000000
                  li           s2, 0x80000000
                  li           s11, 0x0
                  li           gp, 0x5399f1b0
                  li           s8, 0xffffffff
                  li           a2, 0xffffffff
                  li           s6, 0xffffffff
                  li           t1, 0x80000000
                  li           t6, 0xab01d2f8
                  lui          s7, 258570
                  auipc        s2, 291433
                  auipc        s2, 553430
                  lui          s6, 90515
                  nop
                  sub          gp, a2, a2
                  addi         s8, s6, -1671
                  nop
                  nop
                  sltiu        a2, a6, 663
                  lui          t5, 824565
                  andi         a1, t5, 1006
                  addi         a1, s8, -428
                  slt          t2, t0, t3
                  xor          zero, s11, s10
                  sll          a3, a0, a3
                  srl          a1, a0, t4
                  auipc        zero, 614931
                  xori         a6, a0, -2013
                  sltu         t2, s5, s3
                  srli         gp, t5, 19
                  srl          zero, gp, gp
                  sltiu        a3, a2, 1782
                  slti         s4, a7, -1558
                  ori          s11, a6, -1345
                  srli         s5, s4, 22
                  and          t3, t3, s2
                  add          ra, s8, zero
                  sll          a2, ra, s5
                  sll          s8, zero, s8
                  sra          t0, a0, t2
                  addi         t3, s11, -1629
                  ori          t4, a2, -1567
                  srli         s5, t6, 31
                  srli         a4, a3, 6
                  srli         ra, a4, 26
                  slt          gp, t6, ra
                  or           t1, a5, a7
                  sltiu        s0, s0, -601
                  ori          a3, a2, -640
                  sub          tp, s9, s7
                  srli         s2, s2, 20
                  xor          ra, ra, t0
                  or           a3, s7, t5
                  sltiu        a3, t3, 196
                  sltu         s7, t1, ra
                  or           a6, s5, s2
                  andi         t0, a5, -1023
                  slli         ra, s9, 25
                  lui          s2, 989136
                  auipc        t5, 469361
                  srl          s1, ra, t4
                  ori          t5, t5, 640
                  sltiu        s6, s9, -466
                  sub          gp, a3, s4
                  andi         t6, t4, -417
                  srl          s5, t4, a0
                  slli         ra, ra, 1
                  andi         a4, a0, 2006
                  addi         s7, zero, -173
                  srl          s8, t0, t5
                  srli         s5, t5, 6
                  srai         ra, s9, 17
                  and          s4, s3, s9
                  sub          s7, gp, s7
                  ori          t3, t0, -1177
                  ori          s2, s5, -1951
                  srai         a5, s3, 27
                  xor          s4, s8, t4
                  slli         gp, s10, 9
                  auipc        t3, 856638
                  addi         a2, s7, -1842
                  sub          s0, s4, a0
                  sra          a6, a6, t3
                  srli         t3, a5, 27
                  sll          a7, s4, s6
                  auipc        a2, 586761
                  xor          a3, a7, s5
                  srli         s10, t0, 4
                  and          s10, s3, a5
                  xor          t6, s0, t6
                  sltiu        tp, a6, -1159
                  slli         s11, a3, 30
                  nop
                  srai         a7, s2, 22
                  nop
                  andi         a7, t5, 639
                  nop
                  nop
                  slt          a4, a7, s5
                  sll          s2, t3, a7
                  ori          t1, s8, 1404
                  auipc        s2, 196853
                  sltiu        s9, s6, -604
                  add          a6, a1, a5
                  sltu         a5, s2, s1
                  srl          tp, t6, a3
                  xor          ra, s3, t1
                  srl          t6, s0, a3
                  auipc        s2, 199009
                  andi         gp, t5, 178
                  slli         a6, sp, 23
                  auipc        t5, 343386
                  addi         tp, t1, -1097
                  and          t2, s11, t6
                  slti         s4, zero, 1194
                  slti         a3, s8, 4
                  srai         t3, s11, 20
                  slli         s8, gp, 10
                  xor          a1, s5, s3
                  sll          s4, a4, s11
                  ori          t1, a3, 811
                  sll          t5, t4, a0
                  slti         s8, s2, 1285
                  nop
                  andi         a6, a4, 2014
                  slli         a4, a6, 15
                  xor          s9, a1, a1
                  slti         s0, a0, 747
                  xor          s7, a3, s10
                  slli         s4, s8, 26
                  andi         s8, t0, 1292
                  and          s9, t4, ra
                  auipc        t3, 680570
                  sltiu        t3, s4, -124
                  xori         tp, tp, 513
                  sub          a3, a6, s1
                  and          a3, a2, gp
                  sltu         a2, ra, s0
                  sltiu        t2, t1, -1279
                  or           s6, s6, t5
                  xori         ra, t5, 131
                  xori         t6, a0, -266
                  and          a6, sp, t2
                  slti         t0, s4, -24
                  slti         t0, s10, 1393
                  and          t6, a4, a1
                  lui          gp, 752727
                  slli         s6, t3, 30
                  li           s11, 0xec23f26b #start riscv_int_numeric_corner_stream_32
                  li           a6, 0xffffffff
                  li           s8, 0xffffffff
                  li           ra, 0x42f61384
                  li           a5, 0xb69648fa
                  li           t4, 0xffffffff
                  li           a4, 0x80000000
                  li           t5, 0xffffffff
                  li           a7, 0x5a65a953
                  li           gp, 0x824e0e2c
                  add          s8, a4, a4
                  auipc        a7, 236671
                  addi         a6, s8, -1093
                  nop
                  add          a7, gp, t5
                  add          a6, a4, a7
                  sltiu        t4, s0, 1323
                  or           s8, a1, t0
                  slli         a5, s1, 18
                  slt          a6, a5, sp
                  nop
                  add          s10, s9, a4
                  auipc        gp, 495898
                  xori         s8, t3, -1342
                  or           a3, s11, sp
                  srl          ra, tp, t0
                  auipc        s4, 866044
                  slti         s1, a4, -543
                  sub          a5, sp, s1
                  and          t0, t5, gp
                  srli         gp, t2, 11
                  add          a2, a0, a2
                  sra          t6, s3, a6
                  auipc        s7, 918385
                  slti         a2, zero, 246
                  sltiu        s1, t0, -302
                  slt          t5, a4, s4
                  li           t4, 0x80000000 #start riscv_int_numeric_corner_stream_16
                  li           a3, 0xffffffff
                  li           t0, 0x80000000
                  li           tp, 0x19b918b7
                  li           ra, 0x80000000
                  li           a2, 0x0
                  li           s2, 0x34bd6994
                  li           t1, 0x2e07cdc8
                  li           s6, 0x80000000
                  li           t3, 0xffffffff
                  nop
                  auipc        ra, 600663
                  add          a2, t1, t4
                  nop
                  sub          t3, t3, ra
                  auipc        t3, 108859
                  auipc        s2, 153230
                  add          t1, t0, t0
                  nop
                  auipc        a2, 792778
                  lui          a2, 396742
                  sub          s6, t3, ra #end riscv_int_numeric_corner_stream_16
                  addi         gp, sp, 1981
                  sll          t5, a3, a4
                  lui          s4, 922583
                  sll          a1, zero, t4
                  sltu         s11, gp, s4
                  lui          s2, 134856
                  and          s8, a6, a5
                  srai         s1, a4, 28
                  sltu         s4, s10, a7
                  or           zero, a2, t2
                  srli         t0, sp, 17
                  auipc        s10, 695421
                  slti         t2, s9, -1788
                  auipc        zero, 124332
                  sltu         s6, s5, t0
                  sltu         s10, tp, t2
                  srli         s2, t2, 30
                  add          s2, a6, gp
                  sltu         ra, s0, s1
                  sra          t6, zero, tp
                  sra          a1, t1, a5
                  auipc        a2, 350929
                  slt          s1, a1, a7
                  ori          s8, sp, -379
                  sub          gp, s11, s1
                  slt          s7, tp, a7
                  nop
                  and          s10, a2, s11
                  xor          a6, a7, s3
                  sub          t3, s0, tp
                  sltiu        ra, tp, 508
                  lui          s2, 641512
                  sub          a2, a4, a7
                  lui          t1, 221496
                  andi         ra, gp, -286
                  srli         ra, tp, 20
                  nop
                  srl          s6, gp, t2
                  xor          a7, sp, a4
                  ori          t4, s3, -2016
                  auipc        s8, 812679
                  and          a3, s8, a3
                  and          s5, s5, s3
                  slli         t4, tp, 11
                  srl          s6, t6, s8
                  ori          t3, t2, -1561
                  slti         a1, s9, 881
                  sub          s8, ra, t3
                  srl          s9, a7, a6
                  and          a4, t1, a6
                  srl          s11, ra, a3
                  or           a2, s1, a2
                  slt          s2, s6, a5
                  sra          s7, s11, a4
                  or           s2, t2, s1
                  srli         s10, gp, 16
                  addi         t3, a5, 1153
				  #TS_ADD_BEGIN
                  #la x2, test_done
                  #jalr x0, x2, 0

				  lw ra, 12(sp)
				  addi sp, sp, 16

				  ret
				  #TS_ADD_END
test_done:        
                  li gp, 1
                  ecall
write_tohost:     
                  sw gp, tohost, t5

_exit:            
                  j write_tohost

instr_end:        
                  nop

.section .data
.align 6; .global tohost; tohost: .dword 0;
.align 6; .global fromhost; fromhost: .dword 0;
.section .user_stack,"aw",@progbits;
.align 2
user_stack_start:
.rept 4999
.4byte 0x0
.endr
user_stack_end:
.4byte 0x0
.align 2
kernel_instr_start:
.text
.align           2
mtvec_handler:    
                  addi x10, x10, -4
                  sw  x19, (x10)
                  add x19, x10, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x10, x19, zero
                  srli x9, x9, 31
                  bne x9, x0, mmode_intr_handler

#mmode_exception_handler:
#                  li x8, 0x3 # BREAKPOINT
#                  beq x9, x8, ebreak_handler
#                  li x8, 0x8 # ECALL_UMODE
#                  beq x9, x8, ecall_handler
#                  li x8, 0x9 # ECALL_SMODE
#                  beq x9, x8, ecall_handler
#                  li x8, 0xb # ECALL_MMODE
#                  beq x9, x8, ecall_handler
#                  li x8, 0x1
#                  beq x9, x8, instr_fault_handler
#                  li x8, 0x5
#                  beq x9, x8, load_fault_handler
#                  li x8, 0x7
#                  beq x9, x8, store_fault_handler
#                  li x8, 0xc
#                  beq x9, x8, pt_fault_handler
#                  li x8, 0xd
#                  beq x9, x8, pt_fault_handler
#                  li x8, 0xf
#                  beq x9, x8, pt_fault_handler
#                  li x8, 0x2 # ILLEGAL_INSTRUCTION
#                  beq x9, x8, illegal_instr_handler
#                  1: la x2, test_done
#                  jalr x1, x2, 0

## To erase _start
#ecall_handler:    
#                  la x9, _start
#                  sw x0, 0(x9)
#                  sw x1, 4(x9)
#                  sw x2, 8(x9)
#                  sw x3, 12(x9)
#                  sw x4, 16(x9)
#                  sw x5, 20(x9)
#                  sw x6, 24(x9)
#                  sw x7, 28(x9)
#                  sw x8, 32(x9)
#                  sw x9, 36(x9)
#                  sw x10, 40(x9)
#                  sw x11, 44(x9)
#                  sw x12, 48(x9)
#                  sw x13, 52(x9)
#                  sw x14, 56(x9)
#                  sw x15, 60(x9)
#                  sw x16, 64(x9)
#                  sw x17, 68(x9)
#                  sw x18, 72(x9)
#                  sw x19, 76(x9)
#                  sw x20, 80(x9)
#                  sw x21, 84(x9)
#                  sw x22, 88(x9)
#                  sw x23, 92(x9)
#                  sw x24, 96(x9)
#                  sw x25, 100(x9)
#                  sw x26, 104(x9)
#                  sw x27, 108(x9)
#                  sw x28, 112(x9)
#                  sw x29, 116(x9)
#                  sw x30, 120(x9)
#                  sw x31, 124(x9)
#                  la x2, write_tohost
#                  jalr x0, x2, 0

instr_fault_handler:
                  add x19, x10, zero
                  lw  x1, 4(x19)
                  lw  x2, 8(x19)
                  lw  x3, 12(x19)
                  lw  x4, 16(x19)
                  lw  x5, 20(x19)
                  lw  x6, 24(x19)
                  lw  x7, 28(x19)
                  lw  x8, 32(x19)
                  lw  x9, 36(x19)
                  lw  x10, 40(x19)
                  lw  x11, 44(x19)
                  lw  x12, 48(x19)
                  lw  x13, 52(x19)
                  lw  x14, 56(x19)
                  lw  x15, 60(x19)
                  lw  x16, 64(x19)
                  lw  x17, 68(x19)
                  lw  x18, 72(x19)
                  lw  x19, 76(x19)
                  lw  x20, 80(x19)
                  lw  x21, 84(x19)
                  lw  x22, 88(x19)
                  lw  x23, 92(x19)
                  lw  x24, 96(x19)
                  lw  x25, 100(x19)
                  lw  x26, 104(x19)
                  lw  x27, 108(x19)
                  lw  x28, 112(x19)
                  lw  x29, 116(x19)
                  lw  x30, 120(x19)
                  lw  x31, 124(x19)
                  addi x19, x19, 128
                  add x10, x19, zero
                  lw  x19, (x10)
                  addi x10, x10, 4
                  mret

load_fault_handler:
                  add x19, x10, zero
                  lw  x1, 4(x19)
                  lw  x2, 8(x19)
                  lw  x3, 12(x19)
                  lw  x4, 16(x19)
                  lw  x5, 20(x19)
                  lw  x6, 24(x19)
                  lw  x7, 28(x19)
                  lw  x8, 32(x19)
                  lw  x9, 36(x19)
                  lw  x10, 40(x19)
                  lw  x11, 44(x19)
                  lw  x12, 48(x19)
                  lw  x13, 52(x19)
                  lw  x14, 56(x19)
                  lw  x15, 60(x19)
                  lw  x16, 64(x19)
                  lw  x17, 68(x19)
                  lw  x18, 72(x19)
                  lw  x19, 76(x19)
                  lw  x20, 80(x19)
                  lw  x21, 84(x19)
                  lw  x22, 88(x19)
                  lw  x23, 92(x19)
                  lw  x24, 96(x19)
                  lw  x25, 100(x19)
                  lw  x26, 104(x19)
                  lw  x27, 108(x19)
                  lw  x28, 112(x19)
                  lw  x29, 116(x19)
                  lw  x30, 120(x19)
                  lw  x31, 124(x19)
                  addi x19, x19, 128
                  add x10, x19, zero
                  lw  x19, (x10)
                  addi x10, x10, 4
                  mret

store_fault_handler:
                  add x19, x10, zero
                  lw  x1, 4(x19)
                  lw  x2, 8(x19)
                  lw  x3, 12(x19)
                  lw  x4, 16(x19)
                  lw  x5, 20(x19)
                  lw  x6, 24(x19)
                  lw  x7, 28(x19)
                  lw  x8, 32(x19)
                  lw  x9, 36(x19)
                  lw  x10, 40(x19)
                  lw  x11, 44(x19)
                  lw  x12, 48(x19)
                  lw  x13, 52(x19)
                  lw  x14, 56(x19)
                  lw  x15, 60(x19)
                  lw  x16, 64(x19)
                  lw  x17, 68(x19)
                  lw  x18, 72(x19)
                  lw  x19, 76(x19)
                  lw  x20, 80(x19)
                  lw  x21, 84(x19)
                  lw  x22, 88(x19)
                  lw  x23, 92(x19)
                  lw  x24, 96(x19)
                  lw  x25, 100(x19)
                  lw  x26, 104(x19)
                  lw  x27, 108(x19)
                  lw  x28, 112(x19)
                  lw  x29, 116(x19)
                  lw  x30, 120(x19)
                  lw  x31, 124(x19)
                  addi x19, x19, 128
                  add x10, x19, zero
                  lw  x19, (x10)
                  addi x10, x10, 4
                  mret

ebreak_handler:   
                  addi  x9, x9, 4
                  add x19, x10, zero
                  lw  x1, 4(x19)
                  lw  x2, 8(x19)
                  lw  x3, 12(x19)
                  lw  x4, 16(x19)
                  lw  x5, 20(x19)
                  lw  x6, 24(x19)
                  lw  x7, 28(x19)
                  lw  x8, 32(x19)
                  lw  x9, 36(x19)
                  lw  x10, 40(x19)
                  lw  x11, 44(x19)
                  lw  x12, 48(x19)
                  lw  x13, 52(x19)
                  lw  x14, 56(x19)
                  lw  x15, 60(x19)
                  lw  x16, 64(x19)
                  lw  x17, 68(x19)
                  lw  x18, 72(x19)
                  lw  x19, 76(x19)
                  lw  x20, 80(x19)
                  lw  x21, 84(x19)
                  lw  x22, 88(x19)
                  lw  x23, 92(x19)
                  lw  x24, 96(x19)
                  lw  x25, 100(x19)
                  lw  x26, 104(x19)
                  lw  x27, 108(x19)
                  lw  x28, 112(x19)
                  lw  x29, 116(x19)
                  lw  x30, 120(x19)
                  lw  x31, 124(x19)
                  addi x19, x19, 128
                  add x10, x19, zero
                  lw  x19, (x10)
                  addi x10, x10, 4
                  mret

illegal_instr_handler:
                  addi  x9, x9, 4
                  add x19, x10, zero
                  lw  x1, 4(x19)
                  lw  x2, 8(x19)
                  lw  x3, 12(x19)
                  lw  x4, 16(x19)
                  lw  x5, 20(x19)
                  lw  x6, 24(x19)
                  lw  x7, 28(x19)
                  lw  x8, 32(x19)
                  lw  x9, 36(x19)
                  lw  x10, 40(x19)
                  lw  x11, 44(x19)
                  lw  x12, 48(x19)
                  lw  x13, 52(x19)
                  lw  x14, 56(x19)
                  lw  x15, 60(x19)
                  lw  x16, 64(x19)
                  lw  x17, 68(x19)
                  lw  x18, 72(x19)
                  lw  x19, 76(x19)
                  lw  x20, 80(x19)
                  lw  x21, 84(x19)
                  lw  x22, 88(x19)
                  lw  x23, 92(x19)
                  lw  x24, 96(x19)
                  lw  x25, 100(x19)
                  lw  x26, 104(x19)
                  lw  x27, 108(x19)
                  lw  x28, 112(x19)
                  lw  x29, 116(x19)
                  lw  x30, 120(x19)
                  lw  x31, 124(x19)
                  addi x19, x19, 128
                  add x10, x19, zero
                  lw  x19, (x10)
                  addi x10, x10, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  add x19, x10, zero
                  lw  x1, 4(x19)
                  lw  x2, 8(x19)
                  lw  x3, 12(x19)
                  lw  x4, 16(x19)
                  lw  x5, 20(x19)
                  lw  x6, 24(x19)
                  lw  x7, 28(x19)
                  lw  x8, 32(x19)
                  lw  x9, 36(x19)
                  lw  x10, 40(x19)
                  lw  x11, 44(x19)
                  lw  x12, 48(x19)
                  lw  x13, 52(x19)
                  lw  x14, 56(x19)
                  lw  x15, 60(x19)
                  lw  x16, 64(x19)
                  lw  x17, 68(x19)
                  lw  x18, 72(x19)
                  lw  x19, 76(x19)
                  lw  x20, 80(x19)
                  lw  x21, 84(x19)
                  lw  x22, 88(x19)
                  lw  x23, 92(x19)
                  lw  x24, 96(x19)
                  lw  x25, 100(x19)
                  lw  x26, 104(x19)
                  lw  x27, 108(x19)
                  lw  x28, 112(x19)
                  lw  x29, 116(x19)
                  lw  x30, 120(x19)
                  lw  x31, 124(x19)
                  addi x19, x19, 128
                  add x10, x19, zero
                  lw  x19, (x10)
                  addi x10, x10, 4
                  mret;

kernel_instr_end: nop
.section .kernel_stack,"aw",@progbits;
.align 2
kernel_stack_start:
.rept 3999
.4byte 0x0
.endr
kernel_stack_end:
.4byte 0x0
