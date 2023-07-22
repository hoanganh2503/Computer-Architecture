.model small
.stack 100
.data
	seed   dw 13666
	two    dw 2
	ten    dw 10
	fifty  dw 50
	file_name    DB "high.txt",0             
	file_handler DW ?
	input_name        LABEL BYTE  			;nhap ten nguoi choi khi ket thuc
	input_name_max    DB    11				; gioi han do dai ten
	input_name_act    DB    ?				;mau cua ten
	high_score_player DB    11 DUP(' ')		; khởi tạo mảng tên người chơi
    check_distance dw ?
	front_screen_page_number db 0			; hiển thị các nội dung đồ họa chính
	back_screen_page_number db 1			; hiển thị các nội dung đồ họa tạm thời và các hiệu ứng động
	char_for_print_as_ascii db ?			; số điểm
	row_for_print_as_ascii db ?
	col_for_print_as_ascii db ?
	;t_rex, cactus image
	t_rex_image_1   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h ; 20x23
                    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h ; 20x23
                    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch ; 20x23   
                    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch ; 20x23   
                    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch ; 20x23   
                    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch ; 20x23   
                    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h,00h ; 20x23
                    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h ; 20x23   
                    db 00h,00h,0Ch,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h,00h,00h ; 20x23   
                    db 00h,00h,0Ch,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h,00h,00h ; 20x23   
                    db 00h,00h,0Ch,00h,00h,00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h,00h,00h ; 20x23   
                    db 00h,00h,0Ch,0Ch,00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h ; 20x23   
                    db 00h,00h,0Ch,0Ch,0Ch,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,0Ch,00h,00h,00h,00h ; 20x23   
                    db 00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h,00h,00h ; 20x23   
                    db 00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h,00h,00h ; 20x23   
                    db 00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h,00h,00h,00h ; 20x23   
                    db 00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h,00h,00h,00h,00h ; 20x23   
                    db 00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h ; 20x23   
                    db 00h,00h,00h,00h,00h,0Ch,0Ch,0Ch,00h,0Ch,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h ; 20x23   
                    db 00h,00h,00h,00h,00h,0Ch,0Ch,00h,00h,00h,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h ; 20x23      
                    db 00h,00h,00h,00h,00h,0Ch,00h,00h,00h,00h,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h ; 20x23        
                    db 00h,00h,00h,00h,00h,0Ch,0Ch,00h,00h,00h,0Ch,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h ; 20x23


    cactus_image    db 00h,1Ch,00h,1Ch,1Ch,00h,00h,00h,00h
					db 1Ch,1Ch,00h,1Ch,1Ch,00h,00h,00h,00h
					db 1Ch,1Ch,00h,1Ch,1Ch,00h,00h,00h,00h
					db 1Ch,1Ch,00h,1Ch,1Ch,00h,00h,00h,00h
					db 1Ch,1Ch,00h,1Ch,1Ch,00h,00h,00h,00h
					db 1Ch,1Ch,00h,1Ch,1Ch,00h,00h,1Ch,1Ch
					db 1Ch,1Ch,1Ch,1Ch,1Ch,00h,00h,1Ch,1Ch
					db 00h,1Ch,1Ch,1Ch,1Ch,00h,00h,1Ch,1Ch
					db 00h,00h,00h,1Ch,1Ch,00h,00h,1Ch,1Ch
					db 00h,00h,00h,1Ch,1Ch,00h,00h,1Ch,1Ch
					db 00h,00h,00h,1Ch,1Ch,1Ch,1Ch,1Ch,1Ch
					db 00h,00h,00h,1Ch,1Ch,1Ch,1Ch,1Ch,00h
					db 00h,00h,00h,1Ch,1Ch,00h,00h,00h,00h
					db 00h,00h,00h,1Ch,1Ch,00h,00h,00h,00h
					db 00h,00h,00h,1Ch,1Ch,00h,00h,00h,00h
	
	;Khởi tạo T_rex
	;Tọa độ T_rex
	t_rex_x   		dw ?
	t_rex_y   		dw ?
	t_rex_fall_speed dw ?	;tốc độ rơi của T_rex
	t_rex_jump_speed dw ?	;Tốc độ nhảy của T_rex
	;Chiều rộng, cao của T_rex
	t_rex_width 		dw ?
	t_rex_height     dw ?
	;Vị trí bắt đầu
	t_rex_image_start_address dw ?
	
	;Khởi tạo map
	;Tọa độ trên dưới của map
	; top_map_pos_y     db 320 dup(?)
	bottom_map_pos_y  db 320 dup(?)   	;dưới
	map_velocity      dw ?			;Vận tốc chuyển động của map
	map_gradient      db ?
	map_color         db 0FH	;Màu
	.map_ending       dw ?
	map_direction     db ? ;0 = down, 1 = up
	high_score    dw ?
	current_score dw 0		;điểm hiện tại
	loop_block_count db ?
	lose_cactus_score_mark dw ?
 
	cactus_pos_y dw ?
	cactus_pos_x dw ?
	;Chiều rộng, cao của cactus
	cactus_image_width dw ?
	cactus_image_height dw ?
	cactus_exist db 1
 
	;string message
	.interface_msg1 db "Score:"
	.start_screen_msg1 db "The t_rexcopter Game"
	.start_screen_msg2 db "Press any key to fly up  "
	.start_screen_msg3 db "Release to fall down     "
	.start_screen_msg4 db "Press 1/2/3 to change color"
	.start_screen_msg5 db "Highscore:"
	.start_screen_msg6 db "By Player:"
	.game_over_msg1 db "GAME OVER!!!!"
	.game_over_msg2 db "SPACE - TRY AGAIN"
	.game_over_msg3 db "  ESC - EXIT     "
 
	.game_over_msg4 db "   CONGRATULATION      "
	.game_over_msg5 db "YOU WON PLAYER "
	.game_over_msg6 db "YOUR NAME > "
 
