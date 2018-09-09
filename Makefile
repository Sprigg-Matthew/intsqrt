# http://pirate.shu.edu/~minimair/assembler/Makefile
#
all: main

asm_io.o : asm_io.asm
	nasm -dELF_TYPE -f elf -g asm_io.asm -o asm_io.o

intsqrt.o : intsqrt.asm
	nasm -l intsqrt.list -f elf -g -F stabs intsqrt.asm -o intsqrt.o

main : asm_io.o intsqrt.o
	gcc -m32 -o main intsqrt.o asm_io.o main.c

run : 
	./main

edit:
	vim intsqrt.asm

debug:
	gdb ./main

clean :
	@rm *.o *.list main
