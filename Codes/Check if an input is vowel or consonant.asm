
org 100h

.data
    character db ?                       ; Character input by the user
    vowel_msg db 10, 13, 'Vowel', 10, 13, '$'
    consonant_msg db 10, 13, 'Consonant', 10, 13, '$'
    invalid_msg db 10, 13, 'Not a character', 10, 13, '$'
    prompt db 10, 13, 'Enter a character: $'

prompt_input macro msg
    mov ah, 9                            ; DOS interrupt to print string
    lea dx, msg                          ; Load address of message into dx
    int 21h                              ; Call DOS interrupt
endm

input_char macro char
    mov ah, 1                            ; DOS interrupt to take input
    int 21h                              ; Call DOS interrupt
    mov char, al                         ; Move the character from AL to char
endm

check_vowel_consonant macro char
    mov ah, 0
    mov al, char

    ; Check for uppercase alphabet (A-Z)
    cmp al, 'A'
    jb invalid_char                      ; If character is before 'A', jump to invalid_char
    cmp al, 'Z'
    ja lowercase_check                   ; If character is after 'Z', check lowercase

    jmp check_result

lowercase_check:
    ; Check for lowercase alphabet (a-z)
    cmp al, 'a'
    jb invalid_char                      ; If character is before 'a', jump to invalid_char
    cmp al, 'z'
    ja invalid_char                      ; If character is after 'z', jump to invalid_char

check_result:
    ; Check if character is a vowel
    cmp al, 'A'
    je vowel_case
    cmp al, 'a'
    je vowel_case
    cmp al, 'E'
    je vowel_case
    cmp al, 'e'
    je vowel_case
    cmp al, 'I'
    je vowel_case
    cmp al, 'i'
    je vowel_case
    cmp al, 'O'
    je vowel_case
    cmp al, 'o'
    je vowel_case
    cmp al, 'U'
    je vowel_case
    cmp al, 'u'
    je vowel_case

    ; If not a vowel, it's a consonant
    jmp consonant_case

vowel_case:
    prompt_input vowel_msg
    jmp end_check

consonant_case:
    prompt_input consonant_msg
    jmp end_check

invalid_char:
    prompt_input invalid_msg

end_check:
endm

.code
main proc
    ; Display the prompt and get the character input
    prompt_input prompt
    input_char character

    ; Check if the input is a vowel or consonant
    check_vowel_consonant character

    ; Terminate the program
    mov ah, 4Ch
    int 21h
main endp
end main
