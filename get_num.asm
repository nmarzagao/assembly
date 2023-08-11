section .data
    userMsg db "Please enter a number: "
    lenUserMsg equ $ - userMsg
    displayMsg db "You have entered: "
    lenDisplayMsg equ $ - displayMsg

section .bss
    num resb 5

section .text
    global _start

_start:
    ; print
    mov eax, 4
    mov ebx, 1
    mov ecx, userMsg
    mov edx, lenUserMsg
    int 0x80

    ; get value
    mov eax, 3
    mov ebx, 2
    mov ecx, num
    mov edx, 6 ; 6 bytes
    int 0x80

    ; print
    mov eax, 4
    mov ebx, 1
    mov ecx, displayMsg
    mov edx, lenDisplayMsg
    int 0x80

    ; print entered value
    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 6 ; 6 bytes, 5 for num, 1 for \n
    int 0x80

    ; print \n
    mov eax, 4
    mov ebx, 1
    mov ecx, 0x0a
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80