                                     .model small
.stack 100h
.data
  s db  '12:21:32$'
 
  
.code
        main proc
mov ax, @data
mov ds,ax
back:
    mov ah,2ch
    int 21h; ch;gio cl:phut  db:giay  
    
    
 

    mov al,ch
    mov ah,0
mov bl,10
div bl
add al,48
add ah,48
mov s,al
mov s+1,ah

mov al,cl
mov ah,0
div bl
add al,48
add ah,48
mov s+3,al
mov s+4, ah

mov al,dh
mov ah,0
div bl
add al,48
add ah,48
mov s+6,al
mov s+7,ah

mov ah,9
lea dx,s
int 21h
mov ah,2
mov dl,13
int 21h
jmp back   
mov ah, 4ch
int 21h 

main endp
end main 