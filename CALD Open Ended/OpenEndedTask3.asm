.model small
.stack 100h
.data
    array1 dw 3, 2, 3, 6, 8
    array2 dw 5, 5, 8, 4, 2
    resultMsg db "Array values: $"

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Print result message
    lea dx, resultMsg
    mov ah, 09h
    int 21h

    ; Direct addressing - Display array1
    lea si, array1
    mov cx, 5
print_array1:
    mov ax, [si]
    call print_number
    add si, 2
    loop print_array1

    ; Indirect addressing - Display array2
    lea si, array2
    mov cx, 5
print_array2:
    mov ax, [si]
    call print_number
    add si, 2
    loop print_array2

    ; Exit program
    mov ah, 4Ch
    int 21h

print_number PROC
    ; Print number in AX
    push ax
    xor dx, dx
    mov bx, 10
    div bx
    add dl, '0'
    mov ah, 02h
    int 21h
    pop ax
    ret
print_number endp
main endp
END main
