# ------------------------------------------------------------------------------
# Do nothing but exit, but using a syscall instead
# ------------------------------------------------------------------------------

.section __TEXT,__text
.globl _main
_main:
  pushq %rbp
  movq %rsp, %rbp
  movl $5, %edi
  callq _exit
