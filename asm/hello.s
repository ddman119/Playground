# Hello, World
#
# as hello.s -o hello.o
# ld hello.o -e _main -o hello

.section __DATA,__data
hello:
  .asciz "Hello, world!\n"

.section __TEXT,__text
.globl _main
_main:
  movq $0x2000004, %rax # The print system call
  movq $1, %rdi # Print to STDOUT
  movq hello@GOTPCREL(%rip), %rsi # Look the string up with the GOT
  movq $14, %rdx
  syscall

  movq $1, %rbx # Exit with status code 0
  movq $0x2000001, %rax
  syscall