;------------------------------------------------------------------------------------------code segment start------------------------------------------------------------------------------------ 
.code
main proc
	mov ax,@data
    mov ds,ax
	mov es,ax
	mov t_rex_image_start_address, offset t_rex_image_1  ;Lấy địa chỉ của T_rex 1
	call randomize_seed
	start:
	call initialize_variable 	;Khởi tạo các biến
	call set_video_mode			;gọi chế độ đồ họa
	call start_screen			;khởi tạo màn hình bắt đầu

	;bắt đầu chạy
	loop_frame:
		call spawn_t_rex		;T_rex		
		call spawn_map			;map
		call spawn_cactus		;xương rồng		
		call print_interface	;điểm hiện tại
		call flip_screen		;lật màn hình sau ra màn hình khác
	    call check_collision	;kiểm tra va chạm

		;nếu va chạm thì nhảy đến lose, không thì nhảy đến no_collision
		cmp al,1
			je lose    	;cờ ZF, 0 = no collision, 1 = collision with cave
			; cờ ZF=1 nếu al = 0, cờ ZF=0 nếu al=1
		cmp al,0
			je no_collision

		no_collision:
		add current_score,1			;điểm hiện tại được cộng thêm 1 sau mỗi vòng lặp
		call update_difficulty		;gọi hàm tăng độ khó
		mov dx, 1       		;sleep for 1 tick
		call sleep
		call clear_back_screen
		jmp loop_frame
	lose:
		call game_over_screen
		jc start				;cờ ZF, nếu cờ ZF = 1, bắt đầu lại game
		call exit				; else exit	
main endp

;hiển thị xương rồng
spawn_cactus proc
	mov ax,current_score			;điểm hiện tại
	mov dx,0						;
	div fifty	    				;nếu điểm chia được cho 50
	cmp dl,0						; so sánh phần dư với 0
	je put_cactus_to_right_side		;nếu phần dư bằng 0 thì nhảy đến put_cactus_to_right_side
	continue_spawn_cactus:				
	call draw_cactus
	ret
 
	put_cactus_to_right_side:
		mov cactus_pos_x,310
		mov ah,0

        mov ax, 0
		mov cactus_pos_y,ax; clear độ cao hiện tại của cây xương rồng
		add cactus_pos_y,160; cho giá trị chân cây xương rồng bằng đường chân trời
		mov cactus_exist,1
		jmp continue_spawn_cactus
spawn_cactus endp
 
; ==================================

