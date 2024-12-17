#include <stdio.h>
#include <stdlib.h>
#include "list.h"

bool is_empty(list l) {
    return l->first == NULL;
}

int pop(list l) {
    if (is_empty(l)) return -1; // Lista pusta
    node_ptr n = l->first;
    int e = n->elem;

    l->first = l->first->next;
    if (l->first == NULL) {
        l->last = NULL; // Jeśli był to ostatni element
    }

    free(n);
    l->length--; // Aktualizujemy licznik
    return e;
}

void push(list l, int e) {
    node_ptr n = malloc(sizeof(node));
    n->elem = e;
    n->next = l->first;
    l->first = n;

    if (l->last == NULL) {
        l->last = n; // Pierwszy element
    }

    l->length++;
}

void append(list l, int e) {
    node_ptr n = malloc(sizeof(node));
    n->elem = e;
    n->next = NULL;

    if (is_empty(l)) {
        l->first = l->last = n;
    } else {
        l->last->next = n;
        l->last = n;
    }
    l->length++;
}

int get(list l, int i) {
    if (i < 1 || i > l->length) return -1; // Sprawdzenie indeksu
    node_ptr n = l->first;
    for (int pos = 1; pos < i; pos++) {
        n = n->next;
    }
    return n->elem;
}

void put(list l, int i, int e) {
    if (i < 1 || i > l->length) return; // Sprawdzenie indeksu
    node_ptr n = l->first;
    for (int pos = 1; pos < i; pos++) {
        n = n->next;
    }
    n->elem = e;
}

void insert(list l, int i, int e) {
    if (i < 1 || i > l->length + 1) return; // Sprawdzenie indeksu
    if (i == 1) {
        push(l, e);
        return;
    } else if (i == l->length + 1) {
        append(l, e);
        return;
    }

    node_ptr n = malloc(sizeof(node));
    n->elem = e;

    node_ptr prev = l->first;
    for (int pos = 1; pos < i - 1; pos++) {
        prev = prev->next;
    }
    n->next = prev->next;
    prev->next = n;

    l->length++;
}

void delete(list l, int i) {
    if (i < 1 || i > l->length) return;

    if (i == 1) {
        pop(l);
        return;
    }

    node_ptr prev = l->first;
    for (int pos = 1; pos < i - 1; pos++) {
        prev = prev->next;
    }

    node_ptr to_delete = prev->next;
    prev->next = to_delete->next;

    if (to_delete == l->last) {
        l->last = prev;
    }

    free(to_delete);
    l->length--;
}

void print(list l) {
    node_ptr n = l->first;
    while (n != NULL) {
        printf(" %d", n->elem);
        n = n->next;
    }
    printf(" ( %d )\n", l->length);
}

int length(list l) {
    return l->length;
}

void clean(list l) {
    while (!is_empty(l)) {
        pop(l);
    }
}