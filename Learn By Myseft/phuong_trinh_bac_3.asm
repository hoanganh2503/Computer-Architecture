.model small
.stack 100
.data
    x dw ?  
    y dw ?   
    ans dw ?
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
    
    
    ;ans = a*x  
    mov ax, x
    mov cx, ax;luu gia tri cua x vao thanh ghi cx
    mov bx, 4
    mul bx
    mov ans, ax
    mov x, cx
              
    ;ans -= b | ans = ax-b
    sub ans, 3            
    
    
    
    ;asn *= x | ans = (ax-b)x
    mov ax, ans
    mov cx, ax; luu gia tri cua x vao thanh ghi cx
    mov bx, x
    mul bx
    mov ans, ax 
    
    ;ans -= c | ans = ax^2 - bx - c
    sub ans, 2   
    
    ;ans *= x | ans = ax^3 - bx^2 - cx
    mov ax, ans
    mov cx, ax; luu gia tri cua x vao thanh ghi cx
    mov bx, x
    mul bx
    mov ans, ax
         
    ;plus d | ans = ax^3 - bx^2 - cx + d
    add ans, 1
    
    
    

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