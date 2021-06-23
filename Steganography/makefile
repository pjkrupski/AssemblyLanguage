encode_image: steno.o read_int.o encode_image2.o convert2pixel.o read_image.o write_image.o
	gcc -o encode_image write_image.o read_image.o steno.o read_int.o encode_image2.o convert2pixel.o -L . -lutil

steno.o: steno.c
	gcc -c -s steno.c

read_int.o: read_int.s
	gcc -c -g read_int.s

encode_image2.o: encode_image2.c
	gcc -c -g encode_image2.c

convert2pixel.o: convert2pixel.c
	gcc -c -g convert2pixel.c

read_image.o: read_image.s
	gcc -c -g read_image.s

write_image.o: write_image.s
	gcc -c -g write_image.s

clean:
	rm *.o encode_image
