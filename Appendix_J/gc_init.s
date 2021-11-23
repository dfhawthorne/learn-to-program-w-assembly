.globl      gc_init
.type       gc_init, @function

.section    .text
gc_init:
    # Assume %rbp has the previous stack frame,
    # and is properly aligned
    movq    %rbp, stack_start
    
    # Save the location of the heap
    movq    $BRK_SYSCALL, %rax
    movq    $0, %rdi
    syscall
    
    movq    %rax, heap_start
    movq    %rax, head_end
    
    ret
