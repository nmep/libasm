global ft_read
extern __errno_location

section .text
	ft_read:
		cmp rdx, 0
		jl .error
		mov rax, 0
		syscall
		cmp rax, 0
		jl .sett_errno
		ret

	.error:
		mov rax, 0
		ret
	
	.sett_errno:
		neg rax
		mov rdi, rax
		call __errno_location wrt ..plt
		mov [rax], rdi
		mov rax, -1
		ret
