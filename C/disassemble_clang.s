	.section	__TEXT,__text,regular,pure_instructions
	.globl	_some_function
	.align	4, 0x90
_some_function:                         ## @some_function
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
	mov	dword ptr [rbp - 12], edx
	mov	edx, dword ptr [rbp - 4]
	add	edx, 3
	mov	dword ptr [rbp - 16], edx
	mov	edx, dword ptr [rbp - 8]
	add	edx, 6
	mov	dword ptr [rbp - 20], edx
	mov	edx, dword ptr [rbp - 12]
	add	edx, 9
	mov	dword ptr [rbp - 24], edx
	mov	edx, dword ptr [rbp - 16]
	cmp	edx, dword ptr [rbp - 20]
	sete	al
	and	al, 1
	movzx	eax, al
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
	mov	eax, 1
	mov	ecx, 2
	mov	edx, 3
	mov	dword ptr [rbp - 4], edi
	mov	qword ptr [rbp - 16], rsi
	mov	edi, eax
	mov	esi, ecx
	call	_some_function
	mov	ecx, 0
	mov	dword ptr [rbp - 20], eax ## 4-byte Spill
	mov	eax, ecx
	add	rsp, 32
	pop	rbp
	ret
	.cfi_endproc


.subsections_via_symbols
