global ft_strlen

section .text
	ft_strlen:
		mov rcx, 0

	loop:
		cmp byte [rdi + rcx], 0
		je done
		inc rcx
		jne loop

	done:
		mov rax, rcx
		ret 
