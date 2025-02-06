ORG 100h

.DATA
    SUM DW 0
    msg_1 DB 'Sum (Loop): $'
    msg_2 DB 'Sum (Formula): $'
    newline DB 0DH, 0AH, '$'

.CODE
    MOV AX, @data
    MOV DS, AX

    ; Summation using Loop
    MOV CX, 1
    MOV BX, 0
loop_sum:
    ADD BX, CX
    ADD CX, 2
    CMP CX, 101
    JNE loop_sum
    MOV SUM, BX

    ; Display Loop Summation
    LEA DX, newline
    MOV AH, 09H
    INT 21H
    LEA DX, msg_1
    MOV AH, 09H
    INT 21H
    MOV AX, [SUM]
    CALL print_number

    ; Summation using Formula
    MOV AX, 50
    MUL AX

    ; Display Formula Summation
    LEA DX, newline
    MOV AH, 09H
    INT 21H
    LEA DX, msg_2
    MOV AH, 09H
    INT 21H
    CALL print_number

    ; Exit program
    MOV AH, 4CH
    INT 21H

; Subroutine to print a number in AX
print_number:
    XOR CX, CX
    MOV BX, 10
convert_loop:
    XOR DX, DX
    DIV BX
    PUSH DX
    INC CX
    CMP AX, 0
    JNE convert_loop

print_digits:
    POP DX
    ADD DL, '0'
    MOV AH, 02H
    INT 21H
    LOOP print_digits
    RET
