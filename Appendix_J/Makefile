.PHONY: all
all: gc_test

gc_test: gc_allocate.s gc_defs.s gc_globals.s gc_init.s gc_is_valid_ptr.s gc_scan_base_objects.s gc_scan_cleanup.s gc_scan_init.s gc_scan.s gc_unmark_all.s gc_walk_pointers.s gc_test.c gc_scan_memory.s
	gcc -no-pie -fpie gc_*.s gc_test.c -o gc_test
