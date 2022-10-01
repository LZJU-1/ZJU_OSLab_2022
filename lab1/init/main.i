# 0 "main.c"
# 1 "/root/os22fall-stu/src/lab1/init//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "main.c"
# 1 "/root/os22fall-stu/src/lab1/include/print.h" 1



void puts(char *s);
void puti(int x);
# 2 "main.c" 2
# 1 "/root/os22fall-stu/src/lab1/arch/riscv/include/sbi.h" 1





# 1 "/root/os22fall-stu/src/lab1/include/types.h" 1



typedef unsigned long long uint64;
# 7 "/root/os22fall-stu/src/lab1/arch/riscv/include/sbi.h" 2

struct sbiret {
 long error;
 long value;
};

struct sbiret sbi_ecall(int ext, int fid, uint64 arg0,
               uint64 arg1, uint64 arg2,
               uint64 arg3, uint64 arg4,
               uint64 arg5);
# 3 "main.c" 2
# 1 "/root/os22fall-stu/src/lab1/arch/riscv/include/defs.h" 1
# 4 "main.c" 2

extern void test();

int start_kernel() {
    sbi_ecall(0x1, 0x0, 0x30, 0, 0, 0, 0, 0);
    puti(2022);
    puts("Hello RISC-V\n");

    uint64 t = ({ register uint64 __v; asm volatile ("csrr %[v], " "sstatus" : [v] "=r" (__v)::); __v; });
    puti(t);

    ({ uint64 __v = (uint64)(0x233333); asm volatile ("csrw " "sscratch" ", %0" : : "r" (__v) : "memory"); });

    test();

 return 0;
}