draw_cactus proc
	cmp cactus_exist,1				;so sánh cactus_exist với 1
	je proceed_draw_cactus			;Nếu giá trị của cactus_exist bằng 1 (tức cây xương rồng tồn tại), nhảy đến nhãn proceed_draw_cactus.
		ret				
	proceed_draw_cactus:
	mov cx,cactus_pos_x 			; lưu tọa độ x của xương rồng
	mov dx,cactus_pos_y 			; lưu tọa độ y của xương rồng
	mov si,offset cactus_image     	;di chuyển địa chỉ của cactus_image
	;vẽ cây xương rồng theo chiều ngang
	draw_cactus_horizontal:
		mov al,[si]    
		cmp al,00h     
			je skip_draw_pixel_2
		mov ah,0ch 
		mov bh,back_screen_page_number 
		int 10h    
		skip_draw_pixel_2:
		inc si
		inc cx     
		mov ax,cx          
		sub ax,cactus_pos_x
		cmp ax,cactus_image_width
			jng draw_cactus_horizontal
 
		mov cx,cactus_pos_x 
		inc dx       
 
		mov ax,dx
		sub ax,cactus_pos_y
		cmp ax,cactus_image_height
			jng draw_cactus_horizontal
 
	mov ax,map_velocity	
	sub cactus_pos_x,ax
	js cactus_out_of_bound   
	ret
	cactus_out_of_bound:
		mov cactus_exist,0
	ret
draw_cactus endp
 
; ==================================

initialize_variable proc	
	mov t_rex_x,50 				;toạ độ x bắt đầu của T_rex
	mov t_rex_y,88				;tọa độ y bắt đầu của T_rex
	mov t_rex_fall_speed, 3	    ;tốc độ rơi
	mov t_rex_jump_speed, 30    ;tốc độ nhảy
	mov t_rex_width,20    		;chiều rộng
	mov t_rex_height, 21		;chiều cao
	mov map_velocity,10			;tốc độ di chuyển chủa map
	mov map_gradient,1			; độ dịch của các kí tự trong map
	mov map_color,0fh			;khởi tạo màu map
	mov current_score,0			;khởi tạo số điểm hiện tại = 0

	mov si,0
	mov cx,320					;kích thước của map
 
	mov si,0
	mov cx,320
	.reset_bottom_map_pos:			
		mov bottom_map_pos_y[si],176
		inc si
		loop .reset_bottom_map_pos
 
	call read_highscore_from_file		
 
	mov cactus_pos_x,300 		;toạ độ x bắt đầu của cactus
	mov cactus_pos_y,100	;toạ độ y bắt đầu của cactus	
	mov cactus_image_width,8  	;chiều rộng của cactus  
	mov cactus_image_height,14	;chiều cao của cactus 		
 	
 
	mov lose_cactus_score_mark,100
	ret
initialize_variable endp
 
; ==================================

