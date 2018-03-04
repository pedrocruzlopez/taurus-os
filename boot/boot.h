#define SETUP_BUFFER_SEG 0x1000

#define SETUP_STACK_SIZE 0x400

#define halt_cpu() cli; hlt 

#define print(x) pushw $x; call print_msg
