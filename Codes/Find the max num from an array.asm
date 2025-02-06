include "emu8086.inc"

org 100h

.data
    arr db 6,2,3,4,5
    ;nxt db 01h, 0dh, "$"
    
.code
    mov ax, @data
    mov ds, ax
    
    mov si, offset arr
    
    mov cx, 5
    mov bl, [si]
        
    myloop:
        cmp bl, [si]
        
        jle update
        
        resume: 
            inc si
    loop myloop
    
    print "Max. num: "
    mov dl, bl
    add dl, 48
    mov ah, 02
    int 21h
    
    mov ah, 04ch
    int 21h
    
    update: 
        xchg bl, [si]
        int 21h
        jmp resume

ret