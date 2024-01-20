[org 0x0100]
jmp start
message: db 'Enter Your Name:'
message2: db 'Enter Your Roll No:'
string10: db 'LOADING.....'
string100: db ' ...WELCOME TO CARROT HUNT...'
pausee: db 0
quote: db 'If you want to exit press Y else Press N';40
yes: db '    YES                          NO';35
buffer: times 11352 db 0
oldisr: dd 0; space for saving old isr
Br1: dw 11218,11232
Br2: dw 10162,10176
Br3: dw 9106,9120 ;Also the moving
check: dw 0
rowBr3: dw 16
Rabbit: dw 10694
BrToMove:dw 35
RUNNING: DW 0
tickCount: dw 0
RabbitM1: dw 40,41,42
BrToMove1:dw 39
BrToMove2:dw 43
msg1: db 'Score :';7
dkd: dw 0
color: db 0
seconds: dw 0
timerflag: dw 1
oldkb: dd 0
tim: dw 0
msg2: db 'Time :';6
break: dw 0
third: dw 0
count: dw 0
msg3: db 'Game End';8
bayan: db '*Welcome To The Game*';25
bayan1: db 'INSTRUCTIONS:';12
bayan2: db'Press any key to play';21
inst: db 'Do not stay in Blue Brick for more than 2 seconds';49
inst1:db 'Carrots will give you Points';28
bayan3: db'Enjoy :)';8
score123: db 'SCORE: '
timer123: db 'TIMER: '
space: db' '
birddesign: db'v'
grassdesign: db '^'
waves: db '~'
lab: times 2000 dw 0
counts: dw 0
rabFt: dw 9902,9906
carrot: dw 8842
eat: dw 0
checker: dw 0
rabbitHead: dw 10434
scorep: db 'SCORE: '
oldkbi: dd 0
				


bluescreen:
								
	push es
			push ax
			push di
push cx
;call whiteline
			mov ax, 0xb800
			mov es, ax					; point es to video base
			mov di, 6412
			mov cx,0
			mov si,6528
line1: 			
	mov word [es:di], 0x9920	; clear next char on screen
								add di, 2					; move to next screen location
								cmp di,si		; has the whole screen cleared
								jne line1	
nextline:
add cx,1
sub di,116
add di,264
mov si,di
add si,116
cmp cx,10
jne line1


		mov si,6426
		mov cx,40
		mov di,0
		
		pri9:
		mov ah,0x17
		mov al,[cs:quote+di]
		mov word [es:si],ax
		add di,1
		add si,2
		loop pri9
		


mov si,7484
		mov cx,35
		mov di,0
		
		pri1:
		mov ah,0x17
		mov al,[cs:yes+di]
		mov word [es:si],ax
		add di,1
		add si,2
		loop pri1


                                pop cx
								pop di
								pop ax
								pop es
								ret 
	saveScreen:
		push ax
		push es
		push ds
		push si
		push di
		
		mov ax,buffer
		mov di,ax
		mov ax,0x19f5
		mov es,ax
		mov ax,0xb800
		mov ds,ax
		mov si,0
;cs stack startss from it that;s why
		; we can use cs in place of it thats why
		;like
		
		;mov ax ,CS
		;mov es,ax
		mov cx,11352
		cld
rep movsb
		
		pop di
		pop si
		pop ds
		pop es
		pop ax
		ret

restoreScreen:
		push ax
		push es
		push ds
		push si
		push di
		
		mov ax,buffer
		mov si,ax
		mov ax,0xb800
		mov es,ax
		mov ax,0x19f5
		;cs stack startss from it that;s why
		; we can use cs in place of it thats why
		;like
		
		;mov ax ,CS
		;mov ds,ax
		
		mov ds,ax
		

		mov di,0
		mov cx,11352
		cld
	rep movsb
		
		pop di
		pop si
		pop ds
		pop es
		pop ax
		ret
			

blackbackground:	
			push es
			push ax
			push di

			mov ax, 0xb800
			mov es, ax					; point es to video base
			mov di, 0					; point di to top left column

					 nextlocs:   
								mov word [es:di], 0x0720	; clear next char on screen
								add di, 2					; move to next screen location
								cmp di, 11352				; has the whole screen cleared
								jne nextlocs				; if no clear next position

								pop di
								pop ax
								pop es
								ret
sky:		push es
			push ax
			push di

			mov ax, 0xb800
			mov es, ax					; point es to video base
			mov di, 0					; point di to top left column

					nextloc2:	mov word [es:di], 0x7020	; clear next char on screen
								add di, 2					; move to next screen location
								cmp di, 3696			; has the whole screen cleared
								jne nextloc2				; if no clear next position

								pop di
								pop ax
								pop es
								ret
river:		
            push es
			push ax
			push di

			mov ax, 0xb800
			mov es, ax					; point es to video base
			mov di, 3696
	

					nextloc3:	mov word [es:di], 0x1020	; clear next char on screen
								add di, 2					; move to next screen location
								cmp di, 7392	; has the whole screen cleared
								jne nextloc3				; if no clear next position

								pop di
								pop ax
								pop es
								ret
			
grass:		
            push es
			push ax
			push di

			mov ax, 0xb800
			mov es, ax					; point es to video base
			mov di, 7392
	; point di to top left column

					nextloc4:	mov word [es:di], 0x2020	; clear next char on screen
											add di, 2					; move to next screen location
											cmp di, 11352		; has the whole screen cleared
											jne nextloc4			; if no clear next position

											pop di
											pop ax
											pop es
											ret
								

ToRight:
push bp
mov bp,sp
sub sp,2
push ax
push cx
push ax
push si
push di
push es
push ds


mov ax,0xb800
mov ds,ax
mov es,ax


mov di,264
mov ax,[bp+4]
mul di
mov di,ax
sub di,2
mov ax,[es:di]
mov [bp-2],ax

mov si,di
sub si,2

mov cx,132
std
rep movsw


mov di,264
mov ax,[bp+4]
mul di
mov di,ax
sub di,264
xor ax,ax
mov ax,[bp-2]
mov [es:di],ax


