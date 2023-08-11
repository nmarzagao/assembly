section .data
    userMsg db "Please enter your name: "
    lenUserMsg equ $ - userMsg
    
    ; Nice to meet you Nicolas
    helloMsg db "Nice to meet you "
    lenHelloMsg equ $ - helloMsg

    exitMsg db "Any more names? 1- yes 2- no", 0x0a
    lenExitMsg equ $ - exitMsg

section .bss
    name resb 20
    aws resb 1

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, userMsg
    mov edx, lenUserMsg
    int 0x80

    mov eax, 3
    mov ebx, 2
    mov ecx, name
    mov edx, 20
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, helloMsg
    mov edx, lenHelloMsg
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, name
    mov edx, 20
    int 0x80

    jmp question


question:
    mov eax, 4
    mov ebx, 1
    mov ecx, exitMsg
    mov edx, lenExitMsg
    int 0x80

    mov eax, 3
    mov ebx, 2
    mov ecx, aws
    mov edx, 1
    int 0x80

    ; not working
    mov al, byte [aws]
    cmp al, 1
    je _start
    jne exit

exit:
    mov eax, 1
    mov ebx, 0
    int 0x80

