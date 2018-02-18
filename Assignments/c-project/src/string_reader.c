#include <stdio.h>
#include "vector.h"
#include "string_reader.h"
#include "string.h"

int main(int argc, char *argv[]) {

    // We start by creating a new vector from our data structure Vector, then we invoke vector_init to initialize it.
    Vector vector;
    vector_init(&vector);

    // Now we open a file in read-mode giving from command-line input, and invoke file_reader with our new vector.
    FILE *fp;
    fp = fopen(argv[1], "r");
    file_reader(&vector, fp);

    // We invoke qsort to sort our vector by passing the number of elements and the size of each element and our
    // compare function cmpfunc
    qsort(vector.data, (size_t) vector.size, sizeof(void *), cmpfunc);

    // Then we invoke our print_vector function to print the sorted vector
    print_vector(&vector);

    // Then we clean up memory and vector structure
    vector_delete(&vector);

    //  End of the program.
    return 0;
}

//  Compare function to use in qsort
//  The function uses strcasecmp to get same weight on uppercase and lowercase letters in the latin alphabet.
int cmpfunc(const void *first, const void *second){
    const char **a = (const char **)first;
    const char **b = (const char **)second;
    return strcasecmp(*a, *b);
}

//  This function iterates through the vector and prints all elements using a for loop calling "vector_get_element"
void print_vector(Vector *vector){
    for (int i = 0; i < vector->size; i++)
        printf("%s\n", (char *) vector_get_element(vector, (size_t) i));
}

//  The function reads a file and push all the lines to the vector.
//  It uses getline that stops at the end of a line when it meets a linebreak.
//  It will also replace the linebreak with string terminate "\0" and will skip pushing any value that only contain a linebreak.
//  At the end we will free up the memory used by line and close the file.
void file_reader(Vector *vector, FILE *file){
    char *line = NULL;
    size_t len = 0;

    if (file == NULL)
        exit(EXIT_FAILURE);

    while (getline(&line, &len, file) != -1){
        if (line[strlen(line) - 1] == '\n' && strlen(line) > 1) {
            line[strlen(line) - 1] = '\0';
        }
        if (line[0] != '\n'){
            vector_push(vector, line);
        }
    line = NULL;
    }
    free(line);
    fclose(file);
}