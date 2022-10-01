# 0 "test.c"
# 1 "/root/my_os_labs/lab2/init//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "test.c"
# 1 "/root/my_os_labs/lab2/include/printk.h" 1
       

# 1 "/root/my_os_labs/lab2/include/stddef.h" 1
       

typedef long int ptrdiff_t;
typedef long unsigned int size_t;
typedef int wchar_t;




typedef __builtin_va_list va_list;
# 4 "/root/my_os_labs/lab2/include/printk.h" 2

int printk(const char *, ...);
# 2 "test.c" 2
# 1 "/root/my_os_labs/lab2/arch/riscv/include/defs.h" 1



# 1 "/root/my_os_labs/lab2/include/types.h" 1



typedef unsigned long long uint64;
# 5 "/root/my_os_labs/lab2/arch/riscv/include/defs.h" 2
# 3 "test.c" 2



void test() {
    while (1);
}
