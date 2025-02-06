include "emu8086.inc"


org 100h

.data
    next db 0ah, 0dh, "$"


.code
    Print "Ascending: 1, 2, 3, 4, 5, 8, 9"
    
    lea dx, next
    mov ah, 09h
    int 21h

    Print "Descending: 9, 8, 5, 4, 3, 2, 1"

ret




