#!/usr/bin/env bash
# -------------------------------------------------------------------
# Creates the abscall
# -------------------------------------------------------------------

as abscall.s -o abscall.o
ld abscall.o -static -lc -o abscall
./abscall
echo $?
