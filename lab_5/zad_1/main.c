#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "list.h"

int main() {
    char command[20];
    bool cont = true;
    int value, index;
    list l = malloc(sizeof(list_t));
    l->first = l->last = NULL;
    l->length = 0;

    while (cont) {
        printf("Command: ");
        scanf("%s", command);

        if (!strcmp(command, "push")) {
            printf("Value: ");
            scanf("%d", &value);
            push(l, value);
            printf("Result: OK\n");
        } else if (!strcmp(command, "append")) {
            printf("Value: ");
            scanf("%d", &value);
            append(l, value);
            printf("Result: OK\n");
        } else if (!strcmp(command, "insert")) {
            printf("Index: ");
            scanf("%d", &index);
            printf("Value: ");
            scanf("%d", &value);
            insert(l, index, value);
            printf("Result: OK\n");
        } else if (!strcmp(command, "delete")) {
            printf("Index: ");
            scanf("%d", &index);
            delete(l, index);
            printf("Result: OK\n");
        } else if (!strcmp(command, "get")) {
            printf("Index: ");
            scanf("%d", &index);
            int result = get(l, index);
            if (result != -1) {
                printf("Result: %d\n", result);
            } else {
                printf("Error - bad index!\n");
            }
        } else if (!strcmp(command, "put")) {
            printf("Index: ");
            scanf("%d", &index);
            printf("Value: ");
            scanf("%d", &value);
            put(l, index, value);
            printf("Result: OK\n");
        } else if (!strcmp(command, "pop")) {
            if (!is_empty(l)) {
                int result = pop(l);
                printf("Result: %d\n", result);
            } else {
                printf("Error - stack is empty!\n");
            }
        } else if (!strcmp(command, "print")) {
            printf("Result:");
            print(l);
        } else if (!strcmp(command, "clean")) {
            clean(l);
            printf("Result: OK\n");
        } else if (!strcmp(command, "exit")) {
            cont = false;
        } else {
            printf("Unknown command!\n");
        }
    }

    clean(l);
    free(l);
    return 0;
}