;hiển thị màn hình bắt đầu của trò chơi
;hiển thị T_rex,map, thông báo ...
start_screen proc	
 .start_screen_begin:
	call draw_t_rex		;khởi tạo T_rex
	call draw_map		;khỏi tạo map
	
	;in ra và khởi tạo màu cho msg1
	mov ax,1300h          			;hiển thị chuỗi
	mov bh,back_screen_page_number	;ghi vào trang sau trước, sau đó chỉ lật màn hình 
	mov bl,1011b					;khởi tạo màu
	lea bp,.start_screen_msg1		;lấy địa chỉ bắt đầu của msg_1
	mov cx,19						;độ dài string
	mov dh,2						;row(truc y)
	mov dl,10						;column(truc x)
	int 10h							;in chuỗi
	;in ra và khởi tạo màu cho msg2
	mov ax,1300h					;hiển thị chuỗi
	mov bh,back_screen_page_number	;ghi vào trang sau trước, sau đó 
	mov bl,1011b					;khởi tạo màu
	lea bp,.start_screen_msg2		;lấy địa chỉ bắt đầu của msg_2
	mov cx,25						;độ dài string
	mov dh,11						;row(truc y)
	mov dl,12						;column(truc x)
	int 10h							;in chuỗi
	;in ra và khởi tạo màu cho msg3
	mov ax,1300h					
	mov bh,back_screen_page_number  
	mov bl,1011b					
	lea bp,.start_screen_msg3		
	mov cx,25						
	mov dh,12				
	mov dl,12				
	int 10h
	;in ra và khởi tạo màu cho msg4
	mov ax,1300h
	mov bh,back_screen_page_number  
	mov bl,1011b			
	lea bp,.start_screen_msg4
	mov cx,27				
	mov dh,13				
	mov dl,12				
	int 10h
	;in ra và khởi tạo màu cho msg5
	mov ax,1300h
	mov bh,back_screen_page_number  
	mov bl,1011b			
	lea bp,.start_screen_msg5
	mov cx,10				
	mov dh,22				
	mov dl,2				
	int 10h
 
	;in tính điểm
	mov ax,high_score					;lưu điểm vào ax
	mov row_for_print_as_ascii,22		;tọa độ x để lưu điểm
	mov col_for_print_as_ascii,12		;tọa độ y để lưu điểm
	call print_as_ascii					;gọi hàm in điểm
	
	;in msg6 "By Player:
	mov ax,1300h
	mov bh,back_screen_page_number 
	mov bl,1011b			
	lea bp,.start_screen_msg6
	mov cx,10				
	mov dh,22				
	mov dl,18				
	int 10h
	
	;in tên người chơi vừa thắng
	mov ax,1300h
	mov bh,back_screen_page_number 
	mov bl,1111b			
	lea bp,high_score_player 
	mov ch,0
	mov cl,input_name_act				
	mov dh,22				
	mov dl,28				
	int 10h
 
	call flip_screen	;thay đổi page_screen
	;Đổi icon T_rex	
	mov ah,07h		;đọc một ký tự từ bàn phìm dưới dạng mã ascii
	int 21h		
	cmp al,31h		;ascii của 1 dưới dạng hex
		je change_to_t_rex_image_1
	ret
	change_to_t_rex_image_1:
		mov t_rex_image_start_address, offset t_rex_image_1
		jmp .start_screen_begin
 
		jmp .start_screen_begin
start_screen endp
 
; ==================================
;update độ khó
update_difficulty proc		
	cmp current_score,100
		je phase_1
	cmp current_score,200
		je phase_2
	cmp current_score,300
		je phase_3
	cmp current_score,400
		je phase_4
	cmp current_score,500
		je phase_5
	cmp current_score,600
		je phase_6
	cmp current_score,700
		je phase_7
	ret
	phase_1:	
		sub bottom_map_pos_y[319],4
		mov map_gradient, 2				;khoảng cách dịch của các kí tự tăng lên 2
		ret
	phase_2:
		sub bottom_map_pos_y[319],4
		ret
	phase_3:
		sub bottom_map_pos_y[319],4
		ret
	phase_4:
		mov map_velocity,12				;số ký tự dịch sang bên trái tăng lên 12
		mov lose_cactus_score_mark,75
		ret
	phase_5:
		mov map_velocity,14				;số ký tự dịch sang bên trái tăng lên 14
		ret
	phase_6:
		mov map_velocity,16				;số ký tự dịch sang bên trái tăng lên 16
		mov lose_cactus_score_mark,50
		ret
	phase_7:
		mov map_velocity,18				;số ký tự dịch sang bên trái tăng lên 18
		mov map_gradient, 3				;độ chêch lệch tăng lên 3
		ret
update_difficulty endp
 
; ==================================
;kiểm tra va chạm
check_collision proc	
    mov si,t_rex_width
	add si,50 

    ;check vị trí hiện tại cây xương rồng
    mov ax, cactus_pos_x; vị trí hiện tại của cây xương rồng
    mov bx, t_rex_x; tọa độ x của khủng long
    cmp ax, bx
        je check_location; nếu tọa đô của cây xương rồng trùng với khủng long, kiểm tra va ch

    jmp no_collide;

    check_location:
	mov ax,t_rex_y; vị trí hiện tại của khủng long
	mov bx,150; chiều cao của xương rồng
	cmp bx,ax; nếu vị trí hiện tại của khủng long bé hơn hoặc bàng cây xương rồng nghĩa là đã chạm xương rồng
		jbe collide; nhảy đến hàm collide
 
	no_collide:
		mov al,0; không có va chạm
		ret
    collide:
		mov al,1; đã va chạm
		ret
 
check_collision endp
 
; ==================================

