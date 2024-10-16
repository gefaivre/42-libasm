; 1st argument:	rdi -> fd
; 2nd argument:	rsi -> void *buf
; 3rd argument:	rdx -> size_t count
; ssize_t read(int fd, void *buf, size_t count);
section .text
	global ft_read
	extern __errno_location  ; includes ___error but for linux

ft_read:
	mov		rax, 0           ; rax = 0 (syscall number for read)
	syscall                  ; make the syscall
	test 	rax, rax          ; check if the syscall returned an error (rax < 0)
	js		fail_read         ; if the syscall failed, jump to fail_read
	ret                      ; return if successful

fail_read:
	neg		rax              ; make the error code positive
	push	rax              ; save the error code on the stack
    ; Use lea to load the address of __errno_location
    lea     rdi, [rel __errno_location]  ; Load address of __errno_location relative to RIP
    call    rdi              ; call __errno_location
	pop		QWORD [rax]      ; set errno to the error code (pop from stack)
	mov		rax, -1          ; return -1 to indicate failure
	ret                      ; returns rax
