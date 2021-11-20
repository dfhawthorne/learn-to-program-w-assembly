.globl      main

.section    .rodata
output:
    .string "hello\n"

.section    .text
main:
    enter   $0, $0
    
    movq    stdout@GOTPCREL(%rip), %rdi
    movq    (%rdi), %rdi
    leaq    output(%rip), %rsi
    call    fprintf
    
    movq    $0, %rax
    
    leave
    ret
    