game_over_screen proc
	; cập nhập điểm mới nếu cao hơn điểm cũ	
	mov ax,current_score
	cmp high_score,ax  		;so sánh current_score,high_score 
	jb broke_record			; Nếu	high_score < current_score 
		mov ah,02h			; đặt vị trí con trỏ
		mov bh,front_screen_page_number		;trang 0
		mov dh,11			;số hàng
		mov dl,14			;số cột
		int 10h				;di chuyển con trỏ đến vị trí chỉ định
		mov si,0			;duyệt qua game_over_msg1

		;hiệu ứng in gameover
		print_game_over_animation:
			mov ah,02h
			mov dl,.game_over_msg1[si]
			int 21h
			mov dx,2		
			call sleep		;sleep for 2tick
			inc si
			cmp si,13
			jb print_game_over_animation

		;in game_over_msg2
		mov ax,1300h
		mov bh,front_screen_page_number
		mov bl,1111b			
		lea bp,.game_over_msg2	
		mov cx,17				
		mov dh,12				
		mov dl,12				
		int 10h

		;in game_over_msg3
		mov ax,1300h
		mov bh,front_screen_page_number
		mov bl,1111b			
		lea bp,.game_over_msg3	
		mov cx,17				
		mov dh,13				
		mov dl,12				
		int 10h

		;check ký tự nhập vào xem end game hay play again
		.get_input_for_end_or_start_again:
			mov ah,07h
			int 21h
 
			cmp al,32		;nếu là nút space thì chơi lại
			je play_again
			cmp al,27		;nếu là ký tự esc thì thoat
			je end_game
			jmp .get_input_for_end_or_start_again
 
		end_game:
			clc			;end game (set carry flag to 0)
			ret
		play_again:
			stc			;play again(set carry flag to 1)
			ret
 
 
	broke_record:
		mov high_score,ax  ;điểm hiện tại
		;in game_over_msg4
		mov ax,1300h		; chỉ viết lên màn hình phía trước, màn hình nhấp nháy vì không có hình ảnh chuyển động nhanh trong trò chơi này trên màn hình     
		mov bh,front_screen_page_number
		mov bl,1011b			
		lea bp,.game_over_msg4	
		mov cx,23				
		mov dh,12				
		mov dl,10				
		int 10h
 
		mov ax,1300h
		mov bh,front_screen_page_number
		mov bl,1011b			
		lea bp,.game_over_msg5	
		mov cx,15				
		mov dh,13				
		mov dl,10				
		int 10h
 
		mov ax,1300h
		mov bh,front_screen_page_number
		mov bl,1111b						;màu trắng
		lea bp,high_score_player 
		mov ch,0							
		mov cl,input_name_act				;độ dài tên
		mov dh,13				
		mov dl,25				
		int 10h
 
		mov ax,1301h
		mov bh,front_screen_page_number
		mov bl,1011b			
		lea bp,.game_over_msg6	
		mov cx,12				
		mov dh,14				
		mov dl,10				
		int 10h
 
		MOV AH,0AH
		LEA DX,input_name  
		INT 21H
		XOR AH,AH
		MOV AL,input_name_act
		MOV SI,AX         
		MOV high_score_player[SI],' '
 
		call write_highscore_to_file
		stc
		ret
game_over_screen endp
 
 
; ==================================
;in ra số điểm khi chạy
print_interface proc	
	mov ax,1300h			;request display string,al 01 = advance cursor
	mov bh,back_screen_page_number 
	mov bl,1011b			
	lea bp,.interface_msg1		
	mov cx,6				
	mov dh,1				
	mov dl,2				
	int 10h
	mov ax,current_score
	;vị trí in
	mov row_for_print_as_ascii,1
	mov col_for_print_as_ascii,8
	call print_as_ascii
 
		mov al,[si]
		mov ah,0ch
		mov bh,back_screen_page_number
		int 10h
		inc si
		inc cx 
		mov ax,cx
 
	mov loop_block_count,al
 
	ret
	no_need_print_cactus_block:
	ret
print_interface endp
 
 
; ==================================

spawn_map proc	
	call draw_map
	ret
spawn_map endp

