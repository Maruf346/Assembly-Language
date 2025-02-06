
include "emu8086.inc"

org 100h

.data
    arr1 db 1, 2, 3, 4
    arr2 db 1, 2, 3, 4
    next db 0ah, 0dh, "$"

.code
    mov ax, @data
    mov ds, ax
    
    mov si, offset arr1
    mov di, offset arr2
    
    mov cx, 4
    myLoop:
        mov al, [si]
        mov bl, [di]
        
        cmp al, bl        
        jne notsame
        
        inc si
        inc di 
        
    loop myLoop
    
    print "same"
    mov ah, 04ch
    int 21h
    
    notsame:
        print "not Same"
        mov ah, 04ch
        int 21h    

ret