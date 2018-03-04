#include "boot.h"

.code16

.text
	.global _start

_start:

	movw $SETUP_BUFFER_SEG, %ax 
	movw %ax, %ds
	movw %ax, %ss
	movw %ax, %es
	cld


	//Setup stack
	xorw %dx, %dx
	movw $_end_setup, %dx
	addw $SETUP_STACK_SIZE, %dx

	//align dx
	andw $~3, %dx
	movzwl %dx, %esp

	print(msg)
	halt_cpu()
	

print_msg:
	pushw %bp 
	movw %sp, %bp;
	movw 4(%bp), %si  

	movb $0x0e, %ah
	movb $0, %bh
	movb $4, %bl

loop:
	
	cmpw $0, (%si)
	je end_print

	lodsb
	int $0x10

	jmp loop

end_print:
	movw %bp, %sp
	popw %bp
ret	
	
.data 
	
msg: 
	.asciz "Setup code\n\r"
	.byte 0
msg2: 
	.asciz "What is happening\n\r"
	.byte 0



