.model small
.stack 100h
.data
    msg db "Enter a 32-bit integer: $"
    resultMsg db "You entered: $"
    input db 10 dup('$')

.code
main PROC
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Display prompt message
    lea dx, msg
    mov ah, 09h
    int 21h

    ; Input number
    lea dx, input
    mov ah, 0Ah
    int 21h

    ; Display the result
    lea dx, resultMsg
    mov ah, 09h
    int 21h

    ; Redisplay input
    lea dx, input + 1
    mov ah, 09h
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp
END main
