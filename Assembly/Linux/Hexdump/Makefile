hexdump: hexdump.o
	ld -o hexdump hexdump.o

hexdump.o: hexdump.asm
	nasm -f elf -g -F stabs hexdump.asm
