include "emu8086.inc"
org 100h

.data
    nxt db 0ah, 0dh, "$"
    input db ?

.code
    mov ax, @data
    mov ds, ax
    
    mov cx, 7
    mov si, offset input
    mov di, offset input
    print "  Enter an array: "
    
    myLoop:
        call inp
        mov [si], al
        inc si                 
    loop myLoop
    
    call Ascending 
    call descending
    call exit
    
    inp proc
        print " "
        mov ah, 01h
        int 21h        
        sub al, '0'     ; or 30h or 48
        ret
    inp endp
    
    Ascending proc
        call newline
        print "Ascending: "
        
        mov si, offset input
        mov di, si
        inc di
        mov cx, 7
        loop2:
            cmp si, di
            jge update1
            
            update1:
            call updateAsc
            mov bl, [si]
            mov dl, bl
            add dl, 48
            
            mov ah, 02
            int 21h
            inc di
                        
            print ", "
            
        loop loop2
        ret 
    Ascending endp 
    
    updateAsc proc
        xchg [si], [di]
        ret
    updateAsc endp
    
    descending proc
        call newline
        print "Descending: " 
        
        mov si, offset input
        mov di, si
        inc di
        mov cx, 7
        loop3:
            mov bl, [di]
            mov dl, bl
            add dl, 48
            
            cmp si, di
            jbe update2
            
            update2:
            call updateDesc
            mov ah, 02
            int 21h
            inc di
                        
            print ", "
            dec cx
        loop loop3
        ret 
    descending endp
    
    updateDesc proc
        xchg [si], [di]
        ret
    updateDesc endp
    
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