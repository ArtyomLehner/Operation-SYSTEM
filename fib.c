#include "fib.h"

unsigned long long fib(int n) {
    if (n < 0) return 0;
    unsigned long long a = 0, b = 1, c;
    if (n == 0) return a;
    for (int i = 2; i <= n; ++i) {
        c = a + b;
        a = b;
        b = c;
    }
    return b;
}