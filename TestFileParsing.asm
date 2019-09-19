; -------------------------------------------------------------
; This file compiled by NBex
;
; Compiled from file "TestFileParsing"
; -------------------------------------------------------------

use32

include 'codemake.inc'

idata_s Strings_MMM_0,<'"Dude", its world'>
idata_s Strings_MMM_1,<'Hello '>
idata_s Strings_MMM_2,<'!!'>
idata_s Strings_MMM_3,<'outtext'>
idata_s Strings_MMM_4,<'exit'>
MAIN_TestFileParsing:
	sub esp, 36
; Include file: TestInludefile.NBex
iinclude "TestInludefile.asm"
	push dword 0x11ff30
	push dword 100
	pop ebx
	pop eax
	add eax, ebx
	push eax
	pop dword [ebp-4] ; (d)

	assign eax, Strings_MMM_0
	push eax
	pop dword [ebp-12] ; (world)

	assign eax, Strings_MMM_1
	push eax
	push dword [ebp-12] ; (world)
	call str_join
	push eax
	assign eax, Strings_MMM_2
	push eax
	call str_join
	push eax
	pop dword [ebp-24] ; (strf)

	push dword 2
	pop dword [ebp-28] ; (a)

	push dword [ebp-24] ; (strf)
	assign eax, Strings_MMM_3
	push eax
	call ksyscall1
	push eax

	push dword 3
	push dword [ebp-28] ; (a)
	call main
	push eax

	push dword 2
	assign eax, Strings_MMM_4
	push eax
	call ksyscall1
	push eax

; inline code {
include "windows_api.inc"
; }
; local method
;   params declared: 2, local vars: 15
main:
idata_s Strings_main_0,<'hello world'>
idata_s Strings_main_1,<'outtext'>
	push ebp
	mov ebp, esp
	sub esp, 60
	push dword 111
	push dword 2
	call d
	push eax

	push dword 222
	push dword 333
	push dword 444
	pop ebx
	pop eax
	xor edx, edx
	idiv ebx
	push eax
	pop ebx
	pop eax
	add eax, ebx
	push eax
	pop ebx
	pop eax
	imul eax, ebx
	push eax
	push dword [ebp+8] ; (parametrA)
	pop ebx
	pop eax
	add eax, ebx
	push eax
	pop dword [ebp-4] ; (parametrN)

	assign eax, Strings_main_0
	push eax
	assign eax, Strings_main_1
	push eax
	call ksyscall1
	push eax

; .block_1_if
.block_1_if_intro:
	push dword [ebp+8] ; (parametrA)
	push dword 5
	pop ebx
	pop eax
	add eax, ebx
	push eax
	push dword [ebp+12] ; (parametrB)
	pop eax
	pop ebx
	cmp eax, ebx
	ja .block_1_if_exit
	push dword [ebp-16] ; (test)
	push dword [ebp+8] ; (parametrA)
	call ksyscall1
	push eax

	pop dword [ebp-20] ; (parametrZ)

.block_1_if_exit:
; end .block_1_if
	push dword 0
	pop dword [ebp-24] ; (ii)

; .block_2_while
.block_2_while_intro:
	push dword [ebp-24] ; (ii)
	push dword 1
	pop eax
	pop ebx
	cmp eax, ebx
	jbe .block_2_while_exit
	push dword [ebp-24] ; (ii)
	push dword 1
	pop ebx
	pop eax
	add eax, ebx
	push eax
	pop dword [ebp-24] ; (ii)

	jmp .block_2_while_intro
.block_2_while_exit:
; end .block_2_while
	push dword [ebp-28] ; (lpFileName)
	push dword [ebp-32] ; (dwDesiredAccess)
	push dword [ebp-36] ; (dwShareMode)
	push dword [ebp-40] ; (lpSecurityAttributes)
	push dword [ebp-44] ; (dwCreationDistribution)
	push dword [ebp-48] ; (dwFlagsAndAttributes)
	push dword [ebp-52] ; (hTemplateFile)
	call CreateFileA
	push eax

	pop dword [ebp-56] ; (ret)

	push dword [ebp-56] ; (ret)
	push dword 0
	pop ebx
	pop eax
	imul eax, ebx
	push eax
	pop eax
	jmp .return

.return:
	leave
	ret

; local method
;   params declared: 1, local vars: 1
d:
	push ebp
	mov ebp, esp
	sub esp, 4
	push dword [ebp+8] ; (ps)
	push dword [ebp+8] ; (ps)
	pop ebx
	pop eax
	imul eax, ebx
	push eax
	pop dword [ebp-4] ; (p)

; inline code {
		mov eax, dword [ebp-4] ; (p)
		mov	dword [ebp+8], eax ; (ps)
	
; }
.return:
	leave
	ret

ddata
