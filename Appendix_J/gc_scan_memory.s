.include    "gc_defs.s"
.globl      gc_scan_memory
.type       gc_scan_memory, @function

.section    .text
gc_scan_memory:
    # This takes a location in memory and the size of that memory and scans
    # it for potential pointers to the heap.
    # %rdi points to memory segment
    # %rsi is the size
    enter   $32, $0
    pushq   $0
    movq    %rcx, -8(%rbp)
    movq    %rax, -16(%rbp)
    movq    %rsi, -24(%rbp)
    # Scan through body of segment looking for possible pointers.
    movq    $0, %rcx                    # Initialise index
    shrq    $3, %rsi                    # Divide by 8 to get # quad words
loop:
    leaq    HEADER_SIZE(%rdi), %rax
    movq    0(%rax, %rcx, 8), %rax

    # If a pointer is found, check that it points into the heap.
    cmpq    $0, %rax
    je      next
    cmpq    %rax, heap_start
    ja      next
    cmpq    %rax, heap_end
    jb      next
    
    # Mark the referenced segment as in use
    subq    $HEADER_SIZE, %rax
    movq    $1, HDR_IN_USE_OFFSET(%rax)
    
    # Look at next slot
next:
    incq    %rcx
    cmpq    %rsi, %rcx
    jb      loop

    # Return to caller after restoring registers
goback:
    movq    -24(%rbp), %rsi
    movq    -16(%rbp), %rax
    movq    -8(%rbp), %rcx
    leave
    ret
