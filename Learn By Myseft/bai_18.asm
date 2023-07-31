;dem so lan xuat hien xau con ktmt trong 1 xau 
.Model Small
.Stack 100H
.Data 
    tb1 db "Nhap xau vao day: $"
    tb2 db "So lan xuat hien xau con 'ktmt' trong xau vua nhap: $" 
    xuongdong db 13, 10, 10, '$'
    str db 100 dup('$')
    str2 db 'ktmt$'
    x dw ? ;bien dem
    
.Code
Main Proc
    mov ax, @data
    mov ds, ax 
    
    lea dx, tb1 ;in ra tb1
    mov ah, 9
    int 21h 
    
    
    lea si, str  ;muon lam gi thi cx phai tro den xau do truoc 
    mov cx, 0
    NhapXau:
        mov ah, 1
        int 21h
        
        cmp al, 13 ;13 la enter
        je ThucHien
        
        mov [si], al
        inc si
        
        jmp NhapXau
    
    ThucHien:      ;dem so lan xuat hien
        lea si, str
        lapI: 
            cmp [si], '$' ;i<str.length
            je Xong
            
            mov bx, si ;pos=1
            lea di, str2
            lapJ:
                cmp [di], '$'
                je Co
                mov al, [bx]
                cmp [di], al
                jne Khong 
                inc di
                inc bx
                jmp LapJ
            Co:
                inc cx
            Khong:
                inc si
                jmp LapI  
   Xong:             
        
        mov ax, cx
        
        call endl
        call endl
        
        push ax ;bao ve gia tri ax hien tai
        push dx ; bao ve gia tri dx hien tai
        
        lea dx, tb2
        mov ah, 9
        int 21h
               
        pop dx
        pop ax
        
        call InSo
               
        mov ah, 4ch
        int 21h  
    
Main Endp
endl Proc 
    push ax
    push dx
    
    mov ah, 9
    lea dx, xuongdong
    int 21h
    
    pop dx
    pop ax
    ret
endl Endp

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