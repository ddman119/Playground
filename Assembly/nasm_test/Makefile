all: nasm.o
	ld -o nasm nasm.o
nasm.o: nasm.asm
	nasm -f macho64 nasm.asm
