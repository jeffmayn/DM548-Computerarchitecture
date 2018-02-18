#include <stdlib.h>
#include "vector.h"
#include <stdio.h>

// this function initialises the vector with size zero and a capacity of four, then allocates the memory
// by invoking malloc.
void vector_init(Vector *vector){
    vector -> size = 0;
    vector -> capacity = 4;
    vector -> data = malloc(sizeof(void *) * vector -> capacity);
}
// like the function name implies, it takes a pointer to a vector in memory and deletes it, in order to free up memory
void vector_delete(Vector *vector){
    free(vector->data);
}

// this function checks if the vector is NULL, if not then it checks if the capacity is suffiecient. If there is insuffiecient capacity
// we invoke vector_double_capacity to double it, otherwise we simply add value to the vector.
void vector_push(Vector *vector, void *value) {
    if (vector != NULL) {
        vector_double_capacity(vector);
        vector->data[vector->size++] = value;
    }
}

// this function takes a vector, checks if there are more elements in the vector than we've allocated memory for, or if the vector is full,
// and if so, doubles the allocated memory for vector
void vector_double_capacity(Vector *vector){
    if (vector->size >= vector->capacity){
        if ( (vector->data = realloc(vector->data, sizeof(void *) * (vector->capacity * 2))) == NULL)
        {
            exit(EXIT_FAILURE);
        }
        vector->capacity *= 2;
    }
}

// removes an element from the end of the vector. It first checks if the size and the data is different than null and zero
// to ensure we don't accidentally delete other data in memory and if this holds true, we remove the element at the end of the vector
// by setting it to Null, decrement the size by one and return the new, last value at the end of the vector
void *vector_pop(Vector *vector){
    if (vector -> size > 0 && vector -> data != NULL) {
        void *value = vector->data[vector->size - 1];
        vector->data[vector->size -1] = NULL;
        vector->size--;
        return value;
    }
}

// return how many elements there are in the vector, which the size of the vector, defined as a field
size_t vector_size(const Vector *vector){
    return (size_t) vector -> size;
}

// returns the capacity of the vector, i.e how many elements it can hold, defined as the field "capacity"
size_t vector_capacity(const Vector *vector){
    return (size_t) vector -> capacity;

}
// This function checks if the value at the index we tried to access is either to small (smaller than 0) or bigger than the size of the
// vector, in other words, out of bounds. If not, it returns the value at index, else index out of bounds error
void *vector_get_element(const Vector *vector, size_t index){
    if (index >= vector -> size || index < 0){
        printf ("Index %d out of bounds", (int) index);
    }
    return vector -> data[index];
}

// simply returns the values of the array, by returning the data of our vector
void **vector_get_array(const Vector *vector){
    return vector -> data;
}
