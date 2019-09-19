; -------------------------------------------------------------
; This file compiled by NBex
;
; Compiled from file "TestInludefile"
; -------------------------------------------------------------

use32

MAIN_TestInludefile:
; Export method: ksyscall
; Export method: ksyscall1
; local method
;   params declared: 1, local vars: 1
ksyscall:
	push ebp
	mov ebp, esp
	sub esp, 4
	push dword 0
	pop dword [ebp-4] ; (res)

; inline code {
		mov	eax, dword [ebp+8] ; (func)
		int	0x80
		mov	dword [ebp-4], eax ; (res)
	
; }
.return:
	leave
	ret

; local method
;   params declared: 2, local vars: 0
ksyscall1:
	push ebp
	mov ebp, esp
; inline code {
		mov	eax, dword [ebp+8] ; (func)
		mov	ebx, dword [ebp+12] ; (param)
		int	0x80
	
; }
.return:
	leave
	ret

