#include <stdio.h>

int main () {

	int x= 2018;
	int y=0;
	asm volatile (
	".intel_syntax noprefix;"		
	" mov eax,%1;"
	" add eax,eax;"
	" mov ebx,eax;"
	" add eax,eax;"
	" add eax,eax;"
	" add eax,ebx;"
	" mov %0, eax;"
	" .att_syntax prefix;"
	:"=r" (y)
	:"r" (x)
	:"eax"
	);
	printf("y = %i \n",y);
	

	return 0;
}
