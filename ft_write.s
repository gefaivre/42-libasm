; ssize_t write(int fd, const void *buf, size_t count);
; rdi -> int fd
; rsi -> const void *buf
; rdx -> size_t count
section .text
    global ft_write
    extern __errno_location      ; Use __errno_location (Linux) or __error (MacOS)

ft_write:
    mov     rax, 1               ; Set RAX to 1, the syscall number for write
    syscall                      ; Invoke the syscall with the number stored in RAX, result is stored in RAX too
    test    rax, rax             ; Perform a bitwise "AND" on RAX; sets flags based on the result
    js      fail                 ; If the sign flag (SF) is set, RAX is negative -> syscall error
    ret                          ; Return if no error (RAX contains the number of bytes written)

fail:
    neg     rax                  ; RAX * -1 to make it positive (errno expects a positive value)
    push    rax                  ; Push the negated value onto the stack to preserve it
    call    __errno_location     ; Get the address of errno and load it into RAX
    pop     QWORD [rax]          ; Pop the saved value into the location pointed to by RAX (errno)
    mov     rax, -1              ; Set RAX to -1 to indicate the function call failed
    ret
