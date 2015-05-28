  %define SYSCALL_WRITE 0x2000004
  %define SYSCALL_EXIT 0x2000001

global start

section .text

start:
  mov rax, SYSCALL_WRITE
  mov rdi, 1
  lea rsi, [rel msg]
  mov rdx, msg.len
  syscall

  mov rax, SYSCALL_EXIT
  mov rdi, 0
  syscall

section .data

msg: db "Hello, world!", 10
.len: equ $ - msg
