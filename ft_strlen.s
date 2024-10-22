; int		ft_strlen(char const *str);
; rdi -> char const *str
section .text
    global ft_strlen            ; Declare the ft_strlen function global to be accessible from other files

ft_strlen:
    mov rax, -1                 ; Set counter (RAX) to -1 | int i = -1

strlen_loop:
    inc rax                     ; Increment the counter
    cmp byte [rdi + rax], 0     ; Check if the byte at [rdi + rax] is the null terminator (0 = ASCII value)
    jne strlen_loop             ; If it's not equal, jump back to strlen_loop

    ret
