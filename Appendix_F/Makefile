.PHONY: all
all: fpdiv vectomultiply

fpdiv: fpdiv.s
	gcc -fpie -no-pie fpdiv.s -o fpdiv

vectomultiply: vectomultiply.s
	gcc -fpie -no-pie vectomultiply.s -o vectomultiply
