section .text
    global  ft_strdup
    extern  malloc           ; Including malloc, ft_strlen, and ft_strcpy
    extern  ft_strlen
    extern  ft_strcpy

ft_strdup:                   ; ft_strdup receives the source string's address in rdi

    push    rdi              ; Save the value of rdi to use later in ft_strcpy
    call    ft_strlen        ; Call ft_strlen, which takes rdi and returns the length in rax
    inc     rax              ; Increment rax by one to account for the null terminator ('\0')
    mov     rdi, rax         ; Move the value in rax to rdi as the size for malloc
    call    malloc           ; Call malloc to allocate memory of size rdi
    cmp     rax, 0           ; Compare the return value of malloc (rax) with 0 (NULL)
    je      fail             ; If rax is 0, malloc failed, so jump to fail
    mov     rdi, rax         ; Move the allocated memory address to rdi (first argument for ft_strcpy)
    pop     rsi              ; Pop the saved source address from the stack into rsi (second argument for ft_strcpy)
    call    ft_strcpy        ; Call ft_strcpy to copy the source (rsi) to the allocated memory (rdi)
    ret                      ; Return, with rax holding the duplicated string's address

fail:
    mov     rax, 0           ; If malloc failed, set rax to 0 (NULL) to indicate failure
    ret