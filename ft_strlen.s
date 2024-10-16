section .text
    global ft_strlen            ; Declare the strlen function to be accessible from other files

ft_strlen:
    ; Input: RDI points to the string
    mov rax, -1               ; Clear RAX (used as the length counter)


strlen_loop:
    inc rax                     ; Increment the length counter
    cmp byte [rdi + rax], 0             ; Check if the byte is the null terminator
    jne strlen_loop             ; If it is, redo

    ret                         ; Return from function, length is in RAX
