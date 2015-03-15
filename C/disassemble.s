	.section	__TEXT,__text,regular,pure_instructions
	.globl	_add
	.align	4, 0x90
_add:                                   ## @add
	.cfi_startproc
## BB#0:
	push	rbp
Ltmp2:
	.cfi_def_cfa_offset 16
Ltmp3:
	.cfi_offset rbp, -16
	mov	rbp, rsp
Ltmp4:
	.cfi_def_cfa_register rbp
	mov	dword ptr [rbp - 4], edi
	mov	dword ptr [rbp - 8], esi
	mov	esi, dword ptr [rbp - 4]
	add	esi, dword ptr [rbp - 8]
	mov	dword ptr [rbp - 12], esi
	mov	eax, dword ptr [rbp - 12]
	pop	rbp
	ret
	.cfi_endproc

	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	push	rbp
Ltmp7:
	.cfi_def_cfa_offset 16
Ltmp8:
	.cfi_offset rbp, -16
	mov	rbp, rsp
Ltmp9:
	.cfi_def_cfa_register rbp
	sub	rsp, 32
	mov	eax, 40
	mov	ecx, 20
	mov	dword ptr [rbp - 4], edi
	mov	qword ptr [rbp - 16], rsi
	mov	edi, eax
	mov	esi, ecx
	call	_add
	mov	ecx, 0
	mov	dword ptr [rbp - 20], eax
	mov	eax, ecx
	add	rsp, 32
	pop	rbp
	ret
	.cfi_endproc


.subsections_via_symbols
