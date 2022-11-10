// arch/riscv/kernel/vm.c
#include "defs.h"
#include "types.h"
#include "vm.h"
#include "mm.h"
#include "string.h"
#include "printk.h"

/* early_pgtbl: 用于 setup_vm 进行 1GB 的 映射。 */
unsigned long early_pgtbl[512] __attribute__((__aligned__(0x1000)));

void setup_vm(void) {
    /* 
    1. 由于是进行 1GB 的映射 这里不需要使用多级页表 
    2. 将 va 的 64bit 作为如下划分： | high bit | 9 bit | 30 bit |
        high bit 可以忽略
        中间9 bit 作为 early_pgtbl 的 index
        低 30 bit 作为 页内偏移 这里注意到 30 = 9 + 9 + 12， 即我们只使用根页表， 根页表的每个 entry 都对应 1GB 的区域。 
    3. Page Table Entry 的权限 V | R | W | X 位设置为 1
    */
    // virtual address = 0x80000000 => VPN[2] = 2
    early_pgtbl[2] = (uint64)(0 | 0x20000000U | 15U);
    // virtual address = 0xffffffe000000000 => VPN[2] = 384
    early_pgtbl[384] = (uint64)(0 | 0x20000000U | 15U);
}

/* swapper_pg_dir: kernel pagetable 根目录， 在 setup_vm_final 进行映射。 */
unsigned long  swapper_pg_dir[512] __attribute__((__aligned__(0x1000)));

extern uint64 _stext;
extern uint64 _srodata;
extern uint64 _sdata;

void setup_vm_final(void) {
    memset(swapper_pg_dir, 0x0, PGSIZE);

    // No OpenSBI mapping required
    // mapping kernel text X|-|R|V
    create_mapping(swapper_pg_dir, &_stext, (uint64)(&_stext) - PA2VA_OFFSET, 1U, 5);

    // mapping kernel rodata -|-|R|V
    create_mapping(swapper_pg_dir, &_srodata, (uint64)(&_srodata) - PA2VA_OFFSET, 1U, 1);

    // mapping other memory -|W|R|V
    create_mapping(swapper_pg_dir, &_sdata, (uint64)(&_sdata) - PA2VA_OFFSET, 32766U, 3);

    // set satp with swapper_pg_dir
    __asm__ volatile("csrw satp, %[base]":: [base] "r" ((uint64)swapper_pg_dir):);

    // flush TLB
    asm volatile("sfence.vma zero, zero");
    return;
}

/* 创建多级页表映射关系 */
/*
    pgtbl 为根页表的基地址
    va, pa 为需要映射的虚拟地址、物理地址
    sz 为映射的大小 (单位为4KB)
    perm 为映射的读写权限
*/
void create_mapping(uint64 *pgtbl, uint64 va, uint64 pa, uint64 sz, int perm) {
    /*
    创建多级页表的时候可以使用 kalloc() 来获取一页作为页表目录
    可以使用 V bit 来判断页表项是否存在
    */
    while (sz--) {
        uint64 vpn2 = ((va & 0x7fc0000000) >> 30);
        uint64 vpn1 = ((va & 0x3fe00000) >> 21);
        uint64 vpn0 = ((va & 0x1ff000) >> 12);

        // the second level page (next to root)
        uint64 *pgtbl1;
        if (!(pgtbl[vpn2] & 1)) {
            pgtbl1 = (uint64*)kalloc();
            pgtbl[vpn2] |= (1 | ((uint64)pgtbl1 >> 2));
        }
        else pgtbl1 = (uint64*)((pgtbl[vpn2] & 0x3ffffffffffffc00) << 2);

        // the third level page
        uint64 *pgtbl0;
        if (!(pgtbl1[vpn1] & 1)) {
            pgtbl0 = (uint64*)kalloc();
            pgtbl1[vpn1] |= (1 | ((uint64)pgtbl0 >> 2));
        }
        else pgtbl0 = (uint64*)((pgtbl1[vpn1] & 0x3ffffffffffffc00) << 2);

        // the physical page
        if (!(pgtbl0[vpn0] & 1)) {
            // note the perm only contains infomation about XWR (no V)
            pgtbl0[vpn0] |= (1 | (perm << 1) | (pa >> 2));
        }

        va += 0x1000, pa += 0x1000;
    }
}
