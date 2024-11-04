  .model small
  .stack 100h
  .data
         s1 db 'Nhap vao ki tu :$'
         s2 db 10,13, 'ki tu vua nhap: $' 
         s3 db  10,13, 'Ki tu dung truoc la: $'
         s4 db 10,13 ,'Ki tu dung sau la : $'
  .code
        main proc
            ;hien s1
            
            mov ah, 9
            lea dx, s1
            int 21h
            ;nhap
            mov ah,1
            int 21h ;ki tu luu trong al
            mov bl,al
            ;hien s2
            mov ah,9
            lea dx, s2
            int 21h
            ;hien ki tu
            mov ah,2
            mov dl,bl
            int 21h
            
            ;hien s3
            mov ah,9
            lea dx,s3
            int 21h
            
            ;hien s4
            mov ah,9
            lea dx,s4
            int 21h
            
            mov ah,2
            mov dl,bl
            add dl,1
            int 21h
            
            mov ah, 4ch
            int 21h
            
        main endp
  end main