.PHONY: all
all: link_example libmymath.so run_squareme use_mymath link_example_pie manual_load

link_example: link_example.s
	gcc -rdynamic -no-pie -fno-pie link_example.s -o link_example
	ls -l link_example
	strip link_example
	ls -l link_example
	ldd link_example

libmymath.so: squareme.s printstuff.s multbyten.s
	gcc -shared printstuff.s multbyten.s squareme.s -o libmymath.so

run_squareme: libmymath.so run_squareme.s
	gcc run_squareme.s -lmymath -no-pie -fno-pie -L . -o run_squareme

use_mymath: libmymath.so use_mymath.c
	gcc use_mymath.c -lmymath -no-pie -fno-pie -L . -o use_mymath

link_example_pie: link_example_pie.s
	gcc -pie link_example_pie.s -o link_example_pie

liboverride.so: fprintf_override.s
	gcc -shared fprintf_override.s -o liboverride.so

manual_load: manual_load.s
	gcc -rdynamic manual_load.s -no-pie -fno-pie -ldl -o manual_load

