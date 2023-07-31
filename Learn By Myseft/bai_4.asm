.Model SMALL
.Stack 100h
.Data
    Tb1 DB "Nhap 1 ki tu :$"
    Tb2 DB 13,10, "Chuyen sang ki tu hoa la : $"
    Char DB ?, '$'
.Code
Main PROC
    MOV AX, @DATA
    MOV DS,AX
    
    Lea dx, Tb1
    Mov ah,9
    int 21h
    
    Mov ah,1
    int 21h
    Sub al,20h
    Mov Char,al
    
    Lea dx,Tb2
    Mov ah,9
    int 21h
    
    Lea dx,Char
    Mov ah,9
    int 21h
    
    
    Mov ah,4ch
    int 21h

Main ENDP
END