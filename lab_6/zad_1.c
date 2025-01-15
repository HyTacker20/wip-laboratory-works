#include <stdio.h>
#include <math.h>
#include <stdbool.h>
#include <stdlib.h>

int solution_count = 0;

void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

bool check(int a, int index_a, int b, int index_b) {
    if (a - index_a == b - index_b || a + index_a == b + index_b) {
        return true;
    }
    return false;
}

int generate_permutation(int array[], int start, int n) {
    bool result = false;
    if (start == n) {
        for (int i = 0; i < n; ++i) {
            for (int j = i + 1; j < n; ++j) {
                bool is_beaten = check(array[i], i, array[j], j);
                if (is_beaten) result = true;
            }
        }
        if (!result) {
            solution_count += 1;
            for (int i = 0; i < n; ++i) {
                printf("%d ", array[i]);
            }
            printf("\n");
        }
    }
    for (int i = start; i < n; ++i) {
        swap(&array[start], &array[i]);
        generate_permutation(array, start+1, n);
        swap(&array[start], &array[i]);
    }

    return solution_count;
}

int main() {
    int n;
    printf("Input number of queens: ");
    scanf("%d", &n);
    int array[n];
    for (int i = 0; i < n; ++i) {
        array[i] = i+1;
    }

    int result = generate_permutation(array, 0, n);
    printf("Number of solutions: %d\n", result);
    return 0;
}