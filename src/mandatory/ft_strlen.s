global ft_strlen
extern __errno_location

section .text
	ft_strlen:
		test rdi, rdi
		mov rcx, 0

	loop:
		cmp byte [rdi + rcx], 0
		je done
		inc rcx
		jne loop

	done:
		mov rax, rcx
		ret 
