
; 1st argument:	rdi -> char *s1
; 2nd argument:	rsi -> const char *s2
; int strcmp(const char *s1, const char *s2);
section .text
    global ft_strcmp

ft_strcmp:
    xor rax, rax
    mov rcx, -1                ; set RCX to 0 (used as index)
while_cmp:
    inc rcx
    mov al, byte [rdi + rcx] 
    mov bl, byte [rsi + rcx] 
    cmp bl, al
    jl is_less
    jg is_greater
    cmp al, 0
    jne while_cmp
    mov rax, 0
    ret

is_less:
    xor rax, rax
    mov rax, 1
    ret

is_greater:
    xor rax, rax
    mov rax, -1
    ret
