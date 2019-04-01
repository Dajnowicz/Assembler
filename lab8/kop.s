.intel_syntax noprefix
        .text
        .global main

main:
        finit
        fld1
        fld qword ptr x
        faddp
        fstp qword ptr y

        fld qword ptr x
        fstp qword ptr a

        fld1
        fstp qword ptr n

        mov ecx, 1000

petla:
        fld1
        fld qword ptr n
        faddp
        fld qword ptr a
        fld qword ptr x
        fmulp
        fdivrp
        fst qword ptr a
        fld qword ptr y
        faddp
        fstp qword ptr y

        fld qword ptr n
        fld1
        faddp
        fstp qword ptr n

        dec ecx
        jnz petla

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
    x:      .double 1.0
    a:      .double 0.0
    n:      .double 0.0
    y:      .double 0.0
    eps:    .double 0.0001
    messg:  .asciz "wynik=%f\n"

