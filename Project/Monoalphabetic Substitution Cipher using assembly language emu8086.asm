include "emu8086.inc"

   encryption macro
       Lea dx, string
       mov ah, 09h
       int 21h  
       
       
       mov ah, 01
       int 21h
       sub al, 48
       mov ah, 0
       mov bx, ax
       
       LEA DX, NEWLINE           
       MOV AH, 09H               
       INT 21H         
       
       mov cx, bx
       mov textSize, cx
       mov si, 0
       
       LEA DX, enterTextString           
       MOV AH, 09H               
       INT 21H         
       
       
       
       takeInputFromUsers:
          mov ah, 01
          int 21h
          mov ah, 0
          sub al,48
          mov array[si],al
          inc si
       loop takeInputFromUsers
       
       
       LEA DX, NEWLINE           
       MOV AH, 09H               
       INT 21H
       
       
       
       LEA DX, encryptedString           
       MOV AH, 09H               
       INT 21H
       
       
       mov cx,textSize
       mov si,0 
       printEncryptedText: 
          mov dl, array[si]
          add dl, 48
          
          cmp dl, 'z'
            je printz
          cmp dl, ' '
            je printSpace
            add dl, 1
            mov ah, 02h
            int 21h
            inc si
            
            
            jmp go:
            printz:
            sub dl, 25   ; z --> a
            mov ah, 02h
            int 21h
            inc si
            jmp go:
           
            
            printSpace:
            mov ah, 02h
            int 21h
            inc si
            
            
            go:

       loop printEncryptedText
   
   
   ENDM 
    
   
   
   
   decryption macro
       Lea dx, string
       mov ah, 09h
       int 21h  
       
       
       mov ah, 01
       int 21h
       sub al, 48
       mov ah, 0
       mov bx, ax
       
       LEA DX, NEWLINE           
       MOV AH, 09H               
       INT 21H         
       
       mov cx, bx
       mov textSize, cx
       mov si, 0
       
       LEA DX, enterTextString           
       MOV AH, 09H               
       INT 21H         
       
       
       
       takeInputFromUsersForDec:
          mov ah, 01
          int 21h
          mov ah, 0
          sub al,48
          mov array[si],al
          inc si
       loop takeInputFromUsersForDec
       
       
       LEA DX, NEWLINE           
       MOV AH, 09H               
       INT 21H
       
       
       
       LEA DX, decriptedString           
       MOV AH, 09H               
       INT 21H
       
       
       mov cx,textSize
       mov si,0 
       printdeccryptedText: 
          mov dl, array[si]
          add dl, 48
          
          cmp dl, 'a'
            je printa
          cmp dl, ' '
            je printSpaces
            sub dl, 1
            mov ah, 02h
            int 21h
            inc si
            
            
            jmp goes:
            printa:
            add dl, 25
            mov ah, 02h
            int 21h
            inc si
            jmp goes:
           
            
            printSpaces:
            mov ah, 02h
            int 21h
            inc si
            
            
            goes:

       loop printdeccryptedText
   
   
   ENDM
   
   
    
    
org 100h
         
    .DATA 
       string dw "How many alphabets you want to convert ?    $"
       encryptedString dw "Here is the encrypted version of your sentence : $"
       enterTextString dw "Enter all your string : $" 
       decriptedString dw "Here is the decrypted version of your sentence : $"
       
       
       NEWLINE DB 0Dh, 0Ah, "$"  
       array db 30 DUP(?)
       textSize dw 0
       
       
       whatYouWannado db "Press 1 for encryption and 2 for decryption :  $"
       selection db 0   
         
    .CODE    
       MOV AX, @DATA
       MOV DX, AX
       
       Lea dx, whatYouWannado
       mov ah, 09h
       int 21h
       
       mov ah, 01
       int 21h
       sub al, 48
       
       mov selection, al
       
       Lea dx, NEWLINE
       mov ah, 09h
       int 21h
       
       mov ax, 0
       mov bx, 0
       
       
       cmp selection, 1
          je encr
       cmp selection, 2
          je decr
       
       print "Invalid input selection ..!"
       mov ah, 04ch
       int 21h
       
       encr:
        encryption
        ret
       
       decr:
        decryption
        ret 
                            
ret




