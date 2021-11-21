.equ        my_exception, 7     # Just picking a value at random
myfunc:
    enter   $0, $0
    
    push    $0                  # Needed to keep the stack aligned
    push    $myunc_exceptionhandler
    call    myfunc2
    
    # DoMoreStuff
    
myfunc_ContinueMyFunc:
    # Do more stuff here
    
    leave
    ret

myfunc_exceptionhandler:
    # HandleException - do any exception-handling code here
    
    # Go back to the code
    jmp     myfunc_ContinueMyFunc

myfunc2:
    enter   $0, $0
    
    pushq   $0                  # keep the stack aligned
    pushq   $myfunc_exceptionhandler
    
    call    myfunc3
    
    leave
    ret

myfunc2_exceptionhandler:
    # Nothing to do except go to the next handler
    leave                       # restore %rsp/%rbp
    addq    $8, %rsp            # Get rid of the return address
    jmp     *(%rsp)             # jump to exception handler

myfunc3:
    enter   $0, $0
    
    # Throw
    movq    $my_exception_code, %rax
                                # Store exception code
    leave                       # restore %rsp/%rbp
    addq    $8, %rsp            # Get rid of the return address
    jmp     *(%rsp)             # jump to exception handler

    # What would have happened if we didn't throw the exception
    leave
    ret
