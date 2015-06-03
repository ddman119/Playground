extern _printf

section .data
  msg: db "Hello, world", 10
  fmt: db "%s", 10, 0

section .text
  global start

start:
  push rbp

  ; Print a string via printf.
  mov rsi, [rel msg]
  mov rdi, fmt
  mov rax, 0
  call _printf

  pop rbp

  ; Exit.
  mov rax, 0x2000001
  mov rdi, 0
  syscall
