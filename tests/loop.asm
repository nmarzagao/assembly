global _start

section .text

_start:
    mov ebx, 1 ; start at 1
    mov ecx, 4 ; itarations

label:
    add ebx, 1
    dec ecx ; ecx--
    cmp ecx, 0
    jg label
    mov eax, 1
    int 0x80

; output 5