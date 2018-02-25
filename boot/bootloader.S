#define print(x) pushw $x; call print_msg
.code16

.text
	.global _start


_start:

	xorw %ax, %ax
	movw %ax, %ds
	movw %ax, %ss

	movw $0x2000, %sp
	movw %sp, %bp

	print(msg)

	
	movb $0x41, %ah
	movw $0x55aa, %bx
	movb $0x80, %dl
	int $0x13
	jc without_extentions

with_extentions:  
	print(extentions_msg)
	jmp read_sectors

without_extentions:
	print(no_extentions_msg)
	cli
	hlt

read_sectors:
	print(reading_msg)
	
msg: 
	.asciz "Welcome to Taurus OS \n\r"
    .byte 0

booting_msg:
	.asciz "Booting... \n\r"
	.byte 0
no_extentions_msg:
	.asciz "No extentions installed, sorry :( Taurus have no support for CHS \n\r"
	.byte 0
extentions_msg:
	.asciz "Extentions installed \n\r"
	.byte 0
reading_msg:
	.asciz "Reading sectors...\n\r"
	.byte 0

disk_address_packet_structure:
	.byte 0x10 //Size of DAP
	.byte 0x0  //Must be zero
	.byte 0x0  //Last byte of number of sector to read (remember that x86 is little endian)
	.byte 0x1  //First byte of number of sectors to read




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


signature:
	.fill (510-(.-_start)), 1, 0 
	.byte 0x55
    .byte 0xaa


