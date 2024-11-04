.model small
.stack 100h
.data
     s db '00/00/0000$'
.code
    main proc 
        mov ah,@data
        mov ds,ax 
        
        mov ah,2ch
        int 21h 
        ;al=thu trong tuan (0=cn, 6=thu bay
        ;dl=ngay(1-31)
        ;dh=thang(1-12)
        ;cx=nam(1980-2999)  
        
        mov al,cl
        mov ah,0
        
        
        mov ah,4ch
        int 21h
        
    endp main