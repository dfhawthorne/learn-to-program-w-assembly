.include    "gc_defs.s"
.globl      gc_scan_cleanup
.type       gc_scan_cleanup, @function

gc_scan_cleanup:
    # Done with the pointer list - move break back to where it was
    movq    $BRK_SYSCALL, %rax
    movq    heap_end, %rdi
    syscall
    
