.model small
.stack 100h
.data
    s   db  'bam phim Q/q de dung lai $'
.code
    main proc
        mov ax,@data;
        mov ds, ax
        
       back:
        mov ah,2
        mov dl,7
        int 21h
        
        mov ah,1
        int 16h
        je back
        mov ah,0
        int 16h  
        cmp al,'q'
        je thoat
        cmp al,'Q'
        je thoat
        jmp back
    thoat:    
        mov ah,4ch
        int 21h
        
    endp main