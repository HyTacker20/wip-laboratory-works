#include <math.h>
#include <stdio.h>
#include <stdbool.h>


void fill_sieve(bool sieve[], unsigned n) {
    sieve[0] = false;
    sieve[1] = false;

    for (unsigned i = 2; i <= n; ++i) {
        sieve[i] = true;
    }
}


void calculate_sieve(bool sieve[], unsigned n) {
    unsigned sqrt_value = (unsigned) sqrt(n);

    for (unsigned i = 2; i <= sqrt_value; ++i) {
        if (sieve[i]) {
            for (unsigned j = i * i; j <= n; j += i) {
                sieve[j] = false;
            }
        }
    }
}



int main() {
    unsigned n;

    printf("Podaj N: \n");
    scanf("%u", &n);

    int upper_limit;

    if (n < 5) {
        upper_limit = (n * 2) + 1;
    }
    else {
        upper_limit = n + (n * (int)(log(n) + log(log(n))));
    }

    bool sieve[upper_limit];

    fill_sieve(sieve, upper_limit);
    calculate_sieve(sieve, upper_limit);

    unsigned i = 0, count = 0;
    while (count < n) {
        if (sieve[i]) {
            count++;
        }
        i++;
    }

    printf("The %u-th prime number is: %u\n", n, i-1);


    return 0;
}
