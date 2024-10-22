; char    *ft_strcpy(char *dest, const char *src);
; rdi -> char *dest
; rsi -> const char *src
section .text
    global ft_strcpy

ft_strcpy:
    xor rcx, rcx                    ; Set RCX to 0 (used as index)
while_src:
    mov al, byte [rsi + rcx]        ; Load byte from source (src) into AL
    mov byte [rdi + rcx], al        ; Store byte into destination (dest)
    inc rcx                         ; Increment index
    cmp al, 0                       ; Check if the byte is the null terminator ('\0')
    jne while_src                   ; If it's not, continue the loop
    mov rax, rdi                    ; Set RAX to the destination pointer (dest) to return it
    ret