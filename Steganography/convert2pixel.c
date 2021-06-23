#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void convert2pixel(int length, unsigned char len[3])
{
        // byte3-byte2-byte1
	unsigned char byte1, byte2, byte3;

        byte1 = (unsigned char)(length % 256);
        byte2 = (unsigned char)((length >> 8) % 256);
        byte3 = (unsigned char)((length >> 16) % 256);

        len[0] = byte1;
        len[1] = byte2;
        len[2] = byte3;
}