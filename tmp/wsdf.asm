use32

;	push dword [ebp+4] ; (ps)
;mov ebp, esp
;	imul eax, ebx
;	pop dword [ebp-4] ; (p)
;	idiv ebx
;	xor ecx, ecx
;	mov	edi, dword [esp+8]
;	not	ecx
;	cld
;	repne scasb
	mov	eax, ecx
