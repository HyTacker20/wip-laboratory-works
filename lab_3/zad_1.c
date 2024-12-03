#include <math.h>
#include <stdio.h>
#include <stdbool.h>



int input_data(unsigned *n) {
    printf("Podaj liczbe N (N > 2): \n");

    if (scanf("%u", n) != 1) {
        printf("Error: Nieprawidlowy format wejsciowy.\n");
        return 1;
    }

    if (*n <= 2) {
        printf("Error: N musi byc wieksze od 2.\n");
        return 1;
    }

    return 0;

}


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


void print_result(bool sieve[], unsigned n, unsigned count) {
    printf("Proste liczby (ilosc - %u):\n", count);

    for (unsigned i = 0; i < n; ++i) {
        if (sieve[i]) {printf("%u ", i);}
    }

    printf("\n");
}


int main() {
    unsigned n;

    if (input_data(&n)) {return 1;};

    bool sieve[n + 1];

    fill_sieve(sieve, n);
    calculate_sieve(sieve, n);
    unsigned count = count_primes(sieve, n);
    print_result(sieve, n, count);

    return 0;
}
