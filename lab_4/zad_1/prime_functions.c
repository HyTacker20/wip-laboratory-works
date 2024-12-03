#include "prime_functions.h"

#include <math.h>
#include <stdio.h>
#include <stdbool.h>


void fill_sieve(bool sieve[], unsigned n) {
    sieve[0] = false;
    sieve[1] = false;
    for (int i = 2; i <= n; ++i) { sieve[i] = true; }
}


void calculate_sieve(bool sieve[], unsigned n) {
    unsigned sqrt_value = (unsigned) sqrt(n);

    for (unsigned i = 2; i <= sqrt_value; ++i) {
        if (sieve[i]) {
            for (unsigned j = i * i; j < n; j += i) {
                sieve[j] = false;
            }
        }
    }
}


unsigned count_primes(bool sieve[], unsigned n) {
    int count = 0;

    for (int i = 0; i < n; ++i) {
        if (sieve[i]) {count++;}
    }

    return count;
}

unsigned prime_numbers(unsigned n) {
    bool sieve[n + 1];

    fill_sieve(sieve, n);
    calculate_sieve(sieve, n);
    unsigned count = count_primes(sieve, n);

    return count;
}

bool is_prime(unsigned n) {
    // used from zad_2 z lab_2
    if (n <= 1) return false;
    if (n == 2) return true;
    if (n % 2 == 0) return false;

    float sqrt_n = sqrt(n);
    for (int i = 3; i < sqrt_n; i += 2) {
        if (n % i == 0) {
            return false;
        }
    }
    return true;
}

unsigned prime(unsigned n) {
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
    unsigned result = i-1;

    return result;
}
