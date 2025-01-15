#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define LENGTH 4
#define DIGITS 6

typedef struct {
    int code[LENGTH];
} Code;


void print_code(const Code *c) {
    for(int i = 0; i < LENGTH; i++) {
        printf("%d ", c->code[i]);
    }
    printf("?\n");
}

void check_code(const Code *guess, const Code *secret,
                      int *correct_positions, int *correct_digits)
{
    *correct_positions = 0;
    *correct_digits = 0;

    bool used_in_secret[LENGTH] = {false};
    bool used_in_guess[LENGTH]  = {false};

    for(int i = 0; i < LENGTH; i++) {
        if(guess->code[i] == secret->code[i]) {
            (*correct_positions)++;
            used_in_secret[i] = true;
            used_in_guess[i]  = true;
        }
    }

    for(int i = 0; i < LENGTH; i++) {
        if(!used_in_guess[i]) {
            for(int j = 0; j < LENGTH; j++) {
                if(!used_in_secret[j] && guess->code[i] == secret->code[j]) {
                    (*correct_digits)++;
                    used_in_secret[j] = true;
                    break;
                }
            }
        }
    }
}

int generate_all_codes(Code *allCodes) {
    int index = 0;
    for(int a = 1; a <= DIGITS; a++) {
        for(int b = 1; b <= DIGITS; b++) {
            for(int c = 1; c <= DIGITS; c++) {
                for(int d = 1; d <= DIGITS; d++) {
                    allCodes[index].code[0] = a;
                    allCodes[index].code[1] = b;
                    allCodes[index].code[2] = c;
                    allCodes[index].code[3] = d;
                    index++;
                }
            }
        }
    }
    return index;
}

bool check_if_possible(Code *guess, Code *candidate, int current_positions, int current_digits)
{
    int checked_positions, checked_digits;
    check_code(guess, candidate, &checked_positions, &checked_digits);
    return (checked_positions == current_positions && checked_digits == current_digits);
}

int main(void) {
    Code all_codes[(int)pow(DIGITS, LENGTH)];
    int code_count = generate_all_codes(all_codes);
    bool possible[(int)pow(DIGITS, LENGTH)];
    for(int i = 0; i < code_count; i++) {
        possible[i] = true;
    }

    int guess_count = 0;
    int max_guesses = 8;

    while(guess_count < max_guesses) {
        int guess_index = -1;
        for(int i = 0; i < code_count; i++) {
            if(possible[i]) {
                guess_index = i;
                break;
            }
        }

        if(guess_index == -1) {
            printf("Oszukujesz!\n");
            return 0;
        }

        guess_count++;
        Code guess = all_codes[guess_index];
        printf("%d: ", guess_count);
        print_code(&guess);

        printf("Na swoim miejscu : ");
        int correct_positions;
        scanf("%d", &correct_positions) != 1;

        printf("Nie na swoim miejscu : ");
        int correct_digits;
        scanf("%d", &correct_digits);

        if(correct_positions == 4) {
            printf("Wygralem.\n");
            return 0;
        }

        for(int i = 0; i < code_count; i++) {
            if(possible[i]) {
                if(!check_if_possible(&guess, &all_codes[i], correct_positions, correct_digits)) {
                    possible[i] = false;
                }
            }
        }
    }

    printf("Nie zgadlem kodu w %d probach :(\n", max_guesses);


    return 0;
}