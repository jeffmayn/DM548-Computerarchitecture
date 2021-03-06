#ifndef VECTOR_H
#define VECTOR_H

#include <stdlib.h>

//-----------------------------------------------------------------------------
// Vector, a dynamic array using size doubling to achieve amortized constant time insertion
// There are prerequisites mentions in each function description. The user has to make sure
// that these conditions are fulfilled before the function call. Nevertheless, the function
// should check these conditions as well and react accordingly (e.g., exit the program)
//-----------------------------------------------------------------------------

// forward declare structs and bring them from the tag namespace to the ordinary namespace
// typedef struct Vector Vector;

typedef struct Vector
{
    int size;      // slots used so far
    int capacity;  // total available slots
    void **data;     // array of string we are storing
} Vector;

// Initialize a vector to be empty
// Pre: 'vector' != NULL
void vector_init(Vector *vector);

// Deallocate internal structures of the vector
// Note: the user is responsible for deleting all values
// Note: the user is responsible for deleting the actual vector if it was dynamically allocated
void vector_delete(Vector *vector);

// Insert a new element at the end of the vector
// Pre: 'vector' != NULL
void vector_push(Vector *vector, void *value);

// Remove the last element in the vector and return the value
// Pre: the vector is non-empty, 'vector' != NULL
void *vector_pop(Vector *vector);

// Return the number of elements in the vector
// Pre: 'vector' != NULL
size_t vector_size(const Vector *vector);

// Return the current capacity of the vector
// Pre: 'vector' != NULL
size_t vector_capacity(const Vector *vector);

// Return the value at the given index
// Pre: index < vector_size(vector)
void *vector_get_element(const Vector *vector, size_t index);

// Return a pointer to the underlying array
void **vector_get_array(const Vector *vector);


void vector_double_capacity(Vector *vector);

#endif
