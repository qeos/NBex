; -------------------------------------------------------------
; This file compiled by NBex
;
; Compiled from file "ioport"
; -------------------------------------------------------------

use32

MAIN_ioport:
; Export method: inb
; Export method: outb
; local method
;   params declared: 1, local vars: 0
inb:
	push ebp
	mov ebp, esp
; inline code {
		mov	edx, dword [ebp+8] ; (port)
		in	al, dx
		movzx	eax, al
	
; }
.return:
	leave
	ret

; local method
;   params declared: 2, local vars: 0
outb:
	push ebp
	mov ebp, esp
; inline code {
		mov	eax, dword [ebp+12] ; (data)
		mov	edx, dword [ebp+8] ; (port)
		out	dx, al
	
; }
.return:
	leave
	ret

