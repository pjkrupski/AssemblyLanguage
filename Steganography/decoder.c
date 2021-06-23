#include <stdio.h>
#include <string.h>

#define KEY 123456

void decode(unsigned char *B, unsigned char *G, unsigned char *R,
            int height, int width, char *message, int size)
{

    int i;

    srand(KEY);  // reset the random number generate to KEY

    for (i = 0; i < size; i++)
    {
        int pixel_ind, color_ind;

        pixel_ind = (rand() % (height*width - 1)) + 1;
        color_ind = (rand() % 3) + 1;
       
        if (color_ind == 1)
            *(message + i) = *(B + pixel_ind);
        else if (color_ind == 2)
            *(message + i) = *(G + pixel_ind);
        else
            *(message + i) = *(R + pixel_ind);
     }

     *(message + size) = '\0';
}