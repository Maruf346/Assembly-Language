include "emu8086.inc"
ORG 100h

.DATA
    A DB 3, 1, 1, 2, 1  
    ODD_SUM DB 0            
    EVEN_SUM DB 0             
    NEXT DB 0DH, 0AH, "$"

.CODE 

CHECK_ODD_EVEN MACRO VALUE
    MOV AL, VALUE            
    AND AL, 1               
    JZ EVEN_CASE            

    ADD DL, VALUE            
    JMP DONE
EVEN_CASE:
    ADD BL, VALUE            
DONE:
ENDM

START:
    MOV AX, @DATA                 
    MOV DS, AX

    MOV SI, OFFSET A              
    MOV CX, 5                     

    XOR BL, BL                    
    XOR DL, DL                    

PROCESS_ARRAY:
    MOV AL, [SI]                  
    CHECK_ODD_EVEN AL             
    INC SI                       
    LOOP PROCESS_ARRAY           

    ; Store results
    MOV [ODD_SUM], DL
    MOV [EVEN_SUM], BL

    ; Display odd sum
    LEA DX, NEXT                  
    MOV AH, 09H
    INT 21H

    Print "ODD Digits Sum: "

    MOV AL, [ODD_SUM]            
    ADD AL, 48                    
    MOV DL, AL
    MOV AH, 02H                  
    INT 21H

    ; Display even sum
    LEA DX, NEXT                  
    MOV AH, 09H
    INT 21H

    Print "EVEN Digits Sum:"
   
    MOV AL, [EVEN_SUM]           
    ADD AL, 48                  
    MOV DL, AL
    MOV AH, 02H                  
    INT 21H

    ; Exit 
    MOV AH, 4CH
    INT 21H
