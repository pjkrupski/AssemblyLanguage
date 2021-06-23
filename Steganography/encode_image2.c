#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define KEY 123456

void encode_image(unsigned char *B, unsigned char *G,
                  unsigned char *R, int height, int width,
                  char *message)
{

     srand(KEY);

     int length = strlen(message);
     unsigned char len[3];

     convert2pixel(length, len);

     B[0] = len[0];
     G[0] = len[1];
     R[0] = len[2];

     int i;

     for (i = 0; i < length; i++)
     {
         int index, col;
         unsigned char c_char;

         c_char = message[i];

         index = rand() % (height*width - 1)  + 1;
         col = (rand() % 3) + 1;

         if (col == 1)
            B[index] = c_char;
         else if (col == 2)
            G[index] = c_char;
         else
            R[index] = c_char;

      } // int i

} // encode image