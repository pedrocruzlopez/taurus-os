OUTPUT(bootloader.bin)
OUTPUT_FORMAT("binary")
INPUT(bootloader.o)
ENTRY(_start)

START_ADDRESS = 0x7c00;


SECTIONS
{
	
	. = START_ADDRESS;
	.text : {

		*(.text)

	}
	
	

}
