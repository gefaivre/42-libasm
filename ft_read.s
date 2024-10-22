; ssize_t read(int fd, void *buf, size_t count);
; rdi -> int fd
; rsi -> void *buf
; rdx -> size_t count
section .text
    global ft_read
    extern __errno_location      ; Use __errno_location (Linux) or __error (MacOS)

ft_read:
    mov     rax, 0               ; Set RAX to o, the syscall number for read
    syscall                      ; Invoke the syscall with the number stored in RAX, result is stored in RAX too
    test    rax, rax             ; Check if the syscall returned an error (RAX < 0)
    js      fail_read            ; If the sign flag (SF) is set, RAX is negative -> syscall error
    ret                          ; Return if no error (RAX contains the number of bytes read)

fail_read:
    neg     rax                  ; Negate RAX to make the error code positive (errno expects a positive value)
    push    rax                  ; Push the negated error code onto the stack to preserve it
    call    __errno_location     ; Get the address of errno and load it into RAX
    pop     QWORD [rax]          ; Store the saved error code into the location pointed to by RAX (errno)
    mov     rax, -1              ; Set RAX to -1 to indicate the function call failed
    ret
