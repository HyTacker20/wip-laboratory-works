#include <stdio.h>
#include <stdlib.h>

int algorytm_euklidesa(int a, int b){
    int c;
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

    return a;
}

int main() {
    int a, b;
    printf("Podaj pierwszą liczbę: ");
    scanf("%d", &a);
    printf("Podaj drugą liczbę: ");
    scanf("%d", &b);

    int result = algorytm_euklidesa(abs(a), abs(b));

    printf("Największy wspólny dzielnik to: %d\n", result);
    return 0;
}
