.PHONY : all
all : abscall absmain filewrite stdoutwrite exponentscanf

abscall: abscall.s
	as abscall.s -o abscall.o
	ld abscall.o -static -lc -o abscall

absmain: absmain.s
	gcc absmain.s -static -o absmain

filewrite: filewrite.s
	gcc filewrite.s -static -o filewrite

stdoutwrite: stdoutwrite.s
	gcc stdoutwrite.s -static -o stdoutwrite

exponentscanf: exponentscanf.s
	gcc exponentscanf.s ../Chapter_11/exponentfunc.s -static -o exponentscanf
