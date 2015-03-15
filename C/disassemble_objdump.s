
disassemble:     file format mach-o-x86-64


Disassembly of section .text:

0000000100000f40 <_add>:
   100000f40:	55                   	push   rbp
   100000f41:	48 89 e5             	mov    rbp,rsp
   100000f44:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
   100000f47:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
   100000f4a:	8b 75 fc             	mov    esi,DWORD PTR [rbp-0x4]
   100000f4d:	03 75 f8             	add    esi,DWORD PTR [rbp-0x8]
   100000f50:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
   100000f53:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
   100000f56:	5d                   	pop    rbp
   100000f57:	c3                   	ret    
   100000f58:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   100000f5f:	00 

0000000100000f60 <_main>:
   100000f60:	55                   	push   rbp
   100000f61:	48 89 e5             	mov    rbp,rsp
   100000f64:	48 83 ec 20          	sub    rsp,0x20
   100000f68:	b8 28 00 00 00       	mov    eax,0x28
   100000f6d:	b9 14 00 00 00       	mov    ecx,0x14
   100000f72:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
   100000f75:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
   100000f79:	89 c7                	mov    edi,eax
   100000f7b:	89 ce                	mov    esi,ecx
   100000f7d:	e8 be ff ff ff       	call   100000f40 <_add>
   100000f82:	b9 00 00 00 00       	mov    ecx,0x0
   100000f87:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
   100000f8a:	89 c8                	mov    eax,ecx
   100000f8c:	48 83 c4 20          	add    rsp,0x20
   100000f90:	5d                   	pop    rbp
   100000f91:	c3                   	ret    

Disassembly of section __TEXT.__unwind_info:

0000000100000f94 <__TEXT.__unwind_info>:
   100000f94:	01 00                	add    DWORD PTR [rax],eax
   100000f96:	00 00                	add    BYTE PTR [rax],al
   100000f98:	1c 00                	sbb    al,0x0
   100000f9a:	00 00                	add    BYTE PTR [rax],al
   100000f9c:	00 00                	add    BYTE PTR [rax],al
   100000f9e:	00 00                	add    BYTE PTR [rax],al
   100000fa0:	1c 00                	sbb    al,0x0
   100000fa2:	00 00                	add    BYTE PTR [rax],al
   100000fa4:	00 00                	add    BYTE PTR [rax],al
   100000fa6:	00 00                	add    BYTE PTR [rax],al
   100000fa8:	1c 00                	sbb    al,0x0
   100000faa:	00 00                	add    BYTE PTR [rax],al
   100000fac:	02 00                	add    al,BYTE PTR [rax]
   100000fae:	00 00                	add    BYTE PTR [rax],al
   100000fb0:	40 0f 00 00          	rex sldt WORD PTR [rax]
   100000fb4:	34 00                	xor    al,0x0
   100000fb6:	00 00                	add    BYTE PTR [rax],al
   100000fb8:	34 00                	xor    al,0x0
   100000fba:	00 00                	add    BYTE PTR [rax],al
   100000fbc:	93                   	xchg   ebx,eax
   100000fbd:	0f 00 00             	sldt   WORD PTR [rax]
   100000fc0:	00 00                	add    BYTE PTR [rax],al
   100000fc2:	00 00                	add    BYTE PTR [rax],al
   100000fc4:	34 00                	xor    al,0x0
   100000fc6:	00 00                	add    BYTE PTR [rax],al
   100000fc8:	03 00                	add    eax,DWORD PTR [rax]
   100000fca:	00 00                	add    BYTE PTR [rax],al
   100000fcc:	0c 00                	or     al,0x0
   100000fce:	01 00                	add    DWORD PTR [rax],eax
   100000fd0:	10 00                	adc    BYTE PTR [rax],al
   100000fd2:	01 00                	add    DWORD PTR [rax],eax
   100000fd4:	00 00                	add    BYTE PTR [rax],al
   100000fd6:	00 00                	add    BYTE PTR [rax],al
   100000fd8:	00 00                	add    BYTE PTR [rax],al
   100000fda:	00 01                	add    BYTE PTR [rcx],al
