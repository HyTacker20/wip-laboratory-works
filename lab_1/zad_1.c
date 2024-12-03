#include <stdio.h>
#include <stdlib.h>

int main() {
    int a, b, c;
    printf("Podaj pierwszą liczbę: ");
    scanf("%d", &a);
    printf("Podaj drugą liczbę: ");
    scanf("%d", &b);

    if (a == 0 && b == 0)
    {
        printf("Error!\n");
        return 0;
    }
    

    while (b != 0) {
        c = a % b;
        a = b;
        b = c;
    }

    printf("Największy wspólny dzielnik to: %d\n", abs(a));
    return 0;
}
