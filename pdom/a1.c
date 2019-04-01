#include <stdio.h>
 
int main() {
    int x = 13, y;
    asm volatile(
        ".intel_syntax noprefix;"
        "mov eax, %1;" 
        "mov ebx, 33;" 
        "xor ecx, ecx;" 
        "xor edx, edx;"
 
        "poczatek:"
        "dec ebx;"
        "jz wynik;"
	

        "mov ecx, eax;" 
        "shl eax, 1;" 
        "shr ecx, 29;" 
        "cmp ecx, 5;" 
        "je zwieksz;" 
        "jmp poczatek;" 
 
        "zwieksz:"
        "inc edx;"
        "jmp poczatek;"
 	

        "wynik:"
        "mov %0, edx;"
	

        ".att_syntax prefix;"
        :"=r"(y) /* %0 */
        :"r"(x) /* %1 */
        :"eax", "ebx", "ecx", "edx"
        );
    printf("Wzor '101' w liczbie %d znajdziemy %d razy \n", x,y);
 
 
    return 0;
}
