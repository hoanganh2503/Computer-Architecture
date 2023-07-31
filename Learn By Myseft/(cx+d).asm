.model small
.stack 100
.data
    x dw ?  
    ts dw ?   
    ms dw ? 
    ans dw ? 
    a dw 1
    d dw 2
    input_message db "Please enter x: $"
    output_message db 10, 13, "This is your anser: $"
    endl db 10, 13, "$"

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, input_message
    int 21h
    
    ; enter x
    mov ah, 1
    int 21h  
    sub al, '0'
    xor ah, ah  
    mov x, ax   
    
    
    ;ts = a*x = c*x  
    mov ax, x
    mov cx, ax;luu gia tri cua x vao thanh ghi cx
    mov bx, 1
    mul bx
    mov ts, ax
    mov x, cx
              
    ;ts += b | ts = ax+b 
    mov ax, ts
    mov cx, ax; gan ax la bien nho tam cua ts, cx la bien nho tam cua ms
    add ax, d ; ax + b
    sub cx, d ; cx - d
    mov ts, ax 
    mov ms, cx           
               
    ; ts/ms
    mov ax, ts
    mov bx, ms
    div bx ; thuc hien phep chia, phan nguyen o thanh ghi ax
    mov ans, ax
 
    
    

    mov ax, ans
    mov cx, 0
    mov bx, 10
    loop1:
        mov dx, 0
        xor ah, ah
        div bx
        push dx
        inc cx
        cmp ax, 0
        jne loop1   
         
    
    mov ah, 9
    lea dx, output_message
    int 21h  
    
    mov ah, 2 
    loop2:
        pop dx
        add dl, '0'
        int 21h   
        dec cx
        cmp cx, 0
        jne loop2
              


    mov ah, 4ch 
    int 21h
endp      
              
end