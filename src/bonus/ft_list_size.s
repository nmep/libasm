global ft_list_size

section .text
	ft_list_size:
		mov rax, 0
		test rdi, rdi
		je .done
		mov rsi, rdi
		.loop:

			test rsi, rsi
			je .done
			inc rax
			mov rsi, [rsi + 8]
			jmp .loop

	.done:
		ret
	
	
