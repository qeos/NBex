; pointer to ptbl
include "binheader.inc"

; -------------------------------------------------------------------------------------
.d_str_data equ
.d_data equ
.d_include equ "system.inc"

macro idata_s name, [var]{
	local pdata
	.d_str_data equ .d_str_data name db var,
}
macro idata name, [var]{
	local pdata
	.d_data equ .d_data name var,
}
macro iinclude name1{
	.d_include equ .d_include, name1
}

macro ddata{
; include files at the end of code
match names,.d_include \{
	irp inames,names \\{
		include inames
	\\}
\}

code_size = $ - real_main_startpoint
	rb ($ / 0x100 + 1) * 0x100 - $
RVA_data:
include "vkeys.inc"
	common .d_str_data equ .d_str_data db ''
	match names,.d_str_data \{
		irp inames,names \\{
			inames, 0
		\\}
	\}
	match names,.d_data \{
		irp inames,names \\{
			inames
		\\}
	\}
RVA_data_size = $ - RVA_data
}


macro assign reg, var{
	mov reg, var - RVA_data	; this offset in RVA
	add reg, esi
; use it for free ebx
; check it
;	if reg eq edx
;		push	fs
;		add	reg, [esp]
;		add	esp, 4
;	else
;		push	edx
;		mov	edx, fs
;		add	reg, edx
;		pop	edx
;	end if
}

rb ($ / 0x10 + 1) * 0x10 - $

real_main_startpoint:

;	call init_mem

