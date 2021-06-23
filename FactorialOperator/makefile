factorial: factorial.o factorialoverflowCheck.o
	gcc -o factorial factorial.o factorialoverflowCheck.o

factorial.o: factorial.s
	gcc -c factorial.s

factorialoverflowCheck.o: factorialoverflowCheck.s
	gcc -c factorialoverflowCheck.s