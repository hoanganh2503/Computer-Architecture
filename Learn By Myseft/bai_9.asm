                              .model small
.stack 100h

.data
    input_msg db 10, 13, 'Enter a binary number (8 bits): $'
    invalid_msg db 10, 13, 'Invalid input! Please enter a valid binary number (0 or 1): $'
    hex_msg db 10, 13, 'Hexadecimal: $'
    hex_digits db '0123456789ABCDEF'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Hi?n th? th�ng b�o nh?p s? nh? ph�n
    mov ah, 9
    lea dx, input_msg
    int 21h

    ; Kh?i t?o c�c bi?n v� thanh ghi
    mov cx, 8  ; �?t s? lu?ng bit l� 8
    mov bl, 0  ; Kh?i t?o thanh ghi BL l� 0

    input_loop:
        ; Nh?p m?t k� t? t? ngu?i d�ng
        mov ah, 1
        int 21h

        cmp al, '0'  ; Ki?m tra n?u k� t? l� '0'
        je process_bit0
        cmp al, '1'  ; Ki?m tra n?u k� t? l� '1'
        je process_bit1
        cmp al, '#'  ; Ki?m tra n?u k� t? l� '#'
        je end_input

        ; Hi?n th? th�ng b�o k� t? kh�ng h?p l?
        mov ah, 9
        lea dx, invalid_msg
        int 21h
        jmp input_loop

    process_bit0:
        shl bl, 1  ; D?ch tr�i thanh ghi BL
        jmp increment_bh

    process_bit1:
        shl bl, 1  ; D?ch tr�i thanh ghi BL
        or bl, 1   ; �?t bit cu?i c�ng c?a BL l� 1

    increment_bh:
        dec cx  ; Gi?m d?m s? lu?ng bit c�n l?i

        cmp cx, 0  ; Ki?m tra n?u d� nh?p d? 8 bit
        jz end_input

        jmp input_loop

    end_input:
        ; Hi?n th? th�ng b�o s? h? th?p l?c ph�n
        mov ah, 9
        lea dx, hex_msg
        int 21h

        ; Chuy?n d?i s? t? nh? ph�n sang h? th?p l?c ph�n v� in ra m�n h�nh
        mov cx, 2  ; �?t s? lu?ng ch? s? hex l� 2

        convert_to_hex:
            rol bl, 4  ; D?ch tr�i thanh ghi BL 4 bit
            mov dl, bl  ; Luu gi� tr? c?a thanh ghi BL v�o DL
            and dl, 0Fh  ; L?y 4 bit cu?i c�ng c?a DL

            ; L?y ch? s? hex t? b?ng hex_digits
            les di, hex_digits
            add di, dx
            mov al, [di]

            cmp al, '9'  ; Ki?m tra n?u l� ch? s? t? 0-9
            jbe print_digit
            add al, 7  ; Chuy?n ch? c�i t? A-F

            print_digit:
                mov ah, 2  ; G?i h�m 2 d? in s?
                int 21h

            dec cx  ; Gi?m d?m s? lu?ng ch? s? c�n l?i
            jnz convert_to_hex

    exit_program:
        mov ah, 4Ch  ; K?t th�c chuong tr�nh
        int 21h

main endp

end main
