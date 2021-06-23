#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define KEY 123456

int read_int(FILE *, int);
void encode_image(unsigned char *B, unsigned char *G, unsigned char *R, 
                  int height, int width, char *message);
void convert2pixel(int, unsigned char *);

int read_image(FILE *fpin, unsigned char *B, unsigned char *G,
               unsigned char *R, int height, int width, int padding);

void write_image(FILE *fpin, unsigned char *B, unsigned char *G, 
            unsigned char *R, int height, int width, int padding, 
            FILE *fpout, int offset);

int main(int argc, char *argv[])
{
    char ifile[80] = "rainbow2.bmp";
    char ofile[80] = "rainbow_out.bmp";

    if (argc >= 3)
    {
        strcpy(ifile, argv[1]);
        strcpy(ofile, argv[2]);
    }
    else if (argc == 2)
    {
        strcpy(ifile, argv[1]);
    }

    FILE *fpin, *fpout;

    fpin = fopen(ifile, "rb");
    fpout = fopen(ofile, "wb");

    int filesize, offset, height, width;
    int padding = 0;


    filesize = read_int(fpin, 2);
    offset = read_int(fpin, 10);
    width = read_int(fpin, 18);
    height = read_int(fpin, 22);

    // read in image into RGB

    fseek(fpin, offset, SEEK_SET);

    // calculate padding to force each row to be a multiple of 4
    if ( (3*width) % 4 != 0)
    {
        padding = (3*width) % 4;
        padding = 4 - padding;
    }

    unsigned char *B, *G, *R;

    // Allocate memory
    B = (unsigned char *) malloc(width*height);
    G = (unsigned char *) malloc(width*height);
    R = (unsigned char *) malloc(width*height);

    read_image(fpin, B, G, R, height, width, padding);

     // Encode image
     char message[500] = "The covid19 pandemic sucks!";
     encode_image(B, G, R, height, width, message);

     // write out RGB

    write_image(fpin, B, G, R, height, width, padding, fpout, offset);

    fclose(fpin);
    fclose(fpout);

    return 0;

}  // main
