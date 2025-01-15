#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

int solution_count = 0;

void print_solution(int *position, int n) {
    for (int i = 1; i <= n; ++i) {
        printf("%d ", position[i]);
    }
    printf("\n");
}

void ustaw(int i, int n, int *position, bool *bije_wiersz, bool *bije_przek1, bool *bije_przek2) {
    for (int j = 1; j <= n; ++j) {
        if (!(bije_wiersz[j] || bije_przek1[i + j] || bije_przek2[i - j + n])) {
            position[i] = j;
            bije_wiersz[j] = bije_przek1[i + j] = bije_przek2[i - j + n] = true;

            if (i < n) {
                ustaw(i + 1, n, position, bije_wiersz, bije_przek1, bije_przek2);
            } else {
                print_solution(position, n);
                ++solution_count;
            }

            position[i] = 0;
            bije_wiersz[j] = bije_przek1[i + j] = bije_przek2[i - j + n] = false;
        }
    }
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <number of queens>\n", argv[0]);
        return 1;
    }

    int n = atoi(argv[1]);

    int *position = (int *)calloc(n + 1, sizeof(int));
    bool *bije_wiersz = (bool *)calloc(n + 1, sizeof(bool));
    bool *bije_przek1 = (bool *)calloc(2 * n + 1, sizeof(bool));
    bool *bije_przek2 = (bool *)calloc(2 * n + 1, sizeof(bool));

    ustaw(1, n, position, bije_wiersz, bije_przek1, bije_przek2);

    printf("Number of solutions: %d\n", solution_count);

    free(position);
    free(bije_wiersz);
    free(bije_przek1);
    free(bije_przek2);

    return 0;
}
