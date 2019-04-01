#include<stdio.h>
int main() {
char s[] = "";


asm volatile(
".intel_syntax noprefix;"
"mov ebx, %0;"
"xor ecx, ecx;"

"mov al, [ebx];"
"cmp al, 0;"
"je koniec;"


"ileZnakow:"
"mov al, [ebx];"
"cmp al,0;"
"je wezPierOsta;"
"inc ebx;"
"inc ecx;"
"jmp ileZnakow;"



"wezPierOsta:"
"mov ebx, %0;"
"mov esi, ebx;"
"add ebx, ecx;"
"mov edi, ebx;"
"dec edi;"


"zamieniaj:"
"mov al, [esi];"
"mov bl, [edi];"
"mov [esi], bl;"
"mov [edi], al;"
"inc esi;"
"dec edi;"
"cmp esi,edi;"
"js zamieniaj;"

"koniec:"


".att_syntax prefix;"
:
:"r" (s)
:"eax","ebx","ecx","esi","edi"
);
printf("y = %s  \n",s);

return 0;
}
