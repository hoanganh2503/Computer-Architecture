;dem do dai chuoi ki tu cho truoc
.Model Small
.Stack 100H
.Data 
    tb1 db "Xin chao tat ca moi nguoi$"
    tb2 db 13, 10, 10, "chieu dai chuoi cho truoc: $"
    
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
        cmp [si], '$'
        je Xuat
        inc si
        inc cx
        jmp Dem
    
    Xuat:
        lea dx, tb2
        mov ah, 9
        int 21h
       
        mov ax, cx ;so muon in so nao phai dua so do ve ax
        call Inso
                 
    mov ah, 4ch ;dung chuong trinh
    int 21h
    
Main Endp 

InSo Proc      
    
    mov cx, 0  ; su dung de in ra vs stack
    mov bx, 10 ;dung de chia 10
    Lap:
        mov dx, 0 ;so chi chia la dxax, minh chi can ax thoi, nen dx, 0
        div bx ;chia cho 10
        push dx
        inc cx
        
        cmp ax, 0 
        jg Lap  
        
    HienRa:
        pop dx
        add dl, '0'
        mov ah, 2
        int 21h
        loop Hienra
    ret
InSo Endp
    
END Main