.globl      printstuff

.section    .rodata
mytext:
    .string "hello there"

.section    .text
printstuff:
    enter   $0, $0
    
    movq    stdout@GOTPCREL(%rip), %rdi
    movq    (%rdi), %rdi
    leaq    mytext(%rip), %rsi
    call    fprintf@plt
    
    leave
    ret
    