draw_map proc
	mov si,0 
	draw_map_1:
		mov dh,0
		; mov dl,top_map_pos_y[si] 
		draw_top_map:
			MOV CX,SI 						;đặt vị trí x 
			mov ah,0ch 						;đặt cấu hình để viết một pixel
			mov al,map_color 				;thay đổi màu
			mov bh,back_screen_page_number	;ghi vào trang sau trước, sau đó chỉ lật màn hình
			int 10h    						;thực hiện cấu hình
			sub dl,13  						;dl = độ dày của map
			; cmp dl,top_map_pos_y[si]
			jb draw_top_map
 
		mov dh,0
		mov dl,bottom_map_pos_y[si]  		;đặt vị trí y

		inc si
		cmp si,320
		jb draw_map_1
	ret
draw_map endp
 
; ==================================

spawn_t_rex proc
	call kbhit			;kiểm tra có kí tự nào được nhập từ bàn phím hay không
		test al,al
		jz fall			;nếu ko thì nhảy fall
		
		;thay đổi vị trí trục y của T_rex
		jump:
            mov check_distance, 151; 
            mov ax, t_rex_y
            sub check_distance, ax; kiểm tra độ cao của khủng long, nếu không chạm đất thì cho rơi xuống
            jge skip;
			mov ax,t_rex_jump_speed	;tốc độ nhảy của khủng long
			sub t_rex_y, ax
			jmp skip    
		fall: 
            mov check_distance, 153; 
            mov ax, t_rex_y
            sub check_distance, ax; kiểm tra độ cao của khủng long, nếu không chạm đất thì cho rơi xuống
            jle skip;
            fall2:
                mov ax,t_rex_fall_speed
                add t_rex_y, ax	
        skip:
			call draw_t_rex
	ret
spawn_t_rex endp
 
; ==================================

draw_t_rex proc
	mov cx,t_rex_x 			; tọa độ x của T_rex
	mov dx,t_rex_y 			; tọa độ y của T_rex
	mov si,t_rex_image_start_address    	 ;địa chỉ của T_rex 
	draw_t_rex_horizontal:
		mov al,[si]   					; lưu giá trị màu hiện tại vào al
		cmp al,00h    					; nếu là màu trắng thì không cần vẽ
			je skip_draw_pixel
		mov ah,0ch						;đặt cấu hình để viết một pixel
		mov bh,back_screen_page_number 	;ghi vào trang sau trước, sau đó chỉ lật màn hình
		int 10h    						;thực hiện cấu hình
		skip_draw_pixel:
		inc si
		inc cx    						;cx = cx + 1
		mov ax,cx         				;cx - t_rex_x > T_rex size (y -> ta xuống dòng tiếp theo, n -> ta sang cột tiếp theo)
		sub ax,t_rex_x
		cmp ax,t_rex_width
			jng draw_t_rex_horizontal
 
		mov cx,t_rex_x					;thanh ghi cx quay trở lại cột ban đầu
		inc dx       					;tiến lên một dòng
		mov ax,dx             			;dx - t_rex_x > T_rex size (y -> thoát khỏi thủ tục này, n -> chuyển sang dòng tiếp theo)
		sub ax,t_rex_y
		cmp ax,t_rex_height
			jng draw_t_rex_horizontal
	ret
draw_t_rex endp
 
; ==================================
;đọc dữ liệu từ tệp tin
read_highscore_from_file proc	
	mov ah,3dh               		;mở tệp tin
	mov al,0h
	lea dx,file_name
	int 21h
	mov file_handler,ax
 
	mov ah,3fh              		;đọc dữ liệu từ tệp tin
	mov bx,file_handler
	mov cx,2
	lea dx,high_score				;điểm cao nhất	
	int 21h  
 
	mov ah,3fh              
	mov bx,file_handler
	mov cx,1
	lea dx,input_name_act			;tên người chơi
	int 21h  
 
	mov ah,3fh             
	mov bx,file_handler
	mov cx,11
	lea dx,high_score_player		;người chơi có điểm cao nhất
	int 21h  
 
	mov ah,3eh              
	mov bx,file_handler
	int 21h
	ret
