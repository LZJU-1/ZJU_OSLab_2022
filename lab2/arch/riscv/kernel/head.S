.extern start_kernel

    .section .text.init
    .globl _start
_start:
    la sp, boot_stack_top
    jal x0, start_kernel

    .section .bss.stack
    .globl boot_stack
boot_stack:
    .space 4096 * 4

    .globl boot_stack_top
boot_stack_top:
