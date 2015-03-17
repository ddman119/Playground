.section __DATA,__data
str:
  .asciz "Hello, world!\n"

.section __TEXT,__text
.globl _main
_main:
  movq $0x2000004, %rax # The print system call
  movq $1, %rdi # Print to STDOUT
  movq str@GOTPCREL(%rip), %rsi # Look the string up with the GOT
  movq $100, %rdx # Some size of the output
  syscall

  movq $0, %rbx # Exit with status code 0
  movq $0x2000001, %rax
  syscall
