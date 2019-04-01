//cos(x)
.intel_syntax noprefix
	.text
	.global main
main:
	mov eax, [esp+8]
	mov eax, [eax+4]
	finit

push eax
	call atof
	add	esp, 4 # clear stack

	fstp QWORD PTR x
petla:
	
	fld1
	fld qword ptr n
	faddp # (n+1)

	fld1
	fld1
	faddp # (2)
	fld qword ptr n
	faddp # (n+2)

	fmulp # (n+1)*(n+2)
	
	fld qword ptr a

	fld qword ptr x
	fld qword ptr x
	fmulp # (x*x)
	fmulp # a * (x*x)
	fdivrp # a * (x*x) / (n+1)*(n+2)
	fchs # *-1
	fst qword ptr a

	
	fld qword ptr y
	faddp
	fstp qword ptr y
	
	fld qword ptr n
	fld1
	fld1
	faddp
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
	sub esp,8
	fstp qword ptr [esp]
	mov eax, offset messg
	push eax
	call printf
	add esp,12
	
	mov eax,0
	ret
	
.data
x: .double 1.0
a: .double 1.0
n: .double 0.0
y: .double 1.0
eps: .double 0.0000001
messg: .asciz "wynik %lf\n"

