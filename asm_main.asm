;
; file: asm_main.asm
; Author
; Description: 
;
;

%include "asm_io.inc"



;--------------------------------------------------------
; initialized data is put in the .data segment
;
segment .data
	prompt	db, "Enter number to test if it is an even square:",10,0
	pass	db, " is an even square. Its root is ", 10, 0
	fail	db, " is not an even square. Its root rounded down is. ", 10, 0

;--------------------------------------------------------
; uninitialized data is put in the .bss segment
;
segment .bss
	input	resd	; mem for user input.

;--------------------------------------------------------
; code is put in the .text segment
;
segment .text
        global  asm_main

;--------------------------------------------------------
; MAIN FUNCTION						;
;--------------------------------------------------------

asm_main:

;--------------------------------------------------------
; PROLOGUE						;
;--------------------------------------------------------
        enter   0,0               ; setup routine
        pusha

;--------------------------------------------------------
; CODE							;
;--------------------------------------------------------

	mov 	eax, prompt	; print prompt.
	call 	print_string	;

	call	read_int	; Stores int from keyboard in eax.
	mov 	[input], eax

	mov	ebx, 0		; start counter at 0
	mov	ecx, 1		; first subtractor.
	mov	edx, [input]
while:	; ( [input] > 0)
	sub	edx, ecx	; subtract ecx.
	inc	ebx		; count odds
	add	ecx, 2		; inc subtractor by 2.
	cmp	edx, 0 ; if input >  0, loop.
	jgt	while
	jz	pass		; if equals 0, goto pass.
				; else
fail:
	mov eax, [input]
	call print_int
	mov eax, [fail]
	call print_string
	
pass:

;--------------------------------------------------------
; EPILOGUE						;
;--------------------------------------------------------
        popa
        mov     eax, 0            ; return back to C
        leave
        ret


;--------------------------------------------------------
; FUNCTIONS / SUBPROGRAMS			 	;
;--------------------------------------------------------
