.intel_syntax noprefix
.global main
.text

main:
     
        mov ecx, [esp+8]
	mov ecx, [ecx+4]
        // ecx na stos
	push ecx
        // wzywam funkcje do pobrania
	call atoi
        // ecx <- eax
	mov ecx, eax
        // czyszcze wierzcholek stosu
	add esp, 4
        // zeruje eax
	xor eax, eax
        // jesli ecx zero koncz
	jecxz fibonacci_end
  	// edx <- eax
	mov edx, eax
	//pomniejszaj ecx
	dec ecx
        // zwiekszaj eax
	inc eax
        // jesli ecx zero koncz
	jecxz fibonacci_end
fibonacci_loop:
        //wymien polowa zawartosci z drugim
	xchg eax, edx
        //dodaj edx do eax
	add eax, edx

	loop fibonacci_loop
fibonacci_end:
    // number dostaje eax
    mov number, eax
    // number na stos
    push number
    // result na stos
    push offset result
    call printf
    add esp, 8
	ret

.data
number: .int 0
result: .asciz "%d\n"
