#include <stdio.h>
#include <math.h>
#include <stdlib.h>

typedef double (*functype)(double);

void findzero(functype f, double a, double b, double eps) {
    double start = a, end = b, middle, result;
    while (fabs(end - start) >= eps) {
        result = f(a) * f(b);
        if (result > 0) {
            printf("ERROR!");
            return;
        }
        middle = (start + end) / 2.0;
        if (f(middle)==0) {
            printf("FOUND! %f\n", middle);
            return;
        }
        else if (f(start) * f(middle) < 0) {
            end = middle;
        }
        else if (f(middle) * f(end) < 0) {
            start = middle;
        }
    }
    printf("Zero = %.2f\n", (start + end) / 2);
}

double cos_half(double x) {
    return cos(x / 2);
}

double kwadrat(double x){
    return x*x - 1;
}

int main() {
    findzero(cos_half, 2, 4, 0.001);
    findzero(kwadrat, 0, 3, 0.001);
    return 0;
}