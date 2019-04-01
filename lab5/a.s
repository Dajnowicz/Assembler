.intel_syntax noprefix
.global main
.text
main:
mov eax, offset msg
push eax
call printf
add esp,4

ret




.data
msg: .asciz "hello wolrd\n"
