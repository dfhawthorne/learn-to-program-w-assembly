.PHONY: all
all: link_example libmymath.so run_squareme

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
