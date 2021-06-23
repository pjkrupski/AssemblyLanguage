
void encode_image(unsigned char *B, unsigned char *G, unsigned char *R, 
                  int height, int width, char *message)
{
     int r, c;

     for (r = 0; r < height/2; r++)
     {
         for (c = 0; c < width; c++)
         {
             unsigned char temp;
 
             temp = *(B + r*width + c);
             *(B + r*width + c) = *(B + (height - 1 - r)*width + c);
             *(B + (height - 1 - r)*width + c) = temp;

             temp = *(G + r*width + c);
             *(G + r*width + c) = *(G + (height - 1 - r)*width + c);
             *(G + (height - 1 - r)*width + c) = temp;

             temp = *(R + r*width + c);
             *(R + r*width + c) = *(R + (height - 1 - r)*width + c);
             *(R + (height - 1 - r)*width + c) = temp;
          }  // int c
      } // int r
}  // function