pop si
pop ds
pop es
pop di
pop si
pop cx
pop ax
mov sp,bp
pop bp
ret 2	
	



Toleft:

push bp
mov bp,sp
sub sp,2
push ax
push cx
push ax
push si
push di
push es
push ds


mov ax,0xb800
mov ds,ax
mov es,ax


mov di,264
mov ax,[bp+4]
mul di
mov di,ax
sub di,264
mov ax,[es:di]
mov [bp-2],ax

mov si,di
add si,2

mov cx,132
cld
rep movsw


mov di,264
mov ax,[bp+4]
mul di
mov di,ax
sub di,2
xor ax,ax
mov ax,[bp-2]
mov [es:di],ax


pop si
pop ds
pop es
pop di
pop si
pop cx
pop ax
mov sp,bp
pop bp
ret 2

; delay:      xor cx,cx
; xor dx,dx
; mov cx,0x04ff
; nexx:

			; mov dx,80
; nexx2:
			; dec dx
			; jnz nexx2
			; loop nexx
			; ret
			
Lmovement:
mov cx,5
pp:
mov ax,cx
push ax
add cx,1
call Toleft
cmp cx,16
jne pp
ret
	
	
Rmovement:
mov cx,16
Rig:
mov ax,cx
push ax
add cx,1
call ToRight
cmp cx,25
jne Rig
ret
Drawmountain:
            push bp
			mov bp,sp
			push es
			push ax
			push cx
			push si
			push di
			mov cx,10
					innerloop1:
								mov si,[bp+4]
								mov di,44
								mov ax, 0xb800
								mov es, ax
								mov dx,0
						innerloop2:
									mov al, [space]				; load al with columns per row
									mov ah,0x62
									mov [es:si], ax	
									add si,2
									add dx,2
									cmp dx,di
												
									je innerloop3
						            jmp innerloop2		
						innerloop3:
									sub si,264
									sub dx,2
									sub si,dx
									mov dx,0
									sub di,4
									
									dec cx
									jnz innerloop2
			
						nextchar:
									pop di
									pop si
									pop cx
									pop ax
									pop es
									pop bp
									ret 2
			
drawbird:
            push bp
			mov bp,sp
            push es
			push ax
			mov si,[bp+4]
			mov ax, 0xb800
			mov es, ax
			mov al, [birddesign]				; load al with columns per row
			mov ah,0xf0
			mov [es:si], ax	
		    pop ax 
			pop es
			pop bp
			ret 2
			
makegrass:
push bp
mov bp,sp
push es
push ax
push si
mov ax,0xb800
mov es,ax
mov si,2720

					l5:
					mov al,[grass]

					mov ah,0x2A

					mov [es:si],ax
					add si,4
					cmp si,4000
					je next5
					jmp l5

				next5:
				pop si
				pop ax
				pop es
				pop bp
				ret 



addwaves:
push bp
mov bp,sp
push es
push ax
mov ax,0xb800
mov es,ax
mov si,[bp+6]
mov di,[bp+4]
					l6:
					mov al,[waves]
					mov ah, 0x17
					mov [es:si],ax
					add si,8
					cmp si,di
					je next6
					jmp l6
					
					
					next6:
					pop ax
					pop es
					pop bp
					ret 4

			

Drawhalfs:
            push bp
			mov bp,sp
            push es
			push ax
			mov si,[bp+4]
			mov cx,[bp+6]
			mov dx,0
					innerloop4:
								mov ax, 0xb800
								mov es, ax
								mov al, [space]				; load al with columns per row
								mov ah,0x56
								mov [es:si], ax	
								add si,2
								inc dx
								cmp dx,cx
								je innerloop5
								jmp innerloop4
					innerloop5:	    sub si,264
								shl dx,1
								sub dx,2
								sub si,dx
								
								mov dx,0
								dec cx
								jnz innerloop4
								pop ax
								pop es
								pop bp
								ret 4
								
Boat:
		    push bp
			mov bp,sp
            push es
			push ax
			mov si,[bp+4]
			mov cx,[bp+6]
			mov dx,[bp+6]
			shr dx,1
			mov di,0
							l7:
										mov ax, 0xb800
										mov es, ax
										mov al, [space]				; load al with columns per row
										mov ah,0x45
										mov [es:si], ax	
										add si,2
										inc di
										cmp di,cx
										je l8
										jmp l7
							l8:
										add si,264
										shl di,1
										sub di,2
										sub si,di
										sub cx,2
										mov di,0
										sub dx,2
										jnz l7
										
										pop ax
										pop es
										pop bp
										ret 4
										

cloud:
		    push bp
			mov bp,sp
            push es
			push ax
			mov si,[bp+4]
			mov cx,[bp+6]
			mov dx,[bp+6]
			shr dx,1
			mov di,0
									s1:
												mov ax, 0xb800
												mov es, ax
												mov al, [space]				; load al with columns per row
												mov ah,0x30
												
												mov [es:si], ax	
												add si,2
												inc di
												cmp di,cx
												je s2
												jmp s1
									s2:
												add si,264
												shl di,1
												sub di,2
												sub si,di
												sub cx,2
												mov di,0
												sub dx,2
												jnz s1
												
												pop ax
												pop es
												pop bp
												ret 4		

drawtrees:
		    push bp
			mov bp,sp
            push es
			push ax
			push di
			push cx
			mov cx,3
			mov di,[bp+4]
			mov ax,0xb800
			mov es,ax
            mov si,di
			sub si,528
			mov al, [space]				; load al with columns per row
			mov ah,0x62
												loooop:
												mov word [es:di],ax
												sub di,264
												cmp di,si
												je treetop
												jmp loooop
treetop:
			sub cx,1
            cmp cx,0
			je endlooop
			
			sub si,4
			mov di,si
			add si,10
			mov al, [space]				
			mov ah,0x20
									l9:
									mov word [es:di],ax
									add di,2
									cmp di,si
									je l10
									jmp l9
									
									
									l10:
									sub si,270
									jmp treetop
			
									endlooop:
									pop cx
									pop di
									pop ax
									pop es
									pop bp
									ret 2

			
