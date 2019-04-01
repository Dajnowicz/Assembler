#include <stdio.h>

int main() {
int x1 = -1;
int x2 = 0, y;
asm volatile (
".intel_syntax noprefix;"
"mov eax, %1;"
"mov ebx, %2;"

"cmp eax,ebx;"
"jg skok1;"
"je skok2;"
"mov ecx, -1;"
"jmp koniec;"

"skok1:"
"mov ecx,1;"
"jmp koniec;"

"skok2:"
"mov ecx, 0;"
"jmp koniec;"

"koniec:"
"mov %0, ecx;"




".att_syntax prefix;"
:"=r" (y) 
:"r"(x1), "r"(x2)
:"eax", "ebx", "ecx"
);

printf("y = %i\n", y);
return 0;
}
