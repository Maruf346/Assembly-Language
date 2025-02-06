include "emu8086.inc"

org 100h

.data

    A db ?
    B db ?
    NL db 0ah, 0dh, "$"


.code
    mov ax, @data
    mov ds, ax
    
    print "Enter a character: "
    mov ah, 01h
    int 21h    
    mov [A], al
    
    print "   Enter another character: "
    mov ah, 01h
    int 21h    
    mov [B], al
    
    mov ah, 09h
    lea dx, NL
    int 21h
    
    mov al, [A]
    mov bl, [B]
    
    
    
    cmp al, bl
    jbe order     ; al<=bl
    xchg al, bl   ; Swap characters if al > bl
    
   order:
    print "Ordered: "
    mov dl, al
    mov ah, 02h
    int 21h 

    print "-> "
    
    mov dl, bl
    mov ah, 02h
    int 21h 
    
    mov ah, 09h
    lea dx, NL
    int 21h
    
ret