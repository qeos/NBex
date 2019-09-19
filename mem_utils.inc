; -------------------------------------------------------------------------------------
; for allocate memory we need
;	call to kernel, but for test we return already prepared memory

; input
;	stack+0 - required size of memory in bytes
; output
;	eax - pointer to frame
kmalloc:
	push	ebp
	mov	ebp, esp

	; get mem from syscall
idata_s sys_malloc, 'malloc'
	assign eax, sys_malloc
	mov ebx, [ebp+8]
	int 0x80

	leave
	ret

;mem	dd BLOCK_FREE
;	dd 0x400-8
;	rb 0x400-8

; for local allocations
idata mem_ptr, dd 0

BLOCK_FREE	= 0
BLOCK_USED	= 1

; -------------------------------------------------------------------------------------
; init mem
; input
; output
init_mem:
	push	ebp
	mov	ebp, esp

	push dword 0x1000
	call	kmalloc
	assign ebx, mem_ptr
	mov	[ebx], eax

	mov	dword [eax], BLOCK_FREE
	mov	dword [eax+4], 0x1000-8

	leave
	ret	


; -------------------------------------------------------------------------------------
; for allocate memory we need
;	get first node
;	check it for free
;		if free then
;			if size of block >= needed then
;				mark this block
;				create new block
;			else
;				get next
;		else
;			get next node by add position on block size

; input
;	stack+0 - pointer to string
; output
;	eax - size of string in bytes

malloc:
	push	ebp
	mov	ebp, esp

	; letter this need change to syscall to kernel kmalloc
	assign eax, mem_ptr
	mov	eax, [eax]

.process:
	mov	ebx, [eax]
	cmp ebx, BLOCK_FREE
	jne	.next
	mov	ebx, [eax+4]
	cmp ebx, dword [ebp+8]
	jae .get_block

.next:
	mov	ebx, [eax+4]
	add	eax, ebx
	cmp	eax, 0x1000
	jnae	.no_free_mem
	jmp	.process

.get_block:
	; made as used
	mov	dword [eax], BLOCK_USED
	; make new block
	mov	ebx, [ebp+8]
	mov	dword [eax+ebx+8], BLOCK_FREE
	mov	ecx, [eax+4]
	sub	ecx, [ebp+8]
	sub	ecx, 16 ; 2 headers
	mov	[eax+ebx+8+4], ecx
	; change size of current
	mov	ecx, [ebp+8]
	add	ecx, 8
	mov	[eax+4], ecx
	; return pointer to mem
	add	eax, 8
	jmp .exit

.no_free_mem:

.exit:

	leave
	ret



















