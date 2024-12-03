#include <stdio.h>
#include <stdlib.h>

#include "totient.h"

int main(int argc, char *argv[]) {
    unsigned number;
    unsigned result;

    if (argc < 2) {
        printf("Error: Invalid input!\n");
        return 1;
    }

    for (int i = 1; i < argc; ++i) {
        number = atol(argv[i]);
        result = totient(number);
        printf("totient(%u) = %u\n", number, result);
    }

    printf("---------\n");

    for (int i = 1; i < argc; ++i) {
        number = atol(argv[i]);
        result = faster_totient(number);
        printf("faster_totient(%u) = %u\n", number, result);
    }

    return 0;
}
