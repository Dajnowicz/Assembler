.intel_syntax noprefix
.global main
.text
 
main:
	
        mov eax, [esp+8]
        mov eax, [eax+4]
        push eax
        call atoi
        add esp,4
        call fib
 	call wynik 
fib:
	
        cmp eax, 2
        jg skok
 
        mov eax, 1
        ret
 
skok:
	
        dec eax
        push eax
        call fib
        pop ebx
        push eax
        dec ebx
        mov eax, ebx
        call fib
        pop ebx
        add eax, ebx
        ret

wynik:

	push eax
	push offset messg
	call printf
	add esp, 8

	xor ebx, ebx
	ret 
.data
        messg: .asciz "Wynik = %i\n"
