.model small
.stack 100h
.data
    s1  db  'nhap xau:$'
    s2  db  10,13,'xau vua nhap: $'
    s   db 100 dup(?)
 .code
    main proc
        mov ax, @data
        mov ds,ax
        
        mov ah,9
        lea dx, s1
        int 21h
        
        mov bx,0
        
  nhaptiep:
        mov ah,1
        int 21h
        cmp al,13
        je enter
        mov s[bx],al
        inc bx
        jmp nhaptiep
        
     enter:
        mov ah,9
        lea dx,s2
        int 21h
        
        mov cx,bx
        mov bx,0
        
      intiep:
        mov dl,s[bx]
        mov ah,2
        int 21h
        inc bx
        loop intiep
        
        mov ah,4ch
        int 21h
        
        main endp