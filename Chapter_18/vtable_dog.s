## Dog class
.globl      dog_new, dog_eat, dog_speak, dog_destroy
.type       dog_new, @function
.type       dog_eat, @function
.type       dog_speak, @function
.type       dog_destroy, @function

.section    .data
speak_text:
    .string "Ruff, ruff\n"
eat_text:
    .string "I love dog biscuits\n"

.section    .text

.equ        DOG_SIZE, 32

dog_new:
    enter   $0, $0
    movq    $DOG_SIZE, %rdi
    call    malloc
    leave
    ret

dog_speak:
    enter   $0, $0
    movq    stdout, %rdi
    movq    $speak_text, %rsi
    call    fprintf
    leave
    ret

dog_eat:
    enter   $0, $0
    movq    stdout, %rdi
    movq    $eat_text, %rsi
    call    fprintf
    leave
    ret

dog_destroy:
    enter   $0, $0
    # %rdi already has the address
    call    free
    leave
    ret
