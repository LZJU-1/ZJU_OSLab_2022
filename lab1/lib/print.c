#include "print.h"
#include "sbi.h"

void puts(char *s) {
    int i = 0;
    while(s[i]) {
        sbi_ecall(0x1, 0, s[i], 0, 0, 0, 0, 0);
        i++;
    }
    sbi_ecall(0x1, 0, 0x0D, 0, 0, 0, 0, 0);
    sbi_ecall(0x1, 0, 0x0A, 0, 0, 0, 0, 0);
}

void puti(int x) {
    int tmp = 1;
    while(tmp * 10 <= x) tmp *= 10;
    while(x) {
        int digit = x / tmp;
        sbi_ecall(0x1, 0, digit + '0', 0, 0, 0, 0, 0);
        x -= digit * tmp;
        tmp /= 10;
    }
    sbi_ecall(0x1, 0, 0x0D, 0, 0, 0, 0, 0);
    sbi_ecall(0x1, 0, 0x0A, 0, 0, 0, 0, 0);
}
