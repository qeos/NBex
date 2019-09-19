	.file	"main.c"
	.text
.globl __main
	.def	__main;	.scl	2;	.type	32;	.endef
__main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	$1, -20(%ebp)
	movl	$2, -16(%ebp)
	movl	$3, -12(%ebp)
	movl	$4, -8(%ebp)
	movl	$5, -4(%ebp)
	movl	$1, (%esp)
	call	__main1
	leave
	ret
.globl __main1
	.def	__main1;	.scl	2;	.type	32;	.endef
__main1:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	$2, 4(%esp)
	movl	$1, (%esp)
	call	__main2
	addl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	leave
	ret
.globl __main2
	.def	__main2;	.scl	2;	.type	32;	.endef
__main2:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	leave
	ret
