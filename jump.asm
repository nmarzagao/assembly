global _start

section .text

_start:
    mov ecx, 101
    mov ebx, 42
    mov eax, 1
    cmp ecx, 100 ; compare ecx with 100
    jl skip ; jump if less then to skip
    mov ebx, 13 ; not executed if jmp works
    int 0x80

skip:
    int 0x80

jumpss:
    je A, B ; jump if equal
    jne A, B ; jump if not equal
    jg A, B ; jump if grater
    jge A, B ; jump if grater or equal
    jl A, B ; jump if less
    jle A, B ; jump if less or equal

    jmp label ; jump to label