	.file	"main.c"
	.option pic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/root/os22fall-stu/src/lab1/init" "main.c"
	.section	.rodata
	.align	3
.LC0:
	.string	"Hello RISC-V\n"
	.section	.text.start_kernel,"ax",@progbits
	.align	2
	.globl	start_kernel
	.type	start_kernel, @function
start_kernel:
.LFB0:
	.file 1 "main.c"
	.loc 1 7 20
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 8 5
	li	a7,0
	li	a6,0
	li	a5,0
	li	a4,0
	li	a3,0
	li	a2,48
	li	a1,0
	li	a0,1
	call	sbi_ecall@plt
	.loc 1 9 5
	li	a0,2022
	call	puti@plt
	.loc 1 10 5
	lla	a0,.LC0
	call	puts@plt
.LBB2:
	.loc 1 12 40
#APP
# 12 "main.c" 1
	csrr a5, sstatus
# 0 "" 2
#NO_APP
	mv	ra,a5
	.loc 1 12 99
	mv	a5,ra
.LBE2:
	.loc 1 12 12
	sd	a5,-24(s0)
	.loc 1 13 5
	ld	a5,-24(s0)
	sext.w	a5,a5
	mv	a0,a5
	call	puti@plt
.LBB3:
	.loc 1 15 15
	li	a5,2306048
	addi	a5,a5,819
	sd	a5,-32(s0)
	.loc 1 15 41
	ld	a5,-32(s0)
#APP
# 15 "main.c" 1
	csrw sscratch, a5
# 0 "" 2
#NO_APP
.LBE3:
	.loc 1 17 5
	call	test@plt
	.loc 1 19 9
	li	a5,0
	.loc 1 20 1
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	start_kernel, .-start_kernel
	.text
.Letext0:
	.file 2 "/root/os22fall-stu/src/lab1/arch/riscv/include/sbi.h"
	.file 3 "/root/os22fall-stu/src/lab1/include/print.h"
	.file 4 "/root/os22fall-stu/src/lab1/include/types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x14e
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x6
	.4byte	.LASF9
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL0
	.8byte	0
	.4byte	.Ldebug_line0
	.byte	0x7
	.4byte	.LASF10
	.byte	0x4
	.byte	0x4
	.byte	0x1c
	.4byte	0x36
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF4
	.byte	0x8
	.4byte	.LASF11
	.byte	0x10
	.byte	0x2
	.byte	0x8
	.byte	0x8
	.4byte	0x61
	.byte	0x4
	.4byte	.LASF2
	.byte	0x9
	.4byte	0x61
	.byte	0
	.byte	0x4
	.4byte	.LASF3
	.byte	0xa
	.4byte	0x61
	.byte	0x8
	.byte	0
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x9
	.4byte	.LASF12
	.byte	0x1
	.byte	0x5
	.byte	0xd
	.4byte	0x76
	.byte	0xa
	.byte	0
	.byte	0x5
	.4byte	.LASF7
	.byte	0x4
	.4byte	0x86
	.byte	0x1
	.4byte	0x86
	.byte	0
	.byte	0xb
	.byte	0x8
	.4byte	0x8c
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x5
	.4byte	.LASF8
	.byte	0x5
	.4byte	0xa3
	.byte	0x1
	.4byte	0xa3
	.byte	0
	.byte	0xc
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xd
	.4byte	.LASF13
	.byte	0x2
	.byte	0xd
	.byte	0xf
	.4byte	0x3d
	.4byte	0xe3
	.byte	0x1
	.4byte	0xa3
	.byte	0x1
	.4byte	0xa3
	.byte	0x1
	.4byte	0x2a
	.byte	0x1
	.4byte	0x2a
	.byte	0x1
	.4byte	0x2a
	.byte	0x1
	.4byte	0x2a
	.byte	0x1
	.4byte	0x2a
	.byte	0x1
	.4byte	0x2a
	.byte	0
	.byte	0xe
	.4byte	.LASF14
	.byte	0x1
	.byte	0x7
	.byte	0x5
	.4byte	0xa3
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x3
	.string	"t"
	.byte	0xc
	.byte	0xc
	.4byte	0x2a
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xf
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x130
	.byte	0x3
	.string	"__v"
	.byte	0xc
	.byte	0x23
	.4byte	0x2a
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0x10
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x3
	.string	"__v"
	.byte	0xf
	.byte	0xf
	.4byte	0x2a
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x7
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x6
	.byte	0x27
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.8byte	0
	.8byte	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x8
	.byte	0
	.4byte	0
.LLRL0:
	.byte	0x6
	.8byte	.LFB0
	.8byte	.LFE0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF14:
	.string	"start_kernel"
.LASF9:
	.string	"GNU C17 11.2.0 -mabi=lp64 -mcmodel=medany -march=rv64imafd -g -fno-builtin -ffunction-sections -fdata-sections"
.LASF5:
	.string	"long int"
.LASF13:
	.string	"sbi_ecall"
.LASF6:
	.string	"char"
.LASF4:
	.string	"long long unsigned int"
.LASF3:
	.string	"value"
.LASF8:
	.string	"puti"
.LASF10:
	.string	"uint64"
.LASF2:
	.string	"error"
.LASF12:
	.string	"test"
.LASF7:
	.string	"puts"
.LASF11:
	.string	"sbiret"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/root/os22fall-stu/src/lab1/init"
.LASF0:
	.string	"main.c"
	.ident	"GCC: (Ubuntu 11.2.0-16ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
