.intel_syntax noprefix
.global main
.text

main:
    push offset number
    push offset format
    call scanf

    mov eax, number
    shl eax
    mov number, eax

    push number
    push offset result
    call printf

    call exit
.data
number: .long 0
format: .asciz "%d"
    result: .asciz "%d\n"
