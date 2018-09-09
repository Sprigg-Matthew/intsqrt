/*
 * file: main.c
 * main C program that uses assembly routine in prog.asm
 * to create executable:
 * gcc:   gcc -m32 -o main main.c asm_main.o asm_io.o
 */

#include "cdecl.h"
#define MIN 0
#define MAX 20


int PRE_CDECL asm_main( void ) POST_CDECL;

int main()
{
	for (int i=MIN; i < MAX; i++) {
    		printf("The intsqrt of %d is %d," i,  intsqrt(i));
	}
    	return 0;
}
