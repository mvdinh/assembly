.model small
.stack 100h
.data    
   s db  '12:21:32$'
  ngay  db ?
  thang db ?
  nam   dw  ?
  cn    db  'chu nhat $'
  thu   db  'thu $'
  
  
.code
main proc  

    mov ax, @data
    mov ds, ax 
back:     
    mov ah, 2ah
    int 21h
    
    ;al=thu
    ;dl=ngay
    ;dh=thang
    ;dx=nam
    
    mov ngay,dl
    mov thang,dh
    mov nam,cx
    
    cmp al,0
    je chunhat
    jmp thu1
chunhat:
mov ah,9
lea dx, cn
int 21h

jmp tiep 
thu1: 
add al,1 

mov bh, al
mov ah,9
lea dx,thu
int 21h

mov ah,2
mov dl,bh
add dl,48
int 21h


tiep:
mov ah,2

mov  dl,32
int  21h

mov al,ngay
mov ah,0
mov bl,10
div bl
add al,48
add ah,48

mov bh,ah
mov ah, 2
mov dl,al
int 21h
mov dl,bh
int 21h
mov dl, '/'
int 21h

mov al,thang
mov ah,0
div bl
add al,48
add ah,48
mov bh,ah

mov ah,2
mov dl,al
int 21h
mov dl,bh
int 21h
mov dl, '/'
int 21h 

 mov ax,nam
 mov cx,4
 mov bx,10
 
 chia:
 mov dx,0
 div bx
 push dx
 loop chia
 
 mov cx, 4
hiennam:

pop dx
add dl,48
mov ah,2 
int 21h
loop hiennam 


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

 

mov ah,4ch
int 21h



    
    


    
  
   
main endp
end main
