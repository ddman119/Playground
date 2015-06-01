extern _printf

section .data
  msg: db "Hello, world!", 10

section .text
  global start

start:
  ; Print a string via printf.
  mov rdi, [rel msg]
  call _printf

  ; Exit.
  mov rax, 0x2000001
  mov rdi, 0
  syscall
