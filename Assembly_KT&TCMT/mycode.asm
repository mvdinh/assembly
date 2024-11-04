    .model small
    .stack 100h
    .data                   
              s1 db 's=$'
              s2 db 10,13,'so vua nhap=$'
              a  dw 0
    .code 
                 main proc
                        mov ax, @data
                        mov ds,ax
                        
                        mov ah,9
                        lea dx,s1
                        int 21h 
                        
                        mov bx,10
                        mov cx,0
                      
               nhaptiep:
                       mov ah,1
                       int 21h
                       cmp al,13
                       je enter
                       sub al,48
                       mov cl,al
                       mov ax,a
                       mul bx
                       add ax,cx
                       mov a,ax
                       jmp nhaptiep
                       
                 enter:
                       mov ah,9
                       lea dx,s2
                       int 21h
                       
                       mov bx,10
                       mov ax,a
                       mov cx,0
                       
              chiatiep:
                       mov dx,0
                       div bx
                       cmp ax,0
                       je kt
                       push dx
                       inc cl
                       jmp chiatiep
                       
                   kt:
                      push dx
                      inc cl
                      intiep:
                      mov ah,2
                      pop dx
                      add dl,48
                      int 21h
                      loop intiep
                      
                      mov ah,4ch
                      int 21h
                 
                    main endp
                 end main
                        
                    