printmainscreen:

mov ah,0x00
mov al,0x54
int 0x10


	



call blackbackground
call sky
call river
call grass
mov ax,3696
push ax
call Drawmountain
mov ax,3740
push ax
call Drawmountain
mov ax,3784
push ax
call Drawmountain
mov ax,3828
push ax
call Drawmountain
mov ax,3872
push ax
call Drawmountain
mov ax,3916
push ax
call Drawmountain

mov ax,456
push ax
call drawbird
mov ax,576
push ax
call drawbird
mov ax,1034 
push ax
call drawbird
mov ax,2596
push ax
call drawbird
mov ax,1596
push ax
call drawbird
mov ax,1718
push ax
call drawbird
mov ax,3960
push ax
mov bx,4224
push bx
call addwaves
mov ax,5280
push ax
mov bx,5544
push bx
call addwaves
mov ax,6072
push ax
mov bx,6336
push bx
call addwaves


mov ax,2
push ax
mov si,4544
push si
call Drawhalfs
mov ax,16
push ax
mov si,4782
push si
call Boat
mov ax,2
push ax
mov si,4698
push si
call Drawhalfs


mov ax,12
push ax
mov si,4946
push si
call Boat




mov ax,8
push ax
mov si,344
push si
call cloud

mov ax,8
push ax
mov si,444
push si
call cloud

mov ax,7372
push ax
call drawtrees


mov ax,7384
push ax
call drawtrees

mov ax,7134
push ax
call drawtrees
mov ax,7146
push ax
call drawtrees
ret

		
hf:
CMP WORD[CS:RUNNING],0

JE WOK 
JMP WER
WOK:
cmp word[cs:tickCount],0
je FORFIRST
cmp word[cs:tickCount],1
je FORSECOND
cmp word[cs:tickCount],2
je FORTHIRD


FORFIRST:

call Rmovement
call Lmovement
call delay
push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement

push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
;;One movement of brick defined

push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
;Right movement defined

push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement

push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
JMP GOAWAy

FORSECOND:

call Rmovement
call Lmovement
call delay
push word[cs:BrToMove1]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove1]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove1]
call Toleft
call delay
call delay
call Rmovement
call Lmovement

push word[cs:BrToMove1]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
;;One movement of brick defined

push word[cs:BrToMove1]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove1]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove1]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove1]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove1]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove1]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove1]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove1]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
;Right movement defined

push word[cs:BrToMove1]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove1]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove1]
call Toleft
call delay
call delay
call Rmovement
call Lmovement

push word[cs:BrToMove1]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
JMP GOAWAy


FORTHIRD:



call Rmovement
call Lmovement
call delay
push word[cs:BrToMove2]
call Toleft
push word[cs:RabbitM1]
call Toleft
push word[cs:RabbitM1+2]
call Toleft
push word[cs:RabbitM1+4]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove2]
call Toleft
push word[cs:RabbitM1]
call Toleft
push word[cs:RabbitM1+2]
call Toleft
push word[cs:RabbitM1+4]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove2]
call Toleft
push word[cs:RabbitM1]
call Toleft
push word[cs:RabbitM1+2]
call Toleft
push word[cs:RabbitM1+4]
call Toleft
call delay
call delay
call Rmovement
call Lmovement

push word[cs:BrToMove2]
call Toleft
push word[cs:RabbitM1]
call Toleft
push word[cs:RabbitM1+2]
call Toleft
push word[cs:RabbitM1+4]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
;;One movement of brick defined

push word[cs:BrToMove2]
call ToRight
push word[cs:RabbitM1]
call ToRight
push word[cs:RabbitM1+2]
call ToRight
push word[cs:RabbitM1+4]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove2]
call ToRight
push word[cs:RabbitM1]
call ToRight
push word[cs:RabbitM1+2]
call ToRight
push word[cs:RabbitM1+4]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove2]
call ToRight
push word[cs:RabbitM1]
call ToRight
push word[cs:RabbitM1+2]
call ToRight
push word[cs:RabbitM1+4]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove2]
call ToRight
push word[cs:RabbitM1]
call ToRight
push word[cs:RabbitM1+2]
call ToRight
push word[cs:RabbitM1+4]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove2]
call ToRight
push word[cs:RabbitM1]
call ToRight
push word[cs:RabbitM1+2]
call ToRight
push word[cs:RabbitM1+4]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove2]
call ToRight
push word[cs:RabbitM1]
call ToRight
push word[cs:RabbitM1+2]
call ToRight
push word[cs:RabbitM1+4]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove2]
call ToRight
push word[cs:RabbitM1]
call ToRight
push word[cs:RabbitM1+2]
call ToRight
push word[cs:RabbitM1+4]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove2]
call ToRight
push word[cs:RabbitM1]
call ToRight
push word[cs:RabbitM1+2]
call ToRight
push word[cs:RabbitM1+4]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
;Right movement defined
push word[cs:BrToMove2]
call Toleft
push word[cs:RabbitM1]
call Toleft
push word[cs:RabbitM1+2]
call Toleft
push word[cs:RabbitM1+4]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove2]
call Toleft
push word[cs:RabbitM1]
call Toleft
push word[cs:RabbitM1+2]
call Toleft
push word[cs:RabbitM1+4]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove2]
call Toleft
push word[cs:RabbitM1]
call Toleft
push word[cs:RabbitM1+2]
call Toleft
push word[cs:RabbitM1+4]
call Toleft
call delay
call delay
call Rmovement
call Lmovement

push word[cs:BrToMove2]
call Toleft
push word[cs:RabbitM1]
call Toleft
push word[cs:RabbitM1+2]
call Toleft
push word[cs:RabbitM1+4]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
JMP GOAWAy










WER:
call Rmovement
call Lmovement
call delay
push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement

push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
;;One movement of brick defined

push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement

push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement


push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement



push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call ToRight
call delay
call delay
call Rmovement
call Lmovement
;Right movement defined

push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement

push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement

push word[cs:BrToMove]
call Toleft
call delay
call delay
call Rmovement
call Lmovement
GOAWAy:

jmp hf
ret


printAllBricks:

pusha
cmp word[cs:break],1
je For_Flag
Not_Flag:
push 2
call RANDNUM
jmp Functionality
For_Flag:
push 1
call RANDNUM

Functionality:
push 264
push word[cs:dkd]
call printnum


cmp word[cs:dkd],0
je orange


cmp word[cs:dkd],1
je red

cmp word[cs:dkd],2
je purple


orange:
mov word[cs:color],0x60
jmp function

purple:
mov word[cs:break],1
mov word[cs:color],0x50
jmp function

red:
mov word[cs:color],0x40


function:
cmp word[cs:check],0
je priny

cmp word[cs:check],1
je priny1

cmp word[cs:check],2
je priny2

priny:
add word[cs:check],1
;add word[cs:BrToMove],4
add word[cs:Br3],1056
add word[cs:Br3+2],1056
add word[cs:Br2],1056
add word[cs:Br2+2],1056



push 6
call RANDNUM

mov ax,[cs:dkd]
shr ax,1
jc af2
jmp prt2
af2:
add word[cs:dkd],1
prt2:

mov word[cs:Br1],9106
mov word[cs:Br1+2],9120
mov ax,[cs:dkd]
add word[cs:Br1],ax
add word[cs:Br1+2],ax




mov ax,0xb800
mov es,ax
mov ds,ax
mov si,[cs:Br1] 

mov al,' '
mov ah,[cs:color]


fiir:
mov [es:si],ax
add si,2
cmp si,[cs:Br1+2]

jne fiir
jmp exit

priny1:
add word[cs:check],1

add word[cs:Br3],1056
add word[cs:Br3+2],1056
add word[cs:Br1],1056
add word[cs:Br1+2],1056
push 6
call RANDNUM
mov ax,[cs:dkd]
shr ax,1
jc af
jmp prt
af:
add word[cs:dkd],1
prt:
mov word[cs:Br2],9106
mov word[cs:Br2+2],9120
mov ax,[cs:dkd]
add word[cs:Br2],ax
add word[cs:Br2+2],ax
mov ax,0xb800
mov es,ax
mov si,[cs:Br2] 
mov al,' '
mov ah,[cs:color]
fiir1:
mov [es:si],ax
add si,2
cmp si,[cs:Br2+2]
jne fiir1
jmp exit


priny2:


mov word[cs:check],0
;mov word[cs:BrToMove],17
add word[cs:Br2],1056
add word[cs:Br2+2],1056
add word[cs:Br1],1056
add word[cs:Br1+2],1056

push 6
call RANDNUM
mov ax,[cs:dkd]
shr ax,1
jc af1
jmp prt1
af1:
add word[cs:dkd],1
prt1:

mov word[cs:Br3],9106
mov word[cs:Br3+2],9120
mov ax,[cs:dkd]
add word[cs:Br3],ax
add word[cs:Br3+2],ax
mov ax,0xb800
mov es,ax
mov si,[cs:Br3] 
mov al,' '
;mov ah,0x50
mov ah,[cs:color]
fiir2:
mov [es:si],ax
add si,2
cmp si,[cs:Br3+2]
jne fiir2
jmp exit
exit:
popa
ret


;

delete:
   push bp
   mov bp,sp
   push es
   push ax
   push bx
   push si
      
   			mov ax, 0xb800
			mov es, ax									
            mov si,[bp+4]
			mov al,' '
			mov ah ,0x20
            mov [es:si],ax
			add si,2
			mov al,' '
			mov ah ,0x20
            mov [es:si],ax
			add si,2
			mov al,' '
			mov ah ,0x20
            mov [es:si],ax 
			add si,2
			mov al,' '
			mov ah ,0x20
            mov [es:si],ax
			mov di,si
			sub si,264
			mov al,' '
			mov ah ,0x20
            mov [es:si],ax
			sub si,6
			mov al,' '
			mov ah ,0x20
            mov [es:si],ax
			mov si,di
			add si,262
			mov al,' '
			mov ah ,0x20
            mov [es:si],ax
			sub si,2
			mov al,' '
			mov ah ,0x20
            mov [es:si],ax
			
   pop si
   pop bx
   pop ax
   pop es
   pop bp
   ret 2
uper:
push bp
mov bp,sp
push ax
push es
push word[cs:Rabbit]
call delete
mov bx,word[cs:rabFt]
mov cx,word[cs:rabFt+2]
sub word[cs:rabFt],1056
sub word[cs:rabFt+2],1056
mov dx,word[cs:Rabbit]
sub word[cs:Rabbit],1056
push word[cs:Rabbit]
call DrawRabbit

mov word[cs:Rabbit],dx
mov  word[cs:rabFt],bx
mov  word[cs:rabFt+2],cx


call delay
call delay
pop es
pop ax
pop bp
ret
RandomCarrot:
pusha
;mov word[cs:carrot],8842


             push 16	
			call RANDNUM
			
			mov ax,[cs:dkd]
shr ax,1
jc aff2
jmp prrt2
aff2:
add ax,1
prrt2:
add ax,[cs:carrot]
mov word[cs:carrot],ax
mov si,ax
mov ax,0xb800
mov es,ax
mov ah,0x6C
mov al,'!'
mov word[es:si],ax
popa
RET
match:
pusha
mov ax,[cs:carrot]
cmp ax,[cs:rabFt]
je update
cmp ax,[cs:rabFt+2]
je update

jmp Leaving
update:
add word[cs:eat],5

push 7408
push word[cs:eat]
call printnum
cmp word[cs:eat],50
jl Leaving
mov word[cs:RUNNING],1 

Leaving:
popa
ret

