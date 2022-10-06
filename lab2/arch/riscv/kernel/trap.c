#include "clock.h"
#include "printk.h"

void trap_handler(unsigned long scause, unsigned long sepc) {
    unsigned long interrupt_sig = 0x8000000000000000;
    if (scause & interrupt_sig){ // it's interrupt
        scause = scause - interrupt_sig;
        unsigned long timer_int = 0x5;
        if (!(scause ^ timer_int)){ // it's Supervisor timer interrupt
            printk("[S] Supervisor Mode Timer Interrupt\n");
            clock_set_next_event();
        }
    }
}
