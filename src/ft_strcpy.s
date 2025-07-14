global ft_strcpy

section .text

	ft_strcpy:
		mov rcx, 0
	
	strcpy_loop:
			cmp byte [rsi + rcx], 0
			je strcpy_done
			mov al, [rsi + rcx]
			mov [rdi, rcx], al
			inc rcx
			jmp strcpy_loop

	strcpy_done:
		mov byte [rdi + rcx], 0
		mov rax, rdi
		ret