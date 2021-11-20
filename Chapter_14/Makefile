.PHONY : all
all : mallocdemo usealloc

mallocdemo: mallocdemo.s
	gcc -static mallocdemo.s -o mallocdemo

usealloc: usealloc.c allocate.s
	gcc -static allocate.s usealloc.c -o usealloc
