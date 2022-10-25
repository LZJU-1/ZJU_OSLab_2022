    .extern start_kernel
    .section .text.init
    .globl _start
_start:
    la sp, boot_stack_top # set the stack pointer
    
    jal ra, mm_init # initialize physical memory
    
    jal ra, task_init # initialize task threads

    # set stvec
    la t0, _traps
    csrw stvec, t0

    # set on STIE bit of sie
    csrr t0, sie
    ori t0, t0, 0x20
    csrw sie, t0

    # set on SIE bit and SPIE of sstatus
    csrr t0, sstatus
    ori t0, t0, 0x22
    csrw sstatus, t0

    # set first time interrupt
    jal ra, clock_set_next_event

    jal x0, start_kernel  # jump to start_kernel

    .section .bss.stack
    .globl boot_stack
boot_stack:
    .space 4096 * 4

    .globl boot_stack_top
boot_stack_top:
