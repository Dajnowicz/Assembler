	.file	"a.c"
	.text
	.section	.rodata
.LC0:
	.string	"y = %i \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$2018, -8(%rbp)
	movl	$0, -4(%rbp)
	movl	-8(%rbp), %edx
#APP
# 7 "a.c" 1
	.intel_syntax noprefix; mov eax,%edx; add eax,eax; mov %edx,eax; .att_syntax prefix;
# 0 "" 2
#NO_APP
	movl	%edx, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
