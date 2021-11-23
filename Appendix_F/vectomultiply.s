.globl      main
.type       main, @function

.section    .rodata
    .balign 16
starting_value:
    .single 2.1, 2.1, 2.1, 2.1
multiply_by:
    .single 5.0, 6.0, 7.0, 8.0
output:
    .string "Results: %f, %f, %f, %f\n"

.section    .text
main:
    enter       $0, $0
    
    # Leave the values a whole 128-bits at a time
    movaps      starting_value, %xmm4
    movaps      multiply_by, %xmm5
    
    # Multiply
    mulps       %xmm4, %xmm5
    
    # Extract into parameters for fprintf
    movss       %xmm5, %xmm0    # Extract the first value to %xmm0
    cvtss2sd    %xmm0, %xmm0    # Upgrade from a float to a double
    psrldq      $4, %xmm5       # Shift the next value into position
    movss       %xmm5, %xmm1    # Extract the next value to %xmm1
    cvtss2sd    %xmm1, %xmm1    # Upgrade from a float to a double
    psrldq      $4, %xmm5       # Shift the next value into position
    movss       %xmm5, %xmm2    # Extract the next value to %xmm2
    cvtss2sd    %xmm2, %xmm2    # Upgrade from a float to a double
    psrldq      $4, %xmm5       # Shift the next value into position
    movss       %xmm5, %xmm3    # Extract the next value to %xmm3
    cvtss2sd    %xmm3, %xmm3    # Upgrade from a float to a double

    movq        $4, %rax        # Protect 4 XMM registers
    
    # Invoke function
    movq        stdout, %rdi
    movq        $output, %rsi
    call        fprintf

    leave
    ret
