#include <stdio.h>
#include <stdlib.h>
#include <math.h>


int is_prime(int n) {
    if (n <= 1) {return 0;}
    if (n == 2) {return 1; }
    if (n % 2 == 0) {return 0; }
    
    float sqrt_n = sqrt(n);

    for (int i = 3; i <= sqrt_n; i += 2)  
    {
        if (n % i == 0) 
        {
            return 0; 
        }
    }
    return 1; 
}

int main() {
    int n, result;

    printf("Podaj N: ");
    scanf("%d", &n);

    result = is_prime(n);
    if (result) 
    {
        printf("Pierwsza\n");
    } 
    else {
        printf("Nie pierwsza\n");
    }

    return 0;
}
