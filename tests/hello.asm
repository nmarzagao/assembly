global _start

section .data
    msg db "Hello, World", 0x0a ; code for \n
    len equ $ - msg ; get length of msg

section .text

_start:
    mov eax, 4 ; system write call
    mov ebx, 1 ; stdout file discriptor
    mov ecx, msg ; string pointer
    mov edx, len
    int 0x80 ; perform system call

    mov eax, 1 ; exit system call
    mov ebx, 0 ; exit status
    int 0x80
    
    