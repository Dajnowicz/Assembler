.intel_syntax noprefix
	.global main

	.text

main:
	finit

petla:
	fld QWORD PTR wynik
	fld QWORD PTR a
	faddp
	fstp QWORD PTR wynik

	fld QWORD PTR n
	fld QWORD PTR a
	fld QWORD PTR x
	fmulp
	fdivrp
	fstp QWORD PTR a

	fld QWORD PTR n
	fld1
	faddp
	fstp QWORD PTR n


	fld QWORD PTR a
	fld QWORD PTR dokladnosc
	fcompp
	fstsw
	sahf

	jb petla

	fld QWORD PTR wynik
	sub esp, 8
	fstp QWORD PTR [esp]

	mov eax, offset mesg
	push eax
	call printf
	add esp, 12

	mov eax, 0
	ret



	.data
mesg:	.asciz "Wynik to %.10f\n"
n:	.double 1.0
a:	.double 1.0
wynik:	.double 0.0
x:      .double 1.0
dokladnosc: .double 0.000000001

