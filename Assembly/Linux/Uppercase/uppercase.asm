; ==============================================================================
; BSS
; ==============================================================================

section .bss
  BufferLength equ 2014
  Buff resb BufferLength

; ==============================================================================
; Data
; ==============================================================================

section .data

; ==============================================================================
; Text
; ==============================================================================

section .text
  global _start

_start:
  nop ; Keep gdb happy

Read:
  mov eax, 3 ; Use sys_read
  mov ebx, 0 ; Read from stdin
  mov ecx, Buff ; Use the address of the buffer
  mov edx, BufferLength ; Read one character from stdin
  int 80h
  mov esi, eax
  cmp eax, 0 ; Check if the return value was 0, if so we're at the end
  je Exit

  mov ecx, esi
  mov ebp, Buff
  dec ebp

Scan:
  cmp byte [ebp+ecx], 61h ; Check if the character is below lowercase 'a'
  jb Next ; Scan the next character if it is already uppercase
  cmp byte [ebp+ecx], 7Ah ; Check if the character is above lowercase 'z'
  ja Next ; Scan the next character if it is already uppercase

  sub byte [ebp+ecx], 20h ; At this point, the character is lowercase

Next:
  dec ecx
  jnz Scan

Write:
  mov eax, 4 ; Use sys_write
  mov ebx, 1 ; Write to stdout
  mov ecx, Buff
  mov edx, esi
  int 80h
  jmp Read

Exit:
  mov eax, 1
  mov ebx, 0
  int 80h
