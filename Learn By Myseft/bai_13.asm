.model small
.stack 100h

.data
    message db 10, 13, 'Enter a number (0 to exit): $'
    sum_msg db 10, 13, 'Sum: $'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, message
    int 21h

    mov bx, 0   ; T?ng ban d?u l� 0
    jmp read_number

calculate_sum:
    add bx, ax  ; C?ng s? m?i nh?p v�o t?ng

read_number:
    mov ah, 1
    int 21h

    sub al, '0' ; Chuy?n d?i ASCII th�nh s?

    cmp al, 0   ; Ki?m tra n?u s? l� 0 (k?t th�c)
    je print_sum

    call calculate_sum
    jmp read_number

print_sum:
    ; Chuy?n t?ng th�nh chu?i ASCII
    add bx, '0' ; Chuy?n t?ng th�nh k� t? ASCII

    ; Hi?n th? th�ng b�o t?ng
    mov ah, 9
    lea dx, sum_msg
    int 21h

    ; In ra t?ng
    mov dl, bl  ; DL ch?a gi� tr? t?ng
    mov ah, 2
    int 21h

    mov ah, 4Ch
    int 21h

main endp

end main
