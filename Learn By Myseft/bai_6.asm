
.Model Small
.Stack 100H
.Data 
    tb1 db "nhap 1 chuoi vao day: $"
    tb2 db 13, 10, 10,"chuoi dao nguoc cua chuoi tren: $"
    str dw 50 dup($)
    
.Code
Main Proc
    mov ax, @data
    mov ds, ax 
    
    lea dx, tb1 ;in ra tb1
    mov ah, 9
    int 21h
    
    mov cx, 0
    lea si, tb1
    Dem:
        mov ah, 1 ;nhap 1 ki tu, ki tu dc luu trong al
        int 21h
        cmp al, '#'
        je HienThi
        mov [si], al
        push [si]
        inc si
        inc cx
        jmp Dem
    
    HienThi:
        lea dx, tb2
        mov ah, 9
        int 21h  
    Xuat:
        pop dx 
        mov ah, 2
        int 21h 
        loop Xuat
                 
    mov ah, 4ch ;dung chuong trinh
    int 21h
    
Main Endp
END Main