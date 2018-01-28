.code16

.text
	.global _start

_start:

	xorw %ax, %ax
	movw %ax, %ds
	movw %ax, %ss


	movw $msg, %si
	jmp print_char

print_char:
	
	movb $0x0e, %ah
	movb $0, %bh
	movb $4, %bl

loop:
	
	cmpw $0, (%si)
	je halt_cpu

	lodsb
	int $0x10

	jmp loop

halt_cpu:

	nop
	
 
	
msg: 
	.asciz "Welcome to TAURUS OS"


signature:
	.fill (510-(.-_start)), 1, 0 
	.byte 0x55
    .byte 0xaa


