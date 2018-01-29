#!/bin/bash

as bootloader.S -o bootloader.o
ld -T boot.ld
dd if=/dev/zero of=floppy.img bs=1024 count=1440
dd if=bootloader.bin of=floppy.img seek=0 count=1 conv=notrunc
cp floppy.img iso/
genisoimage -quiet -V 'TAURUS' -input-charset iso8859-1 -o myos.iso -b floppy.img -hide floppy.img iso/
