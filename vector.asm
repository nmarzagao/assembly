global _start
section .data
    addr db "yellow"

section .text

_start:
    mov [addr], byte 'Y' ; byte representation of 'Y'
    mov [addr+6], byte '!'
    mov [addr+7], byte 0x0a

    mov eax, 4 ; sys write
    mov ebx, 1 ; stdout
    mov ecx, addr ; pointer
    mov edx, 8 ; string size
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80