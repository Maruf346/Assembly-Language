include "emu8086.inc"

org 100h
.data
    nL db 0ah, 0dh, "$"

.code    
    mov cx, 10
    
    start:
        print "Hello "
        
        mov dl, cl
        add dl, 48
        mov ah, 02h
        int 21h
        
        mov al, 0h
        mov dl, al
        add dl, 48
        mov ah, 02h
        int 21h
        
        mov ah, 09h
        lea dx, nL
        int 21h
        
        ;inc al 
        loop start 

ret




