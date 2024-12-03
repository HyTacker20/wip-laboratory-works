#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "prime_functions.h"

int main(int argc, char *argv[]) {
    printf("%d\n", argc);
    printf("------------\n");
    for (int i = 0; i < argc; ++i) {
        printf("\n%d\n", i);
        printf("%s\n", argv[i]);
    }
    printf("------------\n");

    if (argc < 3 || !isdigit(*argv[2])) {
        printf("Error: Invalid input!\n");
        return 1;
    }

    unsigned number = atol(argv[2]);

    if (strcmp(argv[1], "pn") == 0) {
        printf("%u\n", prime_numbers(number));
    }
    else if (strcmp(argv[1], "ip") == 0) {
        printf("%d\n", is_prime(number));
    }
    else if (strcmp(argv[1], "pr") == 0) {
        printf("%d\n", prime(number));
    }
    else {
        printf("Error: Unknown command!\n", argv[1]);
    }

    return 0;
}
