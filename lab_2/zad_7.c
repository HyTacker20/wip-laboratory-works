#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int prime_factors(int n) {

    if (n == 1 || n == 0)
    {
        printf("Nie ma czynnikow pierwszych.\n");
        return 1;
    }
    printf("%d = ", n); 

    int potega = 0;
    int counter = 1;

    while (n % 2 == 0)
    {
        potega++; 
        n /= 2;
    }
    if (potega > 0) 
    {
        printf("2");
        if (potega > 1) 
        {
            printf("^%d", potega);
        }
        counter = 0;
    }

    for (int i = 3; i <= sqrt(n); i += 2)
     {
        potega = 0;
        while (n % i == 0) 
        {
            potega++;
            n /= i;
        }
        if (potega > 0) 
        {   
            if (!counter) 
                printf("*");

            printf("%d", i);

            if (potega > 1) 
            {
                printf("^%d", potega);
            }
            counter = 0;
        }
    }

    if (n > 1) 
    {   
        if (!counter) 
            printf("*");
        printf("%d", n);
    }
    printf("\n");
    return 0;
}

int main() {
    int n;
    printf("Wpisz n: ");
    scanf("%d", &n);

    if (n < 0) 
    {
        n = abs(n);
    }

    prime_factors(n);
    
    return 0;
}
