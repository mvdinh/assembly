; nhap xau, doi thanh chu hoa
.model small
.stack 100h
.data
    s1  db  'nhap xau: $'
    s2  db  10, 13, 'xau vua nhap: $'
    s3  db  10, 13, 'xau chu hoa: $'
    s   db  100 dup(?)
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        ; index = 0
        mov bx, 0
        ; nhap
nhaptiep:
        mov ah, 1
        int 21h
        cmp al, 13
        je  enter
        mov s[bx], al
        inc bx
        jmp nhaptiep
        
enter:  
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov cx, bx
        mov bx, 0
intiep:        
        mov ah, 2
        mov dl, s[bx]
        int 21h
        inc bx
        loop intiep
        
        mov cx, bx
        mov bx, 0
doitiep:        
        cmp s[bx], 97
        jl  chuhoa
        sub s[bx], 32
chuhoa:        
        inc bx
        cmp bx, cx
        jle doitiep
        
        mov ah, 9
        lea dx, s3
        int 21h
        
        mov cx, bx
        mov bx, 0
intiep1:        
        mov ah, 2
        mov dl, s[bx]
        int 21h
        inc bx
        loop intiep1

        mov ah, 4ch
        int 21h
        main endp
    end main