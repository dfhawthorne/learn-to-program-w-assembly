.include    "gc_defs.s"
.globl      heap_start, head_end, stack_start, start_end
.globl      pointer_list_part, pointer_list_end, pointer_list_current

.type       heap_start, @object
.type       head_end, @object
.type       stack_start, @object
.type       start_end, @object
.type       pointer_list_part, @object
.type       pointer_list_end, @object
.type       pointer_list_current, @object

.section    .data
heap_start:
    .quad   0
heap_end:
    .quad   0
stack_start:
    .quad   0
start_end:
    .quad   0
    .equ    point_list_start, head_end  # These are the same
pointer_list_end:
    .quad   0
pointer_list_current:
    .quad   0
    
