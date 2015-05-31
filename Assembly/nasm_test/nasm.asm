  %define SYSCALL_WRITE 0x2000004
  %define SYSCALL_EXIT 0x2000001

section .data
  even_msg: db "Even!", 10
  .len: equ $ - even_msg

  odd_msg: db "Odd!", 10
  .len: equ $ - odd_msg

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

  ; Do some random math to experiment with registers.
  mov r9, 32
  shr r9, 1

  ; Print a message.
  jmp exit

exit:
  mov rax, SYSCALL_EXIT
  mov rdi, r9
  syscall

even_message:
  mov rax, SYSCALL_WRITE
  mov rdi, 1
  lea rsi, [rel even_msg]
  mov rdx, 6
  syscall
  jmp exit

odd_message:
  mov rax, SYSCALL_WRITE
  mov rdi, 1
  lea rsi, [rel odd_msg]
  mov rdx, 5
  syscall
  jmp exit
