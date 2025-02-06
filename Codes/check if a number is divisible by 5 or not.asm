.model small
.stack 100h

.data
    message db 10, 13, "Enter a number: $"
    divisible_message db 10, 13, "The number is divisible by 5.$"
    not_divisible_message db 10, 13, "The number is not divisible by 5.$"
    newline db 10, 13, '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display the "Enter a number: " message
    mov ah, 09h
    lea dx, message
    int 21h

    ; Read a number character by character
    xor cx, cx  ; Clear CX to store the number
input_loop:
    mov ah, 01h
    int 21h
    cmp al, 13  ; Check for Enter key
    je done_input
    sub al, '0'  ; Convert ASCII to number

    ; Multiply CX by 10 (CX * 10)
    mov bx, cx
    shl cx, 1   ; cx = cx * 2
    shl cx, 1   ; cx = cx * 4 (cx * 2 * 2)
    add cx, bx  ; cx = cx * 10 (cx * 4 + cx * 2)
    add cx, ax  ; Add the new digit

    jmp input_loop

done_input:
    ; Check if the number is divisible by 5
    mov ax, cx
    xor dx, dx
    mov bx, 5
    div bx

    ; Check if the remainder is 0
    cmp dx, 0
    jne not_divisible

    ; If divisible by 5
    mov ah, 09h
    lea dx, divisible_message
    int 21h
    jmp exit_program

not_divisible:
    ; If not divisible
    mov ah, 09h
    lea dx, not_divisible_message
    int 21h

exit_program:
    ; Terminate the program
    mov ax, 4C00h
    int 21h

main endp
end main
