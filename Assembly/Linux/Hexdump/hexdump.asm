section .bss

  BufferLength equ 16
  Buffer: resb BufferLength

section .data

  HexString: db " 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00", 10
  HexLength: equ $-HexString
  Digits: db "0123456789ABCDEF"

section .text

global _start

_start:
  nop

read:
  ; Use the sys_read syscall to read 16 characters into the buffer
  mov eax, 3
  mov ebx, 0
  mov ecx, Buffer
  mov edx, BufferLength
  int 80h

  ; If the end of the input has been reached, jump to the exit
  mov ebp, eax ; Save eax (the number of bytes read) for later
  cmp eax, 0
  je exit

  mov esi, Buffer ; Put the address of the buffer into esi
  mov edi, HexString ; Put the address of the hex string into edi
  xor ecx, ecx

scan:
  xor eax, eax ; Clear out eax

  ; Calculate the offset into HexString
  mov edx, ecx
  shl edx, 1
  add edx, ecx

  mov al, byte [esi+ecx]
  mov ebx, eax

  ; Isolate the low half of the current byte with 0Fh
  and al, 0Fh
  mov al, byte [Digits+ecx]
  mov byte [HexString+edx+2], al

  shr bl, 4
  mov bl, byte [Digits+ebx]
  mov byte [HexString+edx+1], bl

  inc ecx
  cmp ecx, ebp
  jna scan

  mov eax, 4
  mov ebx, 1
  mov ecx, HexString
  mov edx, HexLength
  int 80h
  jmp read

exit:
  mov eax, 1
  mov ebx, 0
  int 80h
