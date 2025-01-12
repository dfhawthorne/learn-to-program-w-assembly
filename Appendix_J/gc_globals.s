.include    "gc_defs.s"
.globl      heap_start, heap_end, stack_start, stack_end
.globl      pointer_list_start, pointer_list_end, pointer_list_current

.type       heap_start, @object
.type       heap_end, @object
.type       stack_start, @object
.type       stack_end, @object
.type       pointer_list_start, @object
.type       pointer_list_end, @object
.type       pointer_list_current, @object

.section    .data
heap_start:
    .quad   0
heap_end:
    .quad   0
stack_start:
    .quad   0
stack_end:
    .quad   0
    .equ    pointer_list_start, heap_end  # These are the same
pointer_list_end:
    .quad   0
pointer_list_current:
    .quad   0
    
