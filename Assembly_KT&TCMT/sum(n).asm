  .model small
  .stack 100h
  .data
         s1 db 'nhap so n :$'
         s2 db 10,13, 'tong tu 1 den n : $' 
        
  .code
        main proc 
            mov ax,@data
            mov ds,ax
            
            ;hien s1
            
            mov ah,9
            lea dx, s1
            int 21h
            
            ;nhap
            mov ah,1
            int 21h ;ki tu luu trong al
            sub al,48
            mov bl,al ;n=bl
            
            mov ah,9
            lea dx,s2
            int 21h
            
            mov cl,1 ;i=1
            mov al,0 ;s=0
            
   congtiep:
            add al,cl ;n=n+1 al=al+cl
            inc cl    ;i=i+1
            cmp cl,bl
            jle congtiep
            
            mov ah,2
            mov dl,al
            add dl,48
            int 21h
            
            mov ah,4ch
            int 21h
            main endp
            end main 
            
         
            
           
            
                                                       2w1
            
          