	global ft_strcmp

	section .text
		ft_strcmp:
			mov rcx, 0
			mov rax, 0
			loop:
				mov al, [rdi + rcx]
				mov dl, [rsi + rcx]; check if a s2 char is 0 
				test al, al; check if a s1 char is 0
				je return
				test dl, dl
				je return

				cmp al, dl; cmp s1[rcx] == s2[rcx] ?
				jne return
				inc rcx
				jmp loop

		return:
			movsx rax, al; movsx deplace le contenu d'un registre de 32, 16, 8 bit et de le move dans un de 64
			movsx rdx, dl;
			sub rax, rdx; s1 - s2	
			ret