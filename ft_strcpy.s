
; 1st argument:	rdi -> char *dst
; 2nd argument:	rsi -> const char *src
section .text
    global ft_strcpy

ft_strcpy:
    xor rcx, rcx                 ; set RAX to 0 (used as index)
while_src:
    mov al, byte [rsi + rcx]     ; Load byte from source into AL
    mov byte [rdi + rcx], al     ; Store byte into destination
    inc rcx                      ; Increment index
    cmp  al, 0                    ; If zero, exit loop
    jne while_src               ; Loop
    mov rax, rdi
    ret