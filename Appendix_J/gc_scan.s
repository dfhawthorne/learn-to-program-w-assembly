.globl      gc_scan
.type       gc_scan, @function

# Parameters - none
# Registers  - none
.section    .text
gc_scan:
    enter   $0, $0
    
    # Setup space for pointer list
    call    gc_scan_init
    # Unmask all objects
    call    gc_unmark_all
    # Get initial set of pointers from base objects
    # (stack, data)
    call    gc_scan_base_objects
    # Walk pointer list
    call    gc_walk_pointers
    # Give back space from pointer list
    call    gc_scan_cleanup
    leave
    ret
