include "emu8086.inc"
org 100h

.data
    nL db 0ah, 0dh, "$"    

.code
    mov al, 7
    mov bl, 2
    
    div bl       ; al/bl --> ah: rem, al --> quotient
    
    mov bx, ax
    
    print "Quotient: "
    mov dl, bl
    add dl, 48
    mov ah, 02h
    int 21h
    
    mov ah, 09h   ; next line
    lea dx, nL
    int 21h
    
    print "Remainder: "
    mov dl, bh
    add dl, 48
    mov ah, 02h
    int 21h
    
ret




