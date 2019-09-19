use32

include "mem_utils.inc"

; -------------------------------------------------------------------------------------
; for get length of string we need
;	count chars while not 0

; input
;	stack+0 - pointer to string
; output
;	eax - size of string in bytes
str_len:
	push	ebp
	mov	ebp, esp
	push ebx
	mov	ebx, [ebp+8]
	xor eax, eax
	dec eax
@@:
	inc eax
;	mov dl, [ebx+eax]
	cmp byte [ebx+eax], 0
	jnz	@b
	pop ebx
	leave
	ret


; -------------------------------------------------------------------------------------
; for copy string we need
;	init counter
;	while counter not zero
;		get byte from source
;		put byte to destination
;		dec counter

; input
;	stack+0 - pointer to string 1
;	stack+1 - pointer to string 2
;	stack+2 - count bytes
; output
str_copy:
	push	ebp
	mov	ebp, esp

	mov	ecx, [ebp+8]
	mov	edi, [ebp+12]
	mov	ebx, [ebp+16]
	mov	edx, 0
@@:
	mov	al, [ebx+edx]
	mov	[edi+edx], al

	inc	edx
	dec	ecx
	jnz @b

	leave
	ret


; -------------------------------------------------------------------------------------
; for join this string we need
;	create new pointer
;	allocate memory
;	point to allocated area
;	copy first string
;	copy second string

; input
;	stack+0 - pointer to string 1
;	stack+1 - pointer to string 2
; output
;	eax - pointer to new string
str_join:
	push	ebp
	mov	ebp, esp
	sub	esp, 16
	push dword [ebp+12] ; +12 is last parametr
	call str_len
	mov	[ebp-4], eax
	push dword [ebp+8] ; +8 is last-1 parametr
	call str_len
	mov	[ebp-8], eax
	
	add eax, [ebp-4]
	inc eax
	mov	[ebp-16], eax

	push eax
	call malloc
	mov	[ebp-12], eax ; pointer to new string

	push	dword [ebp+12] ; src
	push	dword [ebp-12] ; dest
	push	dword [ebp-4] ; 1 str length
	call	str_copy

	push	dword [ebp+8] ; src
	mov	eax, [ebp-12] ; dest
	add	eax, [ebp-4]
	push	eax
	push	dword [ebp-8] ; 2 str length
	call	str_copy

	mov	eax, [ebp-12]
	add	eax, [ebp-16]
	dec eax
	mov	byte [eax], 0

	mov	eax, [ebp-12]
	
	leave
	ret









