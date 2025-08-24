global ft_write
extern __errno_location

section .text

	ft_write:
		xor rcx, rcx
		test rsi, rsi
		je .null_rsi
		jne .not_null_rsi

	.rsi_len:
		cmp byte [rsi + rcx], 0
		je .done
		inc rcx
		jmp .rsi_len

	.null_rsi:
		mov rax, 0
		ret

	.null_rsi_error:
		mov rax, 0
		ret

	.not_null_rsi:
		call .rsi_len
		add rcx, 1
		cmp rcx, rdx
		jl .count_is_too_much
		mov rax, 1
		syscall
		cmp rax, 0
		jl .set_errno
		ret

	.count_is_too_much:
		mov rax, 0
		ret

	.set_errno:
		neg rax
		mov rdi, rax
		call __errno_location wrt ..plt
		mov [rax], rdi
		mov rax, -1
		ret

	.done:
		ret