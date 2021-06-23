#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define KEY 123456

int read_image(FILE *fpin, unsigned char *B, unsigned char *G,
               unsigned char *R, int height, int width, int padding);
void decode(unsigned char *B, unsigned char *G, unsigned char *R,
            int height, int width, char *message, int size);

int main(int argc, char *argv[])
{
    char fname[80] = "rainbow_out.bmp";

    if (argc >= 2)
        strcpy(fname, argv[1]);

    FILE *fpin = fopen(fname, "rb");

    int filesize, offset, height, width;

    filesize = read_int(fpin, 2);
    offset = read_int(fpin, 10);
    width = read_int(fpin, 18);
    height = read_int(fpin, 22);

    fseek(fpin, offset, SEEK_SET);

    int padding = 0;

    if ( (3*width) % 4 != 0)
        padding = 4 - ( (3*width) % 4 );

    unsigned char *B, *G, *R;

    // Allocate memory
    B = (unsigned char *) malloc(width*height);
    G = (unsigned char *) malloc(width*height);
    R = (unsigned char *) malloc(width*height);

    // declare message length
    int length;
   
    length = read_image(fpin, B, G, R, height, width, padding);

    char *message;

    // allocate memory for message
    message = (char *) malloc(length+1);

    decode(B, G, R, height, width, message, length);

    // print result
    printf("The hidden message is: %s\n", message);

    fclose(fpin);

    return 0;
}