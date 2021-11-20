.globl      main

.section    .data
filename:
    .string "libmymath.so"

functionname:
    .string "printstuff"

.section    .text
main:
    enter   $0, $0
    
    movq    $filename, %rdi
    movq    $1, %rsi        # the flag for lazy-loading
    call    dlopen
    
    movq    %rax, %rdi
    movq    $functionname, %rsi
    call    dlsym
    
    call    *%rax
    
    leave
    ret    
