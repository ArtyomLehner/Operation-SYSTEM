#include <stdio.h>
#include <stdlib.h>
#include "fib.h"

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <n>\n", argv[0]);
        return 1;
    }
    int n = atoi(argv[1]);
    printf("fib(%d) = %llu\n", n, fib(n));
    return 0;
}