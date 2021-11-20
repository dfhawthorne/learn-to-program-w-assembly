#!/usr/bin/env bash
gcc absmain.s -static -o absmain
./absmain
echo $?
