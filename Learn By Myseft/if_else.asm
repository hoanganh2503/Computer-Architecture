.model small
.stack 100
.data
    x dw 5 dup('$')  
    ts dw ?   
    ms dw ? 
    ans dw ? 
    b dw 20
    d dw 10  
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
    mov ah, 0ah             
    lea dx, x    
    int 21h
    
    mov ax, x+2
    cmp ax, '-' 
    je handle2
    
    jmp handle1
    
    handle2:
        mov ax, b 
        sub ax, d   
        mov ans, ax   
        jmp print
   
     
    handle1:
        mov ax, b 
        add ax, d   
        mov ans, ax
         
    print: 
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