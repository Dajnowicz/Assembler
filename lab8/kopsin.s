//(sin(x)
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
	fstp qword ptr x // zapamietuje co jest na szczycie i usuwa

	fld qword ptr x //  ladowanie x na stack
	fstp qword ptr y  // zapamietuje y

	fld qword ptr x // x na stack
	fstp qword ptr a // zapietuje a

	fld1 // 1 na stos
	fst qword ptr n // n=1 i na stos


	
petla:
	fld1 // 1 na stos
	fld qword ptr n // n na stos
	faddp // n+1

	fld qword ptr dwa // 2 na stos
	fld qword ptr n // n na stos
	faddp // n+2

	fmulp //(n+1)*(n+2)

	fld qword ptr a //a
	fld qword ptr x // x
	fld qword ptr x //x
	fmulp //x*x
	fmulp // (x*x)*a
	fdivrp // (x*x)*a / (n+1)*(n+2)
	fchs // chnage sign * -1
	fst qword ptr a // zapamietuje to w a

	fld qword ptr y // laduje y na stack
	faddp // y+ (to co u gory)
	fstp qword ptr y // zapamietuje operacje powyzej w y

	fld qword ptr dwa // 2 na stack
	fld qword ptr n // n na stack
	faddp // n+2
	fstp qword ptr n // n= n+2

	fld qword ptr a // a na stack
	fabs // |a|
	fld qword ptr eps //eps na stack

	fcompp // |a| < eps

	fstsw
	sahf
	jb petla // skok jesli eps mnniejszy od a

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
//WYPISANIE WYNIKU

	.data
	
x:	.double 1.0
a:	.double 0.0
y:	.double 0.0
n:	.double 0.0
eps:	.double 0.00001
messg:	.asciz "wynik=%f\n"
dwa:	.double 2.0

