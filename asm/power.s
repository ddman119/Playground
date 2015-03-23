.section __DATA,__data

.section __TEXT,__text
.globl _main
_main:
  pushq $12
  pushq $3
  callq _add
  movq %rdx, %rbx
  callq _exit

_exit:
  movq %rbx, %rdi
  movq $0x2000001, %rax
  syscall

_add:
  pushq %rbp
  movq %rsp, %rbp
  movq 16(%rbp), %rbx
  addq 24(%rbp), %rbx
  movq %rbx, %rdx

  movq %rbp, %rsp
  popq %rbp
  ret
