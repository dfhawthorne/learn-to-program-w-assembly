## ScreechyCat Class
.globl      screechy_cat_new, screechy_cat_speak, screechy_cat_destroy
.type       screechy_cat_new, @function
.type       screechy_cat_speak, @function
.type       screechy_cat_destroy, @function

.section    .rodata
speak_text:
    .string "Screech!\n"

.section    .text
    .equ    SCREECHY_CAT_SIZE, 128

screechy_cat_new:
    enter   $0, $0
    movq    $SCREECHY_CAT_SIZE, %rdi
    call    malloc
    leave
    ret
    
screechy_cat_speak:
    enter   $0, $0
    movq    stdout, %rdi
    movq    $speak_text, %rsi
    call    fprintf
    leave
    ret
    
screechy_cat_destroy:
    enter   $0, $0
    call    free
    leave
    ret
    
