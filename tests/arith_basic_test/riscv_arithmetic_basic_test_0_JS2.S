.section .text
.global init
.global main
.global test
init:             
                  li x0, 0x0
                  li x1, 0x0
                  li x2, 0x5
                  li x3, 0x80000000
                  li x4, 0x0
                  li x5, 0x80000000
                  li x6, 0xfc242ebc
                  li x7, 0x6
                  li x8, 0xfe5dbcd7
                  li x9, 0x0
                  li x10, 0x0
                  li x11, 0x80000000
                  li x12, 0x7
                  li x13, 0x0
                  li x14, 0x11cfda8c
                  li x15, 0xfae3e372
                  li x16, 0xf30172f0
                  li x17, 0x4
                  li x18, 0x80000000
                  li x19, 0x0
                  li x20, 0xd
                  li x21, 0x3
                  li x22, 0x0
                  li x23, 0xe578f0d4
                  li x25, 0xaac14a37
                  li x26, 0xb
                  li x27, 0x80000000
                  li x28, 0xa
                  li x29, 0x0
                  li x31, 0x0
                  la x24, (128*1024)>>12 // start.S stack endpoint

main:             li           s9, 0x80000000 #start riscv_int_numeric_corner_stream_0
                  li           s8, 0x0
                  li           t6, 0x80000000
                  li           a1, 0x0
                  li           t4, 0xffffffff
                  li           s1, 0xffffffff
                  li           t0, 0xffffffff
                  li           s4, 0x80000000
                  li           t5, 0xd97adfa8
                  li           s6, 0x0
                  addi         t0, s8, 367
                  auipc        t6, 446333
                  add          t0, t0, s4
                  addi         s4, t5, 1239
                  lui          t6, 164974
                  nop
                  addi         s4, t0, -311
                  mul          s4, t4, s9
                  lui          s1, 238788
                  nop
                  divu         t4, t0, s9
                  divu         s4, s8, s9
                  div          t0, t0, t6
                  remu         t4, a1, s8
                  lui          s8, 241059
                  mulh         t6, t5, s8
                  mulhsu       s1, s8, s6
                  mulh         t6, s4, s1
                  nop
                  mul          s8, s6, s8
                  mul          s6, t5, s8 #end riscv_int_numeric_corner_stream_0
                  la x4, test
                  jalr x0, x4, 0
