#include <stdio.h>


int main() {
    int n, p;

    printf("Podaj liczbę n: ");
    scanf("%d", &n);
    printf("Podaj podstawę p: ");
    scanf("%d", &p);
    
    int reversed = 0;
    int original = n;
    int remainder;

    while (n > 0) {
        remainder = n % p;
        reversed = reversed * p + remainder;
        n = n / p;
    }

    printf("Palindrom? %s\n", original == reversed ? "Tak" : "Nie");

    return 0;
}
