.globl      main

.section    .data

formatstring1:
    .ascii  "The age of %s is %d.\n\0"
sallyname:
    .ascii  "Sally\0"
sallyage:
    .quad   53

formatstring2:
    .ascii  "%d and %d are %s's favourite numbers.\n\0"
joshname:
    .ascii  "Josh\0"
joshfavouritefirst:
    .quad   7
joshfavouritesecond:
    .quad   13

.section    .text
main:
    # No local variables - no stack frame needed
    
    # Write the first string
    movq    stdout, %rdi
    movq    $formatstring1, %rsi
    movq    $sallyname, %rdx
    movq    sallyage, %rcx
    movq    $0, %rax
    call    fprintf
    
    # Write the second string
    movq    stdout, %rdi
    movq    $formatstring2, %rsi
    movq    joshfavouritefirst, %rdx
    movq    joshfavouritesecond, %rcx
    movq    $joshname, %r8
    movq    $0, %rax
    call    fprintf
    
    # Return
    movq    $0, %rax
    ret
    
