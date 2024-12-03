#include <math.h>

#include "totient.h"

unsigned gcd(unsigned a, unsigned b) {
    unsigned c;

     while (b != 0) {
        c = a % b;
        a = b;
        b = c;
    }

    return a;
}

unsigned totient(unsigned n) {
    unsigned count = 0;

    for (int i = 0; i < n; ++i) {
        if (gcd(i, n) == 1) {
            count++;
        }
    }

    return count;
}

unsigned faster_totient (unsigned n) {
     unsigned count = n;
    unsigned i = 2;
    unsigned sqrt_n = (unsigned) sqrt(n);

    while (i <= sqrt_n) {
        if (n % i == 0) {
            while (n % i == 0) {
                n /= i;
            }
            count -= (count / i);
        }
        i++;
    }

    if (n > 1) {
        count -= (count / n);
    }

    return count;
}
