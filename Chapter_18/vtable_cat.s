## Cat class
.globl      cat_new, cat_eat, cat_speak, cat_destroy
.type       cat_new, @function
.type       cat_eat, @function
.type       cat_speak, @function
.type       cat_destroy, @function

.section    .data
speak_text:
    .string "Meow\n"
eat_text:
    .string "Yum, yum fish\n"
play_text:
    .string "Ball of string, Yay!\n"

.section    .text

.equ        CAT_SIZE, 64

cat_new:
    enter   $0, $0
    movq    $CAT_SIZE, %rdi
    call    malloc
    leave
    ret

cat_speak:
    enter   $0, $0
    movq    stdout, %rdi
    movq    $speak_text, %rsi
    call    fprintf
    leave
    ret

cat_eat:
    enter   $0, $0
    movq    stdout, %rdi
    movq    $eat_text, %rsi
    call    fprintf
    leave
    ret

cat_destroy:
    enter   $0, $0
    # %rdi already has the address
    call    free
    leave
    ret
