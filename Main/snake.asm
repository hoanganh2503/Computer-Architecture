.model small
.stack 100h

.data
    jump_height dw 4   ; Chiều cao nhảy
    player_x dw 10     ; Vị trí ban đầu của nhân vật
    player_y dw 20
    player_char db 'A'

.code
main proc
    mov ax, @data      ; Khởi tạo DS
    mov ds, ax

    call print_X

    ; Thoát chương trình
    mov ah, 4Ch
    int 21h
main endp

print_X proc
    mov ah, 9
    lea dx, player_char
    int 21h
    ret
print_X endp
end


