include "emu8086.inc"
org 100h

.data
    input db ?
    nxt db 0ah, 0dh, "$"
    
.code
    mov ax, @data
    mov ds, ax
    
    mov cx, 2
    
    ml:    
        call inp
        call show
    loop ml
    
    call exit
    
    inp proc
        print "Enter a num: "
        mov ah, 01h
        int 21h
        mov [input], al
        ret
    inp endp
    
    show proc
        call newline
        print "Input: "
        mov dl, [input]
        mov ah, 02h
        int 21h 
        
    newline proc
        mov ah, 09
        lea dx, nxt
        int 21h
        ret
    newline endp
    
    exit proc
        mov ah, 04ch
        int 21h
        ret
    exit endp
ret