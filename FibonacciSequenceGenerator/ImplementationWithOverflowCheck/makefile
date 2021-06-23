fibonacci: fibonacci.o overflowCheck.o
	gcc -o fibonacci fibonacci.o overflowCheck.o

fibonacci.o: fibonacci.s
	gcc -c fibonacci.s

overflowCheck.o: overflowCheck.s
	gcc -c overflowCheck.s