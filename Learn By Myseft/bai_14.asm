; UCLN, BCNN
.Model Small
.Stack 100H
.Data 
    tb1 db "Nhap vao so thu 1: $"
    tb2 db "Nhap vao so thu 2: $"
    tb3 db "UCLN cua 2 so la: $"
    tb4 db "BCNN khac 0 cua 2 so la: $"  
    xuongdong db 13, 10, 10, '$'
    x dw ? ;nhap so va in ra
    y dw ?
    tmp dw ? 
    a dw ?
    b dw ?
    c dw ?
    
    
.Code
Main Proc
    mov ax, @data
    mov ds, ax 
    
    lea dx, tb1 ;in ra tb1
    mov ah, 9
    int 21h
    
    call NhapSo  ;kq duoc luu vao ax
    mov tmp, ax ;bien tmp de luu gia tri so thu 1 khi nhap, so thu 1 se dc luu thanh bx 
    mov a, ax
    call endl
    
    lea dx, tb2
    mov ah, 9
    int 21h
    
    call NhapSo  ; kq dc luu so vua nhap dc luu tai ax
    mov b, ax 
    call endl 
    
    mov bx, tmp ;trong qua trinh NhapSo thi bx se bi thay doi, nen o day moi dc gan gia tri bx=tmp 
    UCLN:
    cmp ax, 0
    je ThucHien3
    cmp bx, 0
    je ThucHien3
    LapTinh:
        cmp ax, bx
        je Xong
        jg ThucHien1
        jl ThucHien2
    ThucHien1:
        sub ax, bx
        jmp LapTinh
    ThucHien2:
        sub bx, ax
        jmp LapTinh
    ThucHien3:
        add ax, bx
        jmp Xong
    Xong:
        call TbUCLN 
        call InSo
        call endl
    
    BCNN:
        mov c, ax ;c luu gia tri UCLN
        mov bx, b
        mov ax, a
        mul bx  ; ax=ax*bx=a*b
        
        mov dx, 0
        div c     ;nguyen luu o ax, ax=ax/c=a*b/c
        call TbBCNN
        call InSo
               
    
    mov ah, 4ch ;dung chuong trinh
    int 21h
    
Main Endp
TbUCLN Proc 
    push ax
    push dx 
      
    lea dx, tb3
    mov ah, 9
    int 21h 
    
    pop dx
    pop ax
    
    ret
TbUCLN Endp

TbBCNN Proc 
    push ax
    push dx 
      
    lea dx, tb4
    mov ah, 9
    int 21h
    
    pop dx
    pop ax
    ret
TbBCNN Endp

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
NhapSo Proc
    mov x, 0  ;luu kq o buoc hien tai, tuong tu nhu bien res
    mov y, 0  ; y luu gia tri so cua ki tu vua nhap
    mov bx, 10
    nhap: 
        mov ah, 1   ; nhap vao 1 ki tu so
        int 21h
        
        cmp al, 13 ;so sanh vs ki tu xuong dong, ktr xem nhap xong chua
        je nhapXong
        
        sub al, '0'    ;de luu gia tri so cua no thoi
        mov ah, 0
        mov y, ax ; do y la bien 16 bit
        
        mov ax, x ;chi ax moi dc nhan, nen phai nho ax nhan ho ax=x
        mul bx ; ax=ax*bx (bx=10)
        add ax, y  ; ax=ax+y
        
        mov x, ax ;kq hien tai lai luu vao x
        jmp nhap
    nhapXong:
        mov ax, x   
    ret
NhapSo Endp

InSo Proc 
    push ax
    push bx
    push cx
    push dx     
    
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
    pop dx
    pop cx
    pop bx
    pop ax     
    ret
InSo Endp
    
END Main