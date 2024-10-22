; int strcmp(const char *s1, const char *s2);
; rdi -> char *s1
; rsi -> const char *s2
section .text
    global ft_strcmp

ft_strcmp:
    mov rcx, -1                 ; Set RCX to -1 (used as an index)

while_cmp:
    inc rcx                     ; Increment index
    mov al, byte [rdi + rcx]    ; Load byte from s1 into AL
    mov bl, byte [rsi + rcx]    ; Load byte from s2 into BL
    cmp bl, al                  ; Compare bytes from s1 and s2
    jl is_less                  ; If s1 byte is less than s2 byte, jump to is_less
    jg is_greater               ; If s1 byte is greater than s2 byte, jump to is_greater
    cmp al, 0                   ; Check if the byte is the null terminator ('\0')
    jne while_cmp               ; If not, continue comparing

    mov rax, 0                  ; If strings are equal, set RAX to 0 and return
    ret

is_less:
    mov rax, -1                 ; Set RAX to -1 (s1 < s2)
    ret

is_greater:
    mov rax, 1                  ; Set RAX to 1 (s1 > s2)
    ret
