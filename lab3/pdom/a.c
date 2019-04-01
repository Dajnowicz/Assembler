/*znajdz najdluzszy ciag 1 */

#include <stdio.h>

int main () {

	int x = -1, y;
	asm volatile(
	".intel_syntax noprefix;"
	"mov eax, %1;"
	"mov ebx, 33;"
	"mov ecx, 0;"
	

	"poczatek:"
	"xor edx, edx;"
	"dec ebx;"
	"jz wynik;"
	
	
	"porownanie:"
	"shl eax, 1;"	
	"jnc poczatek;"

	"inc edx;"
	"cmp edx, ecx;"
	"ja zwiekszenie;"
	"jmp porownanie;"
	
	"zwiekszenie:"
	"mov ecx, edx;"
	"jmp porownanie;"

	"wynik:"
	"mov %0, ecx;"

	".att_syntax prefix;"
	:"=r" (y)
	:"r" (x)
	:"eax", "ebx", "ecx", "edx"
	);
	printf("Najdluższy ciąg jedynek w liczbie %d równy jest %d  \n", x,y);

	return 0;
}
