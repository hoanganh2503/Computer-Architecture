.model small
.stack 100h

.data
    arr db 10 dup('$')
    arr_msg db 10, 13, 'Enter array: $'
    sum_msg db 10, 13, 'Sum: $'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Hi?n th? th�ng b�o nh?p m?ng
    mov ah, 9
    lea dx, arr_msg
    int 21h
    
    ; Nh?p m?ng
    mov cx, 10 ; �?t s? lu?ng ph?n t? l� 10
    lea di, arr ; Con tr? t?i m?ng
    
    input_loop:
        mov ah, 1
        int 21h
        
        sub al, '0' ; Chuy?n k� t? s? th�nh s?
        mov [di], al ; Luu s? v�o m?ng
        inc di
        
        loop input_loop
    
    ; T�nh t?ng c�c s? chia h?t cho 7
    xor ax, ax ; �?t t?ng ban d?u l� 0
    mov cx, 10 ; �?t s? lu?ng ph?n t? l� 10
    lea si, arr ; Con tr? t?i m?ng
    
    mov bx, 0 ; Kh?i t?o bi?n bx l� t?ng
    
    sum_loop:
        mov al, [si] ; L?y gi� tr? t? m?ng
        xor ah, ah
        div seven ; Chia cho 7
        
        cmp ah, 0 ; Ki?m tra ph?n du (chia h?t cho 7)
        je add_to_sum ; N?u ph?n du b?ng 0, th�m v�o t?ng
        
        inc si ; Chuy?n t?i ph?n t? ti?p theo
        loop sum_loop
    
    add_to_sum:
        add bx, ax ; C?ng s? v�o t?ng
        inc si ; Chuy?n t?i ph?n t? ti?p theo
        loop sum_loop
    
    ; In t?ng ra m�n h�nh
    mov ah, 9
    lea dx, sum_msg
    int 21h
    
    mov dl, ' ' ; In m?t kho?ng tr?ng tru?c t?ng
    int 21h
    
    ; Chuy?n t?ng t? s? sang chu?i v� in ra m�n h�nh
    mov ax, bx
    xor cx, cx ; �?t d?m ch? s? ban d?u l� 0
    
    convert_to_string:
        xor dx, dx
        div ten ; Chia cho 10
        add dl, '0' ; Chuy?n s? th�nh k� t?
        push dx ; �?y ch? s? v�o ngan x?p
        inc cx ; Tang d?m ch? s?
        
        cmp ax, 0 ; Ki?m tra n?u t?ng d� chia h?t
        jne convert_to_string
    
    print_loop:
        pop dx ; L?y ch? s? t? ngan x?p
        mov ah, 2 ; In k� t?
        int 21h
        
        loop print_loop
    
    exit_program:
    mov ah, 4Ch ; K?t th�c chuong tr�nh
    int 21h
    
main endp

; Kh?i t?o h?ng s?
seven db 7
ten db 10

end main
