.Model Small
.Stack 100H
.Data 
    tb1 db "Nhap vao 1 ki tu: $"
    tb2 db 13, 10, 10, "Ki tu vua nhap: $"  
    KyTu db ?
.Code
Main Proc
    mov ax, @data
    mov ds, ax 
               
    lea dx, tb1
    mov ah, 9
    int 21h
    
    mov ah, 1 ;ki tu vua nhap dc luu vao al
    int 21h
    mov KyTu, al
            
    lea dx, tb2  ; in ra thong bao 2
    mov ah, 9
    int 21h
    
    mov dl, Kytu
    mov ah, 2
    int 21h    
    
    mov ah, 4ch
    int 21h
     
Main Endp
END Main