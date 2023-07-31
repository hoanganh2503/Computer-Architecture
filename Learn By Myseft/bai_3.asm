.model small
.stack 100
.data 
    input_message db 'please write another word: $';
    output_message db 13, 10, 'this is your message: $'; 
    parameter db 100 dup('$')

.code
main proc
     mov ax, @data
     mov ds, ax
     
     lea dx, input_message  
     mov ah, 9
     int 21h     
     
     mov ah, 0ah 
     lea dx, parameter
     int 21h  
                         
     mov ah, 9             
     lea dx, output_message   
     int 21h  
     
     lea dx, parameter + 2
     int 21h
     
     mov ah, 4ch
     int 21h


endp
end
