.globl      main
.type       main, @function
.section    .text

main:
    .equ    LCL_CAT, -8
    .equ    LCL_DOG, -16
    
    enter   $16, $0
    
    # Construct a cat
    call    cat_new
    movq    %rax, LCL_CAT(%rbp)
    
    # Construct a dog
    call    dog_new
    movq    %rax, LCL_DOG(%rbp)
    
    movq    LCL_CAT(%rbp), %rdi         # Object
    movq    $cat_vtable_animal, %rsi    # VTable
    call    doThings

    movq    LCL_DOG(%rbp), %rdi         # Object
    movq    $dog_vtable_animal, %rsi    # VTable
    call    doThings

    # Destructors
    movq    LCL_CAT(%rbp), %rdi
    call    cat_destroy
    
    movq    LCL_DOG(%rbp), %rdi
    call    dog_destroy

    leave
    ret
