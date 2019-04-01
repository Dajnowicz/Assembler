.intel_syntax noprefix
.global main
.text

main:
        mov eax, [esp+8]
        mov eax, [eax+4]
        xor ebx, ebx
        xor ecx, ecx

        call pattern

        push eax
        push offset messg
        call printf
        add esp,8

        ret

pattern:

        start:
                mov ebx, eax
                mov ch, [ebx]
                cmp ch, 0
                je finish
                jmp isAB
		
        zeruj:
                inc eax
                mov ebx, eax
                mov ch, [ebx]
                cmp ch, 0
                je finish
		
        isAB:
                cmp ch, 97
                je notABC
                cmp ch, 98
                je notABC
                jmp zeruj

	notABC:
                inc ebx
                mov ch, [ebx]
                cmp ch, 97
                je zeruj
                cmp ch, 98
                je zeruj
                cmp ch, 99
                je zeruj
                jmp  isC

        isC:
                inc ebx
		mov ch, [ebx]
                cmp ch, 99
                je finish
                cmp ch, 97
                je zeruj
                cmp ch, 98
                je zeruj
                jmp isC          
			
	finish:
                inc ebx
                mov ch, 0
                mov [ebx], ch
                ret


.data
                messg: .asciz "Wynik = %s\n"



