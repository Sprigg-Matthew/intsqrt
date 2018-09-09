/*
 * file: main.c
 * main C program that uses assembly routine in prog.asm
 * to create executable:
 * gcc:   gcc -m32 -o main main.c asm_main.o asm_io.o
 */

#include "cdecl.h"
#include "stdio.h"
#define MIN 0
#define MAX 20


int PRE_CDECL intsqrt( int n ) POST_CDECL;

int main()
{
	int i;
	for (i=MIN; i < MAX; i++) {
    		printf("The intsqrt of %d is %d.\n", i,  intsqrt(i));
	}
    	return 0;
}
