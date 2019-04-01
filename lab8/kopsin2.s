	.intel_syntax noprefix
	.text
	.global main

main:
	mov eax, [esp+8]
	mov eax, [eax+4]
	finit

	push eax
	call atof
	add esp, 4
	fstp qword ptr x

	fld qword ptr x
	fstp qword ptr y

	fld qword ptr x
	fstp qword ptr a

	fld1
	fst qword ptr n


	
petla:
	fld1
	fld qword ptr n
	faddp

	fld qword ptr dwa
	fld qword ptr n
	faddp

	fmulp

	fld qword ptr a
	fld qword ptr x
	fld qword ptr x
	fmulp
	fmulp
	fdivrp
	fchs
	fst qword ptr a

	fld qword ptr y
	faddp
	fstp qword ptr y

	fld qword ptr dwa
	fld qword ptr n
	faddp
	fstp qword ptr n

	fld qword ptr a
	fabs
	fld qword ptr eps

	fcompp

	fstsw
	sahf
	jb petla

wypisz:
	fld qword ptr y
	sub esp, 8
	fstp qword ptr [esp]
	mov eax, offset messg
	push eax
	call printf
	add esp, 12
	mov eax, 0
	ret


	.data
	
x:	.double 1.0
a:	.double 0.0
y:	.double 0.0
n:	.double 0.0
eps:	.double 0.00001
messg:	.asciz "wynik=%f\n"
dwa:	.double 2.0