te:
pusha
mov ax,0xb800
mov es,ax
mov ax,[cs:rabbitHead]
sub ax,264
mov si,ax
cmp word[es:si],0x2020
je terminate
popa
ret
kbisr:		push ax
			push es

			mov ax, 0xb800
			mov es, ax									; point es to video memory

			in al, 0x60									; read a char from keyboard port
			
			
			cmp word[cs:pausee],1
			je chechAgain
            cmp al,0x01
			jne chechAgain
			mov word[cs:pausee],1
			call saveScreen
			call clrscr
			;call whiteline
            call bluescreen
	        
			jmp nomatch
chechAgain:
			cmp al,0x31
			je dofis
			jmp actuall
dofis:
			call restoreScreen
			mov word[cs:pausee],0
			jmp nomatch
	actuall:
cmp al,0x15
je terminate	
			actual:
			cmp al, 0x48								; is the key left shift
			jne nextcmp									; no, try next comparison
			;call animation  
			;call drawRabbit
			;call PushRabbitUp
			call te
			call uper
			call delay
			call delay
			call scrollDown
			call printAllBricks
			call match
			;call te
			push 10
			push word [cs:rabFt]
			call printnum
			push 40
			push word [cs:carrot]
			call printnum
			; push 792
			; push word [cs:counts]
			; call printnum
			
			cmp word[cs:tickCount],3
			je gurtr
			add word[cs:tickCount],1
			jmp ght
			gurtr:
			mov word[cs:tickCount],0
			ght:
			cmp word[cs:checker],1
			je cart
			add word[cs:checker],1
			add word[cs:carrot],1056
			jmp thework
			cart:
			mov word[cs:checker],0
			mov word[cs:carrot],8842
			call RandomCarrot
			thework:
			mov word[cs:tim],0
			CountPurple:
			cmp word[cs:break],1
			jne leav
			add word[cs:count],1
			cmp word[cs:count],3
			jne remL
			mov word[cs:counts],1
			
			
			remL:
			cmp word[cs:count],4
			jne leav
			
			mov word [cs:count], 0
			mov word [cs:break],0
			mov word[cs:counts],0
			leav:
			

			
			
			jmp nomatch									; leave interrupt routine

nextcmp:	cmp al, 0xb0								; is the key right shift
			jne nomatch									; no, leave interrupt routine
			;call restoreScreen						; yes, print R at top left

nomatch:
			
		
			; mov al, 0x20
			; out 0x20, al ; send EOI to PIC
			; pop es
			; pop ax
			; iret ; return from interrupt
			


pop es
pop ax
jmp far [cs:oldisr] ; call the original ISR


timer:		 push ax
			;cmp word [cs:timerflag], 1 ; is the printing flag set
			;jne skipall ; no, leave the ISR
            cmp word [cs:counts], 1 ; is the printing flag set
			je toDo ; no, leave the ISR
			jmp skipall
			toDo:
			inc word [cs:seconds] ; increment tick count
			cmp word [cs:seconds],37
			jae pri
			jmp exits
			pri:
			inc word [cs:tim]
			push 132
			push word [cs:tim]
			call printnum ; print tick count
			mov word [cs:seconds],0
			cmp word [cs:tim],3
			jne exits
			call clrscr
			jmp terminate
			
			exits:

skipall:	mov al, 0x20
			out 0x20, al ; send EOI to PIC
			pop ax
			iret ; return from interrupt



strlen: push bp
		mov bp,sp
		push es
		push cx
		push di
		les di, [bp+4] ; point es:di to string
		mov cx, 0xffff ; load maximum number in cx
		xor al, al ; load a zero in al
		repne scasb ; find zero in the string
		mov ax, 0xffff ; load maximum number in ax
		sub ax, cx ; find change in cx
		dec ax ; exclude null from length
		pop di
		pop cx
		pop es
		pop bp
		ret 4 
		
		
printstr:	push bp
			mov bp, sp
			push es
			push ax
			push cx
			push si
			push di
			push ds ; push segment of string
			mov ax, [bp+4]
			push ax ; push offset of string
			call strlen ; calculate string length 
			cmp ax, 0 ; is the string empty
			jz exitt ; no printing if string is empty
			mov cx, ax ; save length in cx
			mov ax, 0xb800
			mov es, ax ; point es to video base
			mov al, 132 ; load al with columns per row
			mul byte [bp+8] ; multiply with y position
			add ax, [bp+10] ; add x position
			shl ax, 1 ; turn into byte offset
			mov di,ax ; point di to required location
			mov si, [bp+4] ; point si to string
			mov ah, [bp+6] ; load attribute in ah
			cld ; auto increment mode
			nextchars: lodsb ; load next char in al
			stosw ; print char/attribute pair
			loop nextchars ; repeat for the whole string
			exitt: pop di
			pop si
			pop cx
			pop ax
			pop es
			pop bp
			ret 8 
			
			
printnum: push bp
				mov bp, sp
				push es
				push ax
				push bx
				push cx
				push dx
				push di

				mov ax, 0xb800
				mov es, ax			; point es to video base

				mov ax, [bp+4]		; load number in ax= 4529
				mov bx, 10			; use base 10 for division
				mov cx, 0			; initialize count of digits

nextdigit:		mov dx, 0			; zero upper half of dividend
				div bx				; divide by 10 AX/BX --> Quotient --> AX, Remainder --> DX ..... 
				add dl, 0x30		; convert digit into ascii value
				push dx				; save ascii value on stack

				inc cx				; increment count of values
				cmp ax, 0			; is the quotient zero
				jnz nextdigit		; if no divide it again


                 mov di,[bp+6]
									      ; point di to top left column
nextpos:		pop dx				; remove a digit from the stack
				mov dh, 0x60		; use normal attribute
				mov [es:di], dx		; print char on screen
				add di, 2			; move to next screen location
				loop nextpos		; repeat for all digits on stack

				pop di
				pop dx
				pop cx
				pop bx
				pop ax
				pop es
				pop bp
				ret 4
			

