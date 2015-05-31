  %define SYSCALL_WRITE 0x2000004
  %define SYSCALL_EXIT 0x2000001

section .data
  msg: db "Hello, world!", 10
  .len: equ $ - msg

section .text
  global start
start:
  mov rax, SYSCALL_WRITE
  mov rdi, 1
  lea rsi, [rel msg]
  mov rdx, msg.len
  syscall

  mov rax, SYSCALL_EXIT
  mov rdi, 0
  syscall
