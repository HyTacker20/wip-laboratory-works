#include <stdio.h>
#include <math.h>

int main() {
    float a, b, c;
    printf("ax^2 +- bx -+ c = 0\n");
    printf("Podaj współczynnik a: ");
    scanf("%f", &a);
    printf("Podaj współczynnik b: ");
    scanf("%f", &b);
    printf("Podaj współczynnik c: ");
    scanf("%f", &c);

    if (a == 0 && b == 0 && c == 0){
        printf("Nieskoncie wiele rozwiazan!\n");
        return 0;
    }

    float delta = (b * b) - (4 * a * c);

    if (delta < 0) {
        printf("Brak rozwiązań rzeczywistych.\n");

    } else if (delta == 0) {
        float x = -b / (2 * a);
        printf("Jedno rozwiązanie: x = %f\n", x);
        
    } else {
        float sqrt_delta = sqrt(delta);
        float x1 = (-b + sqrt_delta) / (2 * a);
        float x2 = (-b - sqrt_delta) / (2 * a);
        printf("Dwa rozwiązania: x1 = %f, x2 = %f\n", x1, x2);
    }

    return 0;
}
