//  Compare function to use in qsort
int cmpfunc(const void *first, const void *second);


//  function to print all strings in vector
void print_vector(Vector *vector);


//Function to read a file and push all the lines to the vector.
void file_reader(Vector *vector, FILE *file);