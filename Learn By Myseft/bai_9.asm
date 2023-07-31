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

    ; Hi?n th? thông báo nh?p s? nh? phân
    mov ah, 9
    lea dx, input_msg
    int 21h

    ; Kh?i t?o các bi?n và thanh ghi
    mov cx, 8  ; Ð?t s? lu?ng bit là 8
    mov bl, 0  ; Kh?i t?o thanh ghi BL là 0

    input_loop:
        ; Nh?p m?t ký t? t? ngu?i dùng
        mov ah, 1
        int 21h

        cmp al, '0'  ; Ki?m tra n?u ký t? là '0'
        je process_bit0
        cmp al, '1'  ; Ki?m tra n?u ký t? là '1'
        je process_bit1
        cmp al, '#'  ; Ki?m tra n?u ký t? là '#'
        je end_input

        ; Hi?n th? thông báo ký t? không h?p l?
        mov ah, 9
        lea dx, invalid_msg
        int 21h
        jmp input_loop

    process_bit0:
        shl bl, 1  ; D?ch trái thanh ghi BL
        jmp increment_bh

    process_bit1:
        shl bl, 1  ; D?ch trái thanh ghi BL
        or bl, 1   ; Ð?t bit cu?i cùng c?a BL là 1

    increment_bh:
        dec cx  ; Gi?m d?m s? lu?ng bit còn l?i

        cmp cx, 0  ; Ki?m tra n?u dã nh?p d? 8 bit
        jz end_input

        jmp input_loop

    end_input:
        ; Hi?n th? thông báo s? h? th?p l?c phân
        mov ah, 9
        lea dx, hex_msg
        int 21h

        ; Chuy?n d?i s? t? nh? phân sang h? th?p l?c phân và in ra màn hình
        mov cx, 2  ; Ð?t s? lu?ng ch? s? hex là 2

        convert_to_hex:
            rol bl, 4  ; D?ch trái thanh ghi BL 4 bit
            mov dl, bl  ; Luu giá tr? c?a thanh ghi BL vào DL
            and dl, 0Fh  ; L?y 4 bit cu?i cùng c?a DL

            ; L?y ch? s? hex t? b?ng hex_digits
            les di, hex_digits
            add di, dx
            mov al, [di]

            cmp al, '9'  ; Ki?m tra n?u là ch? s? t? 0-9
            jbe print_digit
            add al, 7  ; Chuy?n ch? cái t? A-F

            print_digit:
                mov ah, 2  ; G?i hàm 2 d? in s?
                int 21h

            dec cx  ; Gi?m d?m s? lu?ng ch? s? còn l?i
            jnz convert_to_hex

    exit_program:
        mov ah, 4Ch  ; K?t thúc chuong trình
        int 21h

main endp

end main
