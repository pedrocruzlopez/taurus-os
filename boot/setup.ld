OUTPUT(setup.bin)
OUTPUT_FORMAT("binary")
INPUT(setup.o)
ENTRY(_start)

START_ADDRESS = 0x0;


SECTIONS
{
	
	. = START_ADDRESS;
	.text : {

		*(.text)

	}
	.data : {
		*(.data)
	}
	
	_end_setup = .;

}
