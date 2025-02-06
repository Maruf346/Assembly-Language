org 100h
.model small
.stack 100h

.data
    msg1 db 'Alphabet$', 0    ; Message for alphabet
    msg2 db 'Digit$', 0       ; Message for digit
    msg3 db 'Others$', 0      ; Message for other characters
    msg4 db 'Enter Input: $', 0  ; Prompt message
    newline db 0dh, 0ah, '$'  ; Newline character

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Prompt for input
    mov ah, 9
    lea dx, msg4
    int 21h

    ; Read character input
    mov ah, 1
    int 21h
    mov bl, al  ; Move input to BL register

    ; Print newline
    mov ah, 9
    lea dx, newline
    int 21h

    ; Check character category
    cmp bl, '0'  ; Check if it's a digit (ASCII '0')
    jb others    ; Jump if below '0'
    cmp bl, '9'  ; Check if it’s less than or equal to '9'
    jbe print_digit  ; If true, it's a digit, jump to print_digit

    ; Check if the character is an uppercase letter (A-Z)
    cmp bl, 'A'
    jb others    ; Jump if below 'A'
    cmp bl, 'Z'
    jbe print_alphabet  ; If true, it's an uppercase letter, jump to print_alphabet

    ; Check if the character is a lowercase letter (a-z)
    cmp bl, 'a'
    jb others    ; Jump if below 'a'
    cmp bl, 'z'
    jbe print_alphabet  ; If true, it's a lowercase letter, jump to print_alphabet

others:
    ; Print "Others"
    mov ah, 9
    lea dx, msg3
    int 21h
    jmp end_program

print_digit:
    ; Print "Digit"
    mov ah, 9
    lea dx, msg2
    int 21h
    jmp end_program

print_alphabet:
    ; Print "Alphabet"
    mov ah, 9
    lea dx, msg1
    int 21h
    jmp end_program

end_program:
    ; Terminate the program
    mov ah, 4Ch
    int 21h

main endp
end main
