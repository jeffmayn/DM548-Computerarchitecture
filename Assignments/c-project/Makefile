dir=src/
execute: $(dir)string_reader.o $(dir)vector.o
	cc $(dir)string_reader.o $(dir)vector.o -o program

string_reader.o: $(dir)string_reader.c $(dir)string_reader.h $(dir)vector.h
	cc -c $(dir)string_reader.c

vector.o: $(dir)vector.c $(dir)vector.h
	cc -c $(dir)vector.c

test: ./program
	./program "test/test_1.txt"
	./program "test/test_2.txt"
	./program "test/test_3.txt"
	./program "test/test_4.txt"
	./program "test/test_5.txt"

clean:
	rm $(dir)*.o && rm program
