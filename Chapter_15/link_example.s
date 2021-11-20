.globl      main

.section    .data
output:
    .string "hello\n"

.section    .text

main:
    enter   $0, $0
    movq    stdout, %rdi
    movq    $output, %rsi
    call    fprintf
    
    movq    $0, %rax
    
    leave
    ret
