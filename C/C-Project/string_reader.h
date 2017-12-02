#include <stdlib.h>
#include "vector.h"
#include <stdio.h>

void vector_init(Vector *vector){
    vector -> size = 0;
    vector -> capacity = 20;
    vector -> data = malloc(sizeof(int) * vector -> capacity);
}

void vector_delete(Vector *vector){
    free(vector -> data);
}

void vector_push(Vector *vector, void *value){
    vector_double_capacity(vector);
    vector -> data[vector -> size ++] = value;
}

void vector_double_capacity(Vector *vector){
    if (vector -> size >= vector -> capacity){
        vector -> capacity *= 2;
        vector -> data = realloc(vector -> data, sizeof(int) * vector -> capacity);
    }
}

void *vector_pop(Vector *vector){
    int value = vector -> data[vector -> size];
    vector -> data[vector -> size] = NULL;
    return value;
}

size_t vector_size(const Vector *vector){
    return vector -> size;
}

size_t vector_capacity(const Vector *vector){
    const size_t size = vector_size(vector);
    if( 0 == size) return size;
    size_t capacity = 1;
    while(size > capacity){capacity <<= 1;}
    return capacity;
}

void *vector_get_element(const Vector *vector, size_t index){
    if (index >= vector -> size || index < 0){
        printf ("Index %d out of bounds", index);
    }

    return vector -> data[index];
}

void **vector_get_array(const Vector *vector){
    return vector -> *data;

}