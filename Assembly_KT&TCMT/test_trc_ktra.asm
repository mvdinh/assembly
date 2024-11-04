.model small
.stack 100h
.data   
    s1 db 'Nhap day so: $'
    s2 db 10, 13, 'Day toan so chan: $'
    s3 db 10, 13, 'Day toan so le: $'
    s db 100 dup(?) 
    t db ? 
    tmp db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, s1
    int 21h
    
    mov bx, 0
nhaptiep:
    mov ah, 1
    int 21h
    cmp al, '0'  
    je break
    sub al, 48
    mov s[bx], al
    inc bx
    jmp nhaptiep 
break:  

    mov ah, 9
    lea dx, s2
    int 21h
    
    mov cx, bx
    mov bx, 0 
    mov t, 2
tieptuc:    
    mov ah, 0
    mov al, s[bx]   
    mov tmp, al
    div t  
    cmp ah, 0
    je inra 
    jmp tiep
    
inra:
    mov ah, 2
    add tmp, 48
    mov dl, tmp
    int 21h    
tiep:
    inc bx
    cmp bx, cx
    jb tieptuc
                   
    mov ah, 9
    lea dx, s3
    int 21h
    
    mov cx, bx
    mov bx, 0
lap:
    mov ah, 0
    mov al, s[bx]  
    mov tmp, al
    div t
    cmp ah, 1
    je inle
    jmp tieptuc1
    
inle:
    mov ah, 2
    add tmp, 48
    mov dl, tmp
    int 21h
    
tieptuc1:
    inc bx
    cmp bx, cx
    jb lap 
main endp 