#include <stdio.h>

long squareme(long x) {
    return x * x;
}

long myval;
int main() {
    fprintf(stdout, "Enter a number: \n");
    fscanf(stdin, "%ld", &myval);
    fprintf(stdout, "The square of %ld is %ld", myval, squareme(myval));
}    