read_highscore_from_file endp
 
 
; ==================================
;lưu điểm số cao nhất và tên người chơi vào tệp tin
write_highscore_to_file proc	
	mov ah,3dh              
	mov al,1h
	lea dx,file_name
	int 21h
	mov file_handler,ax
 
	mov ah,40h               		;việc ghi dữ liệu vào tệp tin
	mov bx,file_handler
	mov cx,2
	lea dx,high_score
	int 21h 
 
	mov ah,40h                 
	mov bx,file_handler
	mov cx,1
	lea dx,input_name_act
	int 21h 
 
	mov ah,40h                
	mov bx,file_handler
	mov cx,11
	lea dx,high_score_player
	int 21h 
 
 
	mov ah,3eh               
	mov bx,file_handler
	int 21h
	ret
write_highscore_to_file endp
 
; ==================================

kbhit proc
	mov al, 0		; kiểm tra xem có phím nào bị nhấn không
	mov ah, 1		; nhưng không chặn (không đồng bộ)
	int 16h			; call bios interrupt
	jz .kbhit_end	; nếu không co phím nào được nhập thì nhảy end		
	mov ax, 0		; nhận chức năng nhấn phím
	int 16h			; call bios interrupt
	ret		
 
	.kbhit_end:
		mov ax, 0	; trả về ax=0 nếu ko phím nào được nhập	
		ret
kbhit endp
 

;Sử dụng hàm ngắt 1Ah để sinh số ngẫu nhiên, số đó sẽ được lưu ở dx rồi lưu vào seed 
randomize_seed proc
	mov ax, 0			
	int 1Ah			
	mov seed, dx 		
	ret
randomize_seed endp

sleep proc
	;int 1ah" là một cuộc gọi ngắt BIOS truy xuất thời gian hệ thống hiện tại trong ticks (1/18.2 giây) và lưu trữ nó trong DX
	mov ax, 0	
	mov bx, dx		; save ms
 
	int 1ah		
	add bx, dx		; ms + ticks
 
	.wait:
		int 1ah		
		cmp dx, bx
		jne .wait	; lặp cho đến khi nào dx>=bx
		ret
sleep endp
 
; ============================================================
;in số điểm hiện tại
print_as_ascii proc
	push ax			
	push cx
	push dx
 
	xor cx,cx
	xor dx,dx
	mov bx, 10             
	;push các chữ số của điểm vào stack từ hàng đơn vị->
	div_by_ten:                            
		div ten			;chia thâp phân
		push dx 
		inc cx    
		xor dx,dx
		cmp ax, 0   	;so sánh thương với số 0
		jne div_by_ten                   
	;in các chữ số
	display_ascii:     
		xor dx,dx		
		pop dx       
		add dl, 30h             	         
		mov char_for_print_as_ascii, dl
 
		push cx
		mov ax,1300h
		mov bh,back_screen_page_number  
		mov bl,1111b			
		lea bp,char_for_print_as_ascii
		mov cx,1							;độ dài cảu string
		mov dh,row_for_print_as_ascii		
		mov dl,col_for_print_as_ascii		
		int 10h
		pop cx
 
		inc col_for_print_as_ascii
		loop display_ascii  
 
	pop dx			
	pop cx		
	pop ax
	ret
print_as_ascii endp 

;chuyển đổi trang màn hình 
flip_screen proc
	mov ah,05h							;chuyển đổi trang màn hình
	mov al,back_screen_page_number		;change active screen to back screen
	int 10h
 
	xor back_screen_page_number,1
	xor front_screen_page_number,1
	ret
flip_screen endp
clear_back_screen proc
	push es
	cmp back_screen_page_number,0
	je clear_page_0
	mov ax, 0a200h
	.clear_screen_continue:
	mov es, ax             				; Bắt đầu bộ nhớ video trong phân đoạn 0xA200/a000
	mov ax, 0h   						; Đặt màu thành rõ ràng với 0x00=black
	xor di, di         					; Địa chỉ đích được đặt thành 0
	mov cx, 4000  						; thực hiện 2 byte cùng một lúc
	rep stosw           				; Xóa bộ nhớ video
	mov ax,0600h
	mov bh,61h
	pop es
	ret
	clear_page_0:
		mov ax, 0a000h
		jmp .clear_screen_continue
clear_back_screen endp

;gọi chế độ đồ họa
set_video_mode proc
	mov ax, 000dh			; chế độ 16 màu
	int 10h			
	ret
set_video_mode endp
 
exit proc
	call set_video_mode
	mov ax,4c00h
	int 21h
exit endp
end main 