SYS_EXIT    equ 1
SYS_READ    equ 3
SYS_WRITE   equ 4
STDIN       equ 0
STDOUT      equ 1

segment .data

    msg1 db "Enter a digit", 0xA, 0xD
    len1 equ $- msg1
    
    msg2 db "Please enter a second digit", 0xA,0xD 
    len2 equ $- msg2 
    
    msg3 db "The sum is: "
    len3 equ $- msg3

    newline db 0xA, 0xD
    lennewline equ $- newline

segment .bss

    num1 resb 2
    num2 resb 2
    res resb 1

section .text
    global _start

_start:

    ; Print msg1
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len1
    int 0x80

    ; Get num1
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num1
    mov edx, 2
    int 0x80

    ; Print msg2
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 0x80

    ; Get num2
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num2
    mov edx, 2
    int 0x80

    ; Print msg3
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, len3
    int 0x80

    ; Calculating
    mov eax, [num1]
    sub eax, '0' ; Convert to ASCII

    mov ebx, [num2]
    sub ebx, '0'

    add eax, ebx
    add eax, '0' ; Add '0' to convert the sum from decimal to ASCII

    mov [res], eax ; Storing sum in memory location res

    ; Print the sum
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, res
    mov edx, 1
    int 0x80

    ; Print \n
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, newline
    mov edx, lennewline
    int 0x80

    ; Exit
    mov eax, SYS_EXIT
    mov ebx, ebx
    int 0x80