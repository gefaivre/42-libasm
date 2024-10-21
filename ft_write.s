
; 1st argument:	rdi -> in fd
; 2nd argument:	rsi -> const void *buf
; 3rd argument:	rdx -> size_t count
; ssize_t write(int fd, const void *buf, size_t count);
section .text
	global ft_write
	extern __errno_location	; includes ___error but for linux

ft_write:
	mov		rax, 1			; rax = 1
	syscall					; syscall(rax = calls index, also takes rdi and rsi as arguments)
	test 	rax, rax		; bitwise "AND" operation, triggers the SF flag if it's signed (negative)
	js		fail			; if SF = 1 -> rax is negative -> syscall returned an error
	ret						; return

fail:
	neg		rax				; changes rax to positive, the positive error num is needed
	push	rax				; pushing rax to pile to preserve the error value
	call	__errno_location ; Load address of __errno_location relative to RIP
	pop		QWORD [rax]		; we pop the value stored earlier into the errno address (as a 64-bit qword)
	mov		rax, -1			; we change rax to -1 so that ft_write returns it failed
	ret						; returns rax