DrawRabbit:
 push bp
   mov bp,sp
   push es
   push ax
   push bx
   push si
      
   			mov ax, 0xb800
			mov es, ax									
            mov si,[bp+4]
			mov al,'('
			mov ah ,0x70
            mov [es:si],ax
			add si,2
			mov al,'~'
			mov ah ,0x70
            mov [es:si],ax
			add si,2
			mov al,'~'
			mov ah ,0x70
            mov [es:si],ax 
			add si,2
			mov al,')'
			mov ah ,0x70
            mov [es:si],ax
			mov di,si
			sub si,264
			mov al,'/'
			mov ah ,0x70
            mov [es:si],ax
			sub si,6
			mov al,'\'
			mov ah ,0x70
            mov [es:si],ax
			mov si,di
			add si,262
			mov al,'^'
			mov ah ,0x70
            mov [es:si],ax
			sub si,2
			mov al,'^'
			mov ah ,0x70
            mov [es:si],ax
			
   pop si
   pop bx
   pop ax
   pop es
   pop bp
   ret 2








printBricks:
push bp
pusha

mov ax,0xb800
mov es,ax
mov al,' '
mov ah,0x60
mov si,[Br1]
fir:
mov [es:si],ax
add si,2
cmp si,[Br1+2]
jne fir

mov ah,0x40
mov si,[Br2]
fir1:
mov [es:si],ax
add si,2
cmp si,[Br2+2]
jne fir1

mov ah,0x50
mov si,[Br3]
fir2:
mov [es:si],ax
add si,2
cmp si,[Br3+2]
jne fir2

mov ax,[Rabbit]
push ax
 call DrawRabbit

mov si,7392
mov cx,7
mov di,0
kjk:
mov al,[scorep+di]
mov ah,0x70
mov word[es:si],ax
add si,2
add di,1
loop kjk


popa
pop bp
ret



scrollDown:

pusha



mov cx,792
mov ax,0xb800
mov es,ax
mov ds,ax
mov di,11350
mov si,10294
std
rep movsw
mov cx,1056
mov ax,0x2020
rep stosw




popa
ret



			
			
clrscr: push es
push ax
push di
mov ax, 0xb800
mov es, ax ; point es to video base
mov di, 0 ; point di to top left column

nextloc: mov word [es:di], 0x0720 ; clear next char on screen
add di, 2 ; move to next screen location
cmp di, 11352 ; has the whole screen cleared
jne nextloc ; if no clear next position
pop di
pop ax
pop es
ret

; delay:      xor cx,cx
; xor dx,dx
; mov cx,2000
; nexx:

			; mov dx,80
; nexx2:
			; dec dx
			; jnz nexx2
			; loop nexx
			; ret
delay:
push cx
mov cx,0xffff
loop $

mov cx,0xff0f
loop $

pop cx
ret
RANDNUM:
   push bp
   mov bp,sp
   push ax
   push cx
   push dx
   
   MOV AH, 00h     ; interrupts to get system time        
   INT 1AH         ; CX:DX now hold number of clock ticks since midnight      
   mov  ax, dx
   xor  dx, dx
   
   mov  cx, [bp+4] 
   inc cx   
   div  cx         ; here dx contains the remainder of the division - from 0 to 9
   mov word[cs:dkd], dx
   pop dx
   pop cx
   pop ax
   pop bp   
   ret 2






startScreen:
mov ah, 00h;
	mov al, 13h;
	int 10h;
	
		mov cx,23
mov si,0
mov dx, 0207h  ; Row=12 (in DH), Column=20 (in DL)
		mov bh, 0      ; Page=0
		mov ah, 02h    ; BIOS.SetCursorPosition - Point to the location of dx and page no. of bh
		int 10h
m1:
		
		
		mov bx, 000Fh  ; Page=0 (in BH), Color=15 (in BL)             15 is BrightWhite
		mov ah, 0Eh  ; BIOS.Teletype (in AH), Character=33 (in AL)  33 is ASCII of "!"
		mov al,[cs:bayan+si]
		int 10h
		add si,1
		
		loop m1
				mov cx,49
mov si,0
mov dx, 0400h  ; Row=12 (in DH), Column=20 (in DL)
		mov bh, 0      ; Page=0
		mov ah, 02h    ; BIOS.SetCursorPosition - Point to the location of dx and page no. of bh
		int 10h
m100:
		
		
		mov bx, 000Fh  ; Page=0 (in BH), Color=15 (in BL)             15 is BrightWhite
		mov ah, 0Eh  ; BIOS.Teletype (in AH), Character=33 (in AL)  33 is ASCII of "!"
		mov al,[cs:inst+si]
		int 10h
		add si,1
		
		loop m100
	
	mov cx,28
mov si,0
mov dx, 0900h  ; Row=12 (in DH), Column=20 (in DL)
		mov bh, 0      ; Page=0
		mov ah, 02h    ; BIOS.SetCursorPosition - Point to the location of dx and page no. of bh
		int 10h
m101:
		
		
		mov bx, 000Fh  ; Page=0 (in BH), Color=15 (in BL)             15 is BrightWhite
		mov ah, 0Eh  ; BIOS.Teletype (in AH), Character=33 (in AL)  33 is ASCII of "!"
		mov al,[cs:inst1+si]
		int 10h
		add si,1
		
		loop m101
			mov cx,13
mov si,0
mov dx, 010Dh  ; Row=12 (in DH), Column=20 (in DL)
		mov bh, 0      ; Page=0
		mov ah, 02h    ; BIOS.SetCursorPosition - Point to the location of dx and page no. of bh
		int 10h
m2:
		
		
		mov bx, 000Fh  ; Page=0 (in BH), Color=15 (in BL)             15 is BrightWhite
		mov ah, 0Eh  ; BIOS.Teletype (in AH), Character=33 (in AL)  33 is ASCII of "!"
		mov al,[cs:bayan1+si]
		int 10h
		add si,1
		
		loop m2
	
				mov cx,21
mov si,0
mov dx, 140Ah  ; Row=12 (in DH), Column=20 (in DL)
		mov bh, 0      ; Page=0
		mov ah, 02h    ; BIOS.SetCursorPosition - Point to the location of dx and page no. of bh
		int 10h
m3:
		
		
		mov bx, 000Fh  ; Page=0 (in BH), Color=15 (in BL)             15 is BrightWhite
		mov ah, 0Eh  ; BIOS.Teletype (in AH), Character=33 (in AL)  33 is ASCII of "!"
		mov al,[cs:bayan2+si]
		int 10h
		add si,1
		
		loop m3
	
				mov cx,8
mov si,0
mov dx, 1612h  ; Row=12 (in DH), Column=20 (in DL)
		mov bh, 0      ; Page=0
		mov ah, 02h    ; BIOS.SetCursorPosition - Point to the location of dx and page no. of bh
		int 10h
m4:
		
		
		mov bx, 000Fh  ; Page=0 (in BH), Color=15 (in BL)             15 is BrightWhite
		mov ah, 0Eh  ; BIOS.Teletype (in AH), Character=33 (in AL)  33 is ASCII of "!"
		mov al,[cs:bayan3+si]
		int 10h
		add si,1
		
		loop m4
	mov ah, 0 ; service 0 – get keystroke
int 0x16 ; call BIOS keyboard service
mov ah, 00h;
	mov al, 03h;
	int 10h;
	
ret



endscreen:
pusha


call clrscr

mov ax,0xb800
mov es,ax
mov si,7982
mov di,0
mov cx,8

chalja:
mov al,[cs:msg3+di]
mov ah,0x60
mov word[es:si],ax
add di,1
add si,2
loop chalja
mov si,8246
mov di,0
mov cx,7

chalja1:
mov al,[cs:scorep+di]
mov ah,0x60
mov word[es:si],ax
add di,1
add si,2
loop chalja1
push word[cs:eat]
push 8266
call printnum


popa
ret
			

start:	




mov ah, 00h;
	mov al, 13h;
	int 10h;
	
call blackbackground
mov ah, 0x13		; service 13 - print string
		
		mov al, 1			; subservice 01 – update cursor 
		;????????????????????????????????WHAT WILL BE THE OUTPUT IF AL = 0???

		;Text video screen is in the form of pages which can be upto 32. At
		;one time one page is visible which is by default the zeroth page
		;unless we change it. 
		mov bh, 0			; output on page 0
		
		mov bl, 12	; normal attrib
		mov cx, 	29	; length of string
		mov dx, 0x0A04		; row 10 column 3
		
		;es:bp = ds:message
		push ds
		pop es				; es=ds segment of string
		mov bp, string100		; bp = offset of string
	
		INT 0x10	

mov cx,80

looooooooooooooooooooooop:
call delay

loop looooooooooooooooooooooop 


mov ah, 00h;
	mov al, 13h;
	int 10h;
	
	

; Modify ES:DI to point to your buffer containing the font image

  ; Call BIOS video service
	
mov ah, 0x13		; service 13 - print string
		
		mov al, 1			; subservice 01 – update cursor 
		;????????????????????????????????WHAT WILL BE THE OUTPUT IF AL = 0???

		;Text video screen is in the form of pages which can be upto 32. At
		;one time one page is visible which is by default the zeroth page
		;unless we change it. 
		mov bh, 0			; output on page 0
		
		mov bl, 08	; normal attrib
		mov cx, 16			; length of string
		mov dx, 0x0A0A	; row 10 column 3
		
		;es:bp = ds:message
		push ds
		pop es				; es=ds segment of string
		mov bp, message		; bp = offset of string
		
		INT 0x10			; call BIOS video service
		; call BIOS video service
		;?????????????????????????????????????How will this line work???
nextchar1000: 

mov ah, 1 ; service 1 – read character
int 0x21 ; dos services
cmp al, 13 ; is enter pressed
je exit1000 ; yes, leave input
mov [si], al ; no, save this character
inc si ; increment buffer pointer
loop nextchar1000 ; repeat for next input char
exit1000: mov byte [si], '$' ; append $ to user input











mov ah, 0x13		; service 13 - print string
		
		mov al, 1			; subservice 01 – update cursor 
		;????????????????????????????????WHAT WILL BE THE OUTPUT IF AL = 0???

		;Text video screen is in the form of pages which can be upto 32. At
		;one time one page is visible which is by default the zeroth page
		;unless we change it. 
		mov bh, 0			; output on page 0
		
		mov bl, 08	; normal attrib
		mov cx, 19			; length of string
		mov dx, 0x0C0A	; row 10 column 3
		
		;es:bp = ds:message
		push ds
		pop es				; es=ds segment of string
		mov bp, message2		; bp = offset of string
		
		INT 0x10			; call BIOS video service
		; call BIOS video service
		;?????????????????????????????????????How will this line work???
		nextchar50: 

mov ah, 1 ; service 1 – read character
int 0x21 ; dos services
cmp al, 13 ; is enter pressed
je exit50 ; yes, leave input
mov [si], al ; no, save this character
inc si ; increment buffer pointer
loop nextchar50 ; repeat for next input char
exit50 mov byte [si], '$' ; append $ to user input

		mov ax,0
int 16h


call startScreen	
	
; ;call clrscr
; mov ah, 0 ; service 0 – get keystroke
; int 0x16 ; call BIOS keyboard service

call clrscr ; clear the screen
mov ah, 00h;
	mov al, 13h;
	int 10h;
	

mov ah, 0x13		; service 13 - print string
		
		mov al, 1			; subservice 01 – update cursor 
		;????????????????????????????????WHAT WILL BE THE OUTPUT IF AL = 0???

		;Text video screen is in the form of pages which can be upto 32. At
		;one time one page is visible which is by default the zeroth page
		;unless we change it. 
		mov bh, 0			; output on page 0
		
		mov bl, 10	; normal attrib
		mov cx, 	12		; length of string
		mov dx, 0x0A0E		; row 10 column 3
		
		;es:bp = ds:message
		push ds
		pop es				; es=ds segment of string
		mov bp, string10		; bp = offset of string
	
		INT 0x10	

mov cx,50
l100:
call delay
loop l100

mov ah,0x00
mov al,0x54
int 0x10


