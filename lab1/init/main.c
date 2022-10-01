#include "print.h"
#include "sbi.h"
#include "defs.h"

extern void test();

int start_kernel() {
    sbi_ecall(0x1, 0x0, 0x30, 0, 0, 0, 0, 0);
    puti(2022);
    puts("Hello RISC-V\n");

    uint64 t = csr_read(sstatus);
    puti(t);

    csr_write(sscratch, 0x233333);

    test(); // DO NOT DELETE !!!

	return 0;
}
