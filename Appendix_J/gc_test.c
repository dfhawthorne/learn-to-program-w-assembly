#include <stdio.h>

void *gc_allocate(int);
void gc_scan();
void gc_init();

volatile void **foo;
volatile void **goo;

int main() {
    gc_init();
    
    foo = gc_allocate(500);
    fprintf(stdout, "Allocation 1: %lx\n", (unsigned long)foo);
    goo = gc_allocate(200);
    foo[0] = goo;                       // Hold reference to goo so it
                                        // won't go away
    fprintf(stdout, "Allocation 2: %lx\n", (unsigned long)goo);
    gc_scan();
    goo = gc_allocate(300);
    fprintf(stdout, "Allocation 3: %lx\n", (unsigned long)goo);
    gc_scan();
    
    goo = gc_allocate(200);
    fprintf(stdout, "Allocation 4: %lx\n", (unsigned long)goo);
    gc_scan();

    // This will be put in the same spot as allocation 3
    goo = gc_allocate(200);
    fprintf(stdout, "Allocation 5: %lx\n", (unsigned long)goo);
    gc_scan();

    foo = gc_allocate(500);             // No longer holding reference
                                        // to allocations 1 & 2
    fprintf(stdout, "Allocation 6: %lx\n", (unsigned long)foo);
    gc_scan();

    // This will be put in the same spot as allocation 1
    goo = gc_allocate(10);
    fprintf(stdout, "Allocation 7: %lx\n", (unsigned long)goo);
    gc_scan();
    // This will be put in the same spot as allocation 2
    foo = gc_allocate(10);
    fprintf(stdout, "Allocation 8: %lx\n", (unsigned long)foo);

}   