; mov ax, 0
		; push ax ; push x position
		; mov ax, 0
		; push ax ; push y position
		; mov ax, 1 ; blue on black
		; push ax ; push attribute
		; mov ax, msg1
		; push ax ; push offset of string
		; call printstr ; print the string
		; push 16
		; push 879
		; call printnum
		call printmainscreen
call printBricks
call RandomCarrot
; mov ax, 200
		; push ax ; push x position
		; mov ax, 0
		; push ax ; push y position
		; mov ax, 1 ; blue on black
		; push ax ; push attribute
		; mov ax, msg2
		; push ax
		; call printstr
	
		mov ax,0
			mov es, ax	
			
			                                                ; point es to IVT base
			mov ax, [es:9*4]
			mov [oldisr], ax								; save offset of old routine
			mov ax, [es:9*4+2]
			mov [oldisr+2], ax								; save segment of old routine
            mov ax, [es:8*4]
			mov [oldisr], ax ; save offset of old routine
			mov ax, [es:8*4+2]
			mov [oldisr+2], ax ; save segment of old routine
				
         cli												; disable interrupts
			mov word [es:9*4], kbisr						; store offset at n*4
			mov [es:9*4+2], cs			                	; store segment at n*4+2
			mov word [es:8*4], timer ; store offset at n*4
			mov [es:8*4+2], cs 
			sti
			
			call hf
			

l1:	
     		mov ah, 0										; service 0 – get keystroke
			int 0x16										; call BIOS keyboard service
			
			
			cmp al, 27										; is the Esc key pressed
			jne l1											; if no, check for next key
			
			mov ax, [oldisr]								; read old offset in ax
			mov bx, [oldisr+2]								; read old segment in bx
			
			cli												; disable interrupts
			mov [es:9*4], ax								; restore old offset from ax
			mov [es:9*4+2], bx								; restore old segment from bx
			;mov [es:8*4], ax ; store offset at n*4
			;mov [es:8*4+2], bx 
			sti	                                            ; enable interrupts 			

terminate:
mov ah,0x00
mov al,0x54
int 0x10


	; set the video mode to 13h
call endscreen



	; set the video mode to 13h
	; ; mov ah, 00h;
	; ; mov al, 13h;
	; ; int 10h;
	
	; ; jmp starts
	
; --------------------------------------------------------------------
; Example on printing through interrupts
; --------------------------------------------------------------------
; for character printing the system uses DX register for printing
; position so DH = row and DL = Column
; for Traversal across columns you increment DL;
; for Traversal across rows you increment DH then set cursor to that row by BIOS.SetCursorPosition Interrupt
; BL is for color of the text, Range = 0-255
; NOTE: GFX mode has 8 pages and uses BH for this so
; KEEP BH = 0;
; AH = 0E command for printing character
; AL = "ASCII" of the character to print
; IMP NOTE: 1 Char == 8 PIXELS
; So for char you only have 320 / 8 = 40 Columns;
; And 200 / 8 = 25 Rows;
; ref: https://stackoverflow.com/questions/68045082/how-to-print-a-string-centered-vertical-and-horizontal-in-video-mode

; ; charprint:
		; ; mov dx, 0C14h  ; Row=12 (in DH), Column=20 (in DL)
		; ; mov bh, 0      ; Page=0
		; ; mov ah, 02h    ; BIOS.SetCursorPosition - Point to the location of dx and page no. of bh
		; ; int 10h
		
		; ; mov bx, 000Fh  ; Page=0 (in BH), Color=15 (in BL)             15 is BrightWhite
		; ; mov ax, 0E45h  ; BIOS.Teletype (in AH), Character=33 (in AL)  33 is ASCII of "!"
		; ; int 10h
		
		
		
		; ; ret
		
; ; borderPrint:
		
		; ; mov dx, 0000h	; starting from top left
		; ; mov bh, 0
		; ; mov ah, 02h
		; ; int 10h
		
		; ; call delays
		; ; mov bx, 000Fh
		; ; mov ax, 0E2Ah	; 2A = '*'
		
	; ; bPrintFirstRow:
			; ; int 10h		; print interrupt
			; ; add dl, 1;
			; ; call delays
			; ; cmp dl, 28h	; has it traversed all 40 cols? 
			; ; jne bPrintFirstRow
		
		; ; mov dx, 0x1700	; 17h = 24th row - pointing to row before the last as the GUI Glitches at last row printing for characters
		; ; mov ah, 02h    ; BIOS.SetCursorPosition - Point to the location of dx and page no. of bh
		; ; int 10h
		
		; ; mov ax, 0E2Ah
	; ; bPrintSecondRow:
			; ; int 10h
			; ; add dl, 1;
			; ; cmp dl, 28h
			; ; jne bPrintSecondRow
	
		; ; mov dx, 0x0100	; starting from second row to print the first col
		
	; ; bPrintFirstColumn:
			; ; mov ah, 02h
			; ; int 10h
			; ; mov ax, 0E2Ah
			; ; int 10h
			; ; add dh, 1
			; ; cmp dh, 17h
			
			; ; jne bPrintFirstColumn
			
		; ; mov dx, 0x0127	; pointing to the last column for printing
		
	; ; bPrintSecondColumn:
			; ; mov ah, 02h
			; ; int 10h
			; ; mov ax, 0E2Ah
			; ; int 10h
			; ; add dh, 1
			; ; cmp dh, 17h
			
			; ; jne bPrintSecondColumn
		
		; ; ret
		

; ; delays:      push cx
			; ; mov cx, 0xFFFF
; ; loop1a:		loop loop1a
			; ; mov cx, 0xFFFF
; ; loop2a:		loop loop2a
			; ; pop cx
			; ; ret
; ; starts:	
	; ; call charprint	; printing one character in centre of screen
	
	; ; call borderPrint	; printing borders
	
	
	
	
	; interrupt for keypress
	; ; mov ah, 00h;
	; ; int 16h;
	
; setting the mode back to text
	; ; mov ah, 00h;
	; ; mov al, 03h;
	; ; int 10h;
	mov ax, 0x4c00
	int 0x21;
