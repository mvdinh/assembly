; nhap xau, in xau
.model small
.stack 100h
.data
    s1  db  'nhap xau: $'
    s2  db  10, 13, 'xau vua nhap: $'
    s   db  100 dup(?) 
    a dw 0
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov ax, 0
        mov cx, 0 
        mov bx, 10
                  
        mov ah, 1
        int 21h
        cmp al, 13
        je dung
        sub al, 48
        mov cl, al
        mov ax, a  
        mul bx
        add ax, cx  
        mov a, ax
        mov ah, 4ch
        int 21h
        main endp
    end main