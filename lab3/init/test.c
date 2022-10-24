#include "printk.h"
#include "defs.h"

// Please do not modify

void test() {
    size_t print_loop = 0;
    while (1) {
        if (print_loop == 200000000) {
            printk("kernel is running!\n");
            print_loop = 0;
        } else print_loop++;
    }
}
