.intel_syntax noprefix
.text
.global main

main:
	mov eax, offset messg
	push eax
	call policz
	add esp, 4
	//wynik
	push eax
	mov eax, offset printf_arg1
	push eax
	call printf
	add esp, 8
exit:
	// kod powrotu z programui
	mov eax, 0
	ret
policz:
	start:
		mov ebx, eax
		mov ch, 0
		je finish
		jmp isV
	inc:
		inc edx
		inc ebx
		mov ch, [ebx]	
	isV:
		cmp ch, 65 // A
		je inc
		cmp ch, 97 // a
		je inc
		cmp ch, 69 //E
		je inc
		cmp ch, 101 //e
		je inc
		cmp ch, 73 //I
		je inc
		cmp ch, 105 //i
		je inc
		cmp ch, 79 // O
		je inc
		cmp ch, 111 //o
		je inc
		cmp ch, 85 // U
		je inc
		cmp ch, 117 // u
		je inc
		jmp NotV
	notV:
		inc eax
		mov ebx, eax
		mov ch, [ebx]
		cmp ch, 0
		je finish
	finish:
		inc ebx
		mov ch, 0
		mov [ebx], ch
		ret

	.data
messg:
	.asciz "PRZYkladowy teKst zAdaniA"
printf_arg1:
	.asciz "%i"

