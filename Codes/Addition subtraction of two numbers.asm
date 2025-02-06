include "emu8086.inc"
org 100h

.data
    A dw ?
    B dw ?         
    nL dw 0Ah, 0Dh, "$"
    
     
.code
    mov ax, @data
    mov ds, ax
    
    print "Enter a number: "
    mov ah, 01h
    int 21h
    ;sub al, 48
    mov A, ax
    
    mov ah, 09h ;newline
    lea dx, nL
    int 21h
    
    print "Enter another number: "
    mov ah, 01h
    int 21h
    ;sub al, 48
    mov B, ax
    
    mov ah, 09h ;newline
    lea dx, nL
    int 21h
    
    print "Sum: "
    mov bx, A
    ;add bl, 48
    
    mov ax, B
    ;add al, 48
    add bl, al
    
    sub bl, 48
    
    mov dl, bl
    mov ah, 02h
    int 21h
    
    mov ah, 09h ;newline
    lea dx, nL
    int 21h
    
    print "Subtraction: "
    mov bx, A
    ;add bl, 48
    
    mov ax, B
    ;add al, 48
    sub bl, al
    
    add bl, 48
    
    mov dl, bl
    mov ah, 02h
    int 21h
        
    
ret