.PHONY: all

all: vtable

vtable: vtable_main.s vtable_dothings.s vtable_animal.s vtable_dog.s vtable_cat.s
	gcc -static -o vtable vtable_main.s vtable_dothings.s vtable_animal.s vtable_dog.s vtable_cat.s
