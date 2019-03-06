#include <stdio.h>

int main () {

	int x= 2018;
	int y=0;
	asm volatile (
	".intel_syntax noprefix;"		
	" mov eax, %1;"
       	/* "mov ebx, 0;" */
	" xor ebx, ebx;"
	/* "mov ecx, ecx 0;" */
	"petla:" 
	" shl eax;"
	" jnc skok;"
	" add ebx,1;"

	"skok:"
	" cmp eax, 0;"
	" jnz petla;"
	" mov %0, ebx;"

	" .att_syntax prefix;"
	:"=r" (y)
	:"r" (x)
	:"eax", "ebx"
	);
	printf("y = %i \n",y);
	

	return 0;
}
