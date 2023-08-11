global _start

section .data
    num db 4

section .text

_start:
    mov eax, 4 ; sys write
    mov ebx, 1 ; stdout
    mov ecx, num ; pointer
    mov edx, 1 ; string size
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80