SECTION .data

  HelloMsg: db "Hello, world!", 10
  HelloLen: equ $-HelloMsg

SECTION .bss

SECTION .text

global _start
_start:
  nop
  mov eax, 4
  mov ebx, 1
  mov ecx, HelloMsg
  mov edx, HelloLen
  int 80H

  mov eax, 1
  mov ebx, 0
  int 80H
