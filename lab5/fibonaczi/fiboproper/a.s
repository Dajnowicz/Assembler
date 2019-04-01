.intel_syntax noprefix
.global main
.text
main:
	//wezwanie tablicy	
	mov eax, [esp+8]
	//wezwanie argumentu
	mov eax, [eax+4]

	// eax na stos
	push eax
	// atoi do wczytamia liczby
	call atoi
 	// czyszcze stos
	add esp, 4

        //eax na stos
	push eax
	//jump do funkcji fibo

	call fibo
	add esp, 4

 	
	jmp wynik

fibo:
	mov eax, [esp+4]
	
	cmp eax, 2
	jg skok
	
	mov eax, 1
	ret

skok:
	dec eax
	push eax 
//wyrzucenie
	push eax 
//n-1
	call fibo
	add esp, 4
	pop ebx
//zdjecie 

	push eax 
//wynik n-1
	dec ebx
 //n-2
	push ebx 
//n-2
	call fibo
	add esp, 4
	pop ebx
 //zdjece n-1
	add eax, ebx
 //dodanie fib(n-1)+fib(n-2)
	ret
wynik:
    push eax
    push offset result
    call printf
    add esp, 8
	ret

.data
result:	.asciz "%d\n"	
