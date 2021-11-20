#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Uses a local version of fprintf
# ------------------------------------------------------------------------------

make liboverride.so use_mymath
export LD_LIBRARY_PATH=.
export LD_PRELOAD=./liboverride.so

./use_mymath

unset LD_PRELOAD
