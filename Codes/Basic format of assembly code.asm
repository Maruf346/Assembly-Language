include 'emu8086.inc'   ; helpful
org 100h

.data
    A dw 3
    B dw 2
    Res dw ?
    NEXT DB 0DH,0AH,"$"
    n db ?
    
.code
    mov ax, @data    ;data ax a niye jabe
    mov ds, ax       ;ax k data segment a niye jabe
    
    ;mov ax, A
    ;mul B    
    ;mov Res, ax
    
    ;print "     "
    
    ;mov ax, Res
    ;add al, 48
    ;mov dl, al
    ;mov ah, 02h
    ;int 21h
    
    ;print "Printing Newline... "  ; printing function
    
    ;mov ah, 09h    ; new line
    ;LEA DX, NEXT 
    ;INT 21H
    
    ; printing a num with hexa
    ;mov ax, 7
    ;add al, 30h
    ;mov dl, al
    ;mov ah, 02h
    ;int 21h
    
    ;mov ah, 09h
    ;lea dx, NEXT
    ;int 21h
    
    ;read
    print "Enter a number: "
    mov ah, 01h          ;read
    int 21h
    mov n, al 
    mov dl, n

    
    print "    The num is: "
    ;add bl, 30h          ; to ascii
    mov ah, 02h          ; print
    int 21h
    
ret                                                                                                   