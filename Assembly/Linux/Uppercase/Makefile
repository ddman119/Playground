uppercase: uppercase.o
	ld -o uppercase uppercase.o

uppercase.o: uppercase.asm
	nasm -f elf -g -F stabs uppercase.asm -l uppercase.lst
