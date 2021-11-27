.include    "gc_defs.s"
.globl      gc_scan_memory
.type       gc_scan_memory, @function

.section    .text
gc_scan_memory:
    # This takes a location in memory and the size of that memory and scans
    # it for potential pointers to the heap.
    # %rdi points to memory segment
    # %rsi is the size
    enter   $0, $0
    leave
    ret
