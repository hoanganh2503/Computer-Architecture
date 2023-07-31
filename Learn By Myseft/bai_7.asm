.model small
.stack 100
.data
    decimal_var db 5 dup('$') 
    endl db 10, 13, '$'
.code
main proc
    mov ax, @data
    mov ds, ax
                  
    mov ax, '#'
    push ax
               
    mov ah, 0ah
    lea dx, decimal_var; nhap string dau vao
    int 21h    
    
    mov cl, [decimal_var+1]; lay so ki tu cua chuoi
    lea si, decimal_var+2; tro den ki tu dau tien cua chuoi
    mov ax, 0;
    mov bx, 10; he so nhan
    
    decimal:
        mul bx;
        mov dl, [si]
        sub dl, '0'; chuyen ki tu ve dang so
        add ax, dx;
        inc si
        loop decimal  
        
        
    mov cl, 2  
    
    binary:
        mov ah, 0; phan du = 0
        div cl
        push ax
        cmp al, 0
        jne binary  
    
    mov ah, 9
    lea dx, endl
    int 21h   
    mov ah, 2; in ra ki tu
        
    print:
        pop dx
        cmp dx, '#'
        je done 
        mov dl, dh  
        add dl, '0'
        int 21h
        jmp print
    
    done: 
    
    
    mov ah, 4ch
    int 21h
endp
end
    