#include <stdio.h>


unsigned long long dwumian_newtona(int n, int k) {
    unsigned long long tablica[n + 1][k + 1];

    // C(n,k)=C(n−1,k−1)+C(n−1,k)
    // C(n,0)=1
    // 1C(n,n)=1


    for (int i = 0; i <= n; ++i) {
        for (int j = 0; j <= k; ++j) {
            if (j == 0 || j == i) {
                tablica[i][j] = 1;

            } else if (j < i) {
                tablica[i][j] = tablica[i - 1][j - 1] + tablica[i - 1][j];

            } else {
                tablica[i][j] = 0;
            }
        }
    }

    return tablica[n][k];
}


int main() {
    int n, k;

    printf("Podaj N: ");
    scanf("%d", &n);
    printf("Podaj K: ");
    scanf("%d", &k);


    if (n < 0 || k < 0 || k > n) {
        printf("Error: niepoprawne dane - 0 <= k <= n.\n");
        return 1;
    }

    unsigned long long result = dwumian_newtona(n, k);
    printf("Dwumian Newtona dla n=%d i k=%d: %llu\n", n, k, result);

    return 0;

}
