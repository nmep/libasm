global ft_strcpy

section .text
	ft_strcpy:
		mov rcx, 0
		loop:
			cmp byte [rsi + rcx], 0
			je done
			mov al, [rsi + rcx]
			mov [rdi, rcx], al
			inc rcx
			jmp loop
	done:
		mov byte [rdi + rcx], 0
		mov rax, rsi
		ret
		
