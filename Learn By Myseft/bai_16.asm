
.model tiny
.stack 100h
.data
    tb1 db 'nhap so thu 1:$'
    tb2 db 13,10 ,'nhap so thu 2:$'
    tb3 db 13,10,'tong 2 so:$'
    so1 dw 0
    so2 dw 0
    tong dw 0
.code
main proc
        mov ax,@data
        mov ds,ax
        ;in thong bao nhap so thu nhat
        lea dx,tb1
        mov ah,9
        int 21h
    nhap1:
        mov ah,1                    
        int 21h
        cmp al,13 ;so sanh ky tu vua nhap voi 13
        je nhap2 ;neu bang nhap so thu 2
        sub al,30h ;doi ky tu sang so
        mov ah,0 ;xoa bit cao
        mov cx,ax ;cat so vua nhap vào cx
        mov ax,so1 ;dua bien so1 ve kieu byte de chuan bi nhann voi 10
        mov bx,10 ;gan bx =10
        mul bx ; nhan ax voi 10
        add ax,cx ;cong ket qua vua nhan voi so vua nhap ket qua cat vào ax
        mov so1,ax ; cat ket qua vao bien so1
        jmp nhap1
    nhap2:
        lea dx,tb2 ;hien thong bao nhap so thu 2
        mov ah,9
        int 21h
    nhap: 
        mov ah,1 ;nhap so thu 2
        int 21h
        cmp al,13 ;so sanh ky tu vua nhâp voi 13
        je tinhtong ;neu bang thi tinh tong
        sub al,30h ;chuyen ki tu sang dang so
        mov ah,0 ;xoa bit cao
        mov cx,ax ;cat ket qua vua nhap vào cx
        mov ax,so2 ;dua bien so 2 ve kieu byte
        mov bx,10 ;gan bx=10
        mul bx ;nhin ket qua vua nhap voi 10
        add ax,cx ;cong ket qua vua nhan voi so vua nhap
        mov so2,ax ;cat ket qua vào bien so 2
        jmp nhap
    tinhtong:
        mov dx,tong
        mov ax,so1 ;dua bien so 1 ra thanh ghi ax
        mov bx,so2 ;dua bien so 2 ra thanh ghi bx
        add ax,bx ;cong ax voi bx ket qua cat vao ax
        mov tong,ax ;dua ket qua tu ax vào bien tong
    inso: 
        mov ah,9 ;hien thong bao in tong
        lea dx,tb3
        int 21h
        mov ax,tong ;dua ket qua trong bien tong ra thanh ghi ax
        mov dx,0 ;xoa bit cao dx
        mov bx,10 ;gan bx=10
        mov cx,0 ;khoi tao bien dem
    chia: 
        div bx ;lay ket qua chia cho 10
        push dx ;du o dx day vao ngan xep
        inc cx ;tang bien dem
        cmp ax,0 ;so sanh thuong voi 0
        je hienkq ;neu bang thi hien ket qua
        xor dx,dx ;xoa bit cao trong dx
        jmp chia
    hienkq: 
        pop dx ;lay du trong ngan xep ra khoi dx
        add dl,30h ;chuyen so thành dang ky tu
        mov ah,2 ;in tong
        int 21h
        loop hienkq
    ra: 
        mov ah,4ch
        int 21h
Main endp
End main