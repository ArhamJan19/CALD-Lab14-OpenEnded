.model small
.stack 100h
.data
    newline db 0Dh, 0Ah, '$'

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Initialize loop counter
    mov cx, 9
    mov ax, 1

print_loop:
    call print_number
    add ax, 1
    loop print_loop

    ; Print newline
    lea dx, newline
    mov ah, 09h
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h

print_number proc
    ; Print single-digit number
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h
    sub al, '0'
    ret
print_number endp
main endp
END main
