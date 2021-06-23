testsort: main.o print_results.o sort.o
	gcc -o testsort main.o print_results.o sort.o

main.o: main.s
	gcc -c -g main.s

print_results.o: print_results.s
	gcc -c -g print_results.s

sort.o: sort.s
	gcc -c -g sort.s

clean:
	rm *.o
