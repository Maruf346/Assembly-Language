include "emu8086.inc"

org 100h

.data
    arr db 9,3,4,5,1,2,3

.code 
    mov ax, @data
    mov ds, ax
    
    mov si, offset arr
    mov cx, 7
    
    xor bx, bx
    
    myLoop:
        mov dl, [si]
        
        add bl, dl
        
        add dl, 48
        mov ah, 02h
        int 21h
        print ", "
        inc si 
    loop myLoop
    
    print "   Sum: "
    mov dl, bl
    add dl, 48
    mov ah, 02h
    int 21h
    
ret




