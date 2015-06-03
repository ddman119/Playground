all: libc_test.o
	ld -lc -o libc_test libc_test.o
libc_test.o: libc_test.asm
	nasm -f macho64 libc_test.asm
