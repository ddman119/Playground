section .bss
  Buff resb 1

section .data

section .text
  global _start

_start:
  nop ; Keep gdb happy

Read:
  mov eax, 3 ; Use sys_read
  mov ebx, 0 ; Read from stdin
  mov ecx, Buff ; Use the address of the buffer
  mov edx, 1 ; Read one character from stdin
  int 80h

  cmp eax, 0 ; Check the return value
  je Exit ; Exit is we're at the end of the file

  cmp byte [Buff], 61h ; Check if the character is below lowercase 'a'
  jb Write
  cmp byte [Buff], 7Ah ; Check if the character is above lowercase 'z'
  ja Write

  sub byte [Buff], 20h ; At this point, the character is lowercase

Write:
  mov eax, 4 ; Use sys_write
  mov ebx, 1 ; Write to stdout
  mov ecx, Buff
  int 80h
  jmp Read

Exit:
  mov eax, 1
  mov ebx, 0
  int 80h
