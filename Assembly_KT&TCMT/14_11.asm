.model stack
.stack 100h
.data 


.code
    main proc
        mov ah,@data
        mov ds,ax
        
        ;bam chuot toa do nam trong cx va dx
        
         
        
        mov ah, 4ch
        int 21h
        
    endp main