.model small
.stack
.data  
    max db 'max: $'
    min db 'min: $'; 
    endl db 10, 13, '$';
    list db 8, 9, 7, 6, 5, 4, 3, 2, 1
    
.code
main proc
     mov ax, @data
     mov ds, ax
     mov cx, 8;// khoi tao bien dem bang so phan tu cua mang
     lea si, list; dua dia chi dau tien cua chuoi vao si
     mov bl, [si]; dua gia tri si vao trong bl  
     mov bh, [si]
     inc si
     
start:
     lodsb   ; tu dong lap
     cmp bl, al; so sanh al va bl
     jge next1; neu bl > al nhay sang next
     mov bl, al;
     next1: 
        cmp bh, al; so sanh al va bl  
        jle next2 
        mov bh, al; 
     next2:
        loop start 
     
     mov ah, 9
     lea dx, max
     int 21h
        
     add bh, '0'; ep kieu   
     add bl, '0';
     
     mov ah, 9
     lea dl, bl;
     mov ah, 2
     int 21h  
               
     mov ah, 9
     lea dx, endl
     int 21h  
     
     mov ah, 9
     lea dx, min
     int 21h
        
     
     mov ah, 9
     lea dl, bh;
     mov ah, 2
     int 21h
      
     mov ah, 4ch
     int 21h
main endp
end