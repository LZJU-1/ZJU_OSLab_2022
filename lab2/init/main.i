# 0 "main.c"
# 1 "/root/my_os_labs/lab2/init//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "main.c"
# 1 "/root/my_os_labs/lab2/include/printk.h" 1
       

# 1 "/root/my_os_labs/lab2/include/stddef.h" 1
       

typedef long int ptrdiff_t;
typedef long unsigned int size_t;
typedef int wchar_t;




typedef __builtin_va_list va_list;
# 4 "/root/my_os_labs/lab2/include/printk.h" 2

int printk(const char *, ...);
# 2 "main.c" 2
# 1 "/root/my_os_labs/lab2/arch/riscv/include/sbi.h" 1





# 1 "/root/my_os_labs/lab2/include/types.h" 1



typedef unsigned long long uint64;
# 7 "/root/my_os_labs/lab2/arch/riscv/include/sbi.h" 2

struct sbiret {
 long error;
 long value;
};

struct sbiret sbi_ecall(int ext, int fid, uint64 arg0,
               uint64 arg1, uint64 arg2,
               uint64 arg3, uint64 arg4,
               uint64 arg5);
# 3 "main.c" 2
# 1 "/root/my_os_labs/lab2/arch/riscv/include/defs.h" 1
# 4 "main.c" 2

extern void test();

int start_kernel() {
    sbi_ecall(0x1, 0x0, 0x30, 0, 0, 0, 0, 0);
    printk("Hello RISC-V\n");


    uint64 t = ({ register uint64 __v; asm volatile ("csrr %[v], " "sstatus" : [v] "=r" (__v)::); __v; });


    ({ uint64 __v = (uint64)(0x233333); asm volatile ("csrw " "sscratch" ", %0" : : "r" (__v) : "memory"); });

    test();

 return 0;
}
