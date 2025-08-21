global ft_list_sort

section .text
	ft_list_sort:
		test rdi, rdi
		je .done_ret_0

		test rsi, rsi
		je .done_ret_0

		push r12
		mov r12, rsi; je sauvegarde cmp

		mov rdx, [rdi]; *i = *lst


	; rdx = i | r12 = &cmp
	.loop_i: ; while (i)
		test rdx, rdx
		je .done_ret_0

		mov rcx, [rdx + 8]; j = i->next

	.loop_j:
		; j = i->next
		test rcx, rcx
		je .inc_i

		mov rdi, [rdx]; ici j'envoie le void * data
		mov rsi, [rcx]; ici j'envoie le void * data

		push rdx
		push rcx

		call r12; cmp

		cmp eax, 0
		jg .swap

		pop rcx
		pop rdx

		mov rcx, [rcx + 8]
		jmp .loop_j

	.done_ret_0:
		pop r12
		mov rax, 0
		ret

	.inc_i:
		mov rdx, [rdx + 8]
		jmp .loop_i

	.swap:
		pop rcx
		pop rdx

		mov r8, [rdx]
		mov r9, [rcx]

		push rdx

		mov eax, dword [r8]
		mov edx, dword [r9]

		mov dword [r8], edx
		mov dword [r9], eax

		pop rdx
		jmp .inc_j

	.inc_j:
		mov rcx, [rcx + 8]
		jmp .loop_j
