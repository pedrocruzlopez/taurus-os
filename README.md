# taurus-os

A simple OS based in Unix & Linux systems for x86 architecture, just for experimental purposes :).

## Installation

### Requirements

- Linux OS
- GCC Compiler
- binutils
- qemu-system-x86_64 (hypervisor for test)

For the sake of simplicity, at this moment this is not available for real hardware (I hope in a few months will do), so it must be tested from a hypervisor (QEMU).

Execute the following:

1. Clone repository
```
$ git clone https://github.com/pedrocruzlopez/taurus-os.git
```
2. Move to `boot` directory
3. Execute the script
```
$ ./compile.sh
```
4. Run the hipervisor
```
$ qemu-system-x86_64 floppy.img
```
Hopefully in a few months there will have much more functionality. 

Any questions, email me.

pedrocruz.dev@gmail.com

