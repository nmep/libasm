global ft_list_remove_if
extern free

; void		ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));


section .text
	ft_list_remove_if:
		test rdi, rdi
		je .done_ret_0

		test rsi, rsi
		je .done_ret_0

		test rdx, rdx
		je .done_ret_0

		test rcx, rcx
		je .done_ret_0


		push r12
		push r13
		push r14
		push r15
		push rbx
		push rbp

		mov rbp, rdi
		mov r12, [rbp]; *lst
		test r12, r12
		je .done_ret_0

		mov r13, rsi; void *data ref
		mov r14, rdx; int *cmp
		mov r15, rcx; void *free_fct
		xor rbx, rbx

	.loop_next:
		; je boucle sur toute la liste
		test r12, r12
		je .done_ret_0

		;  ici faire la cmp avec void *data du noeud et cmp
		mov rdi, [r12]
		mov rsi, r13
		sub rsp, 8
		
		call r14
		add rsp, 8

		cmp rax, 0
		je .occ_find

		; ici je dois save l'addr du noeud sur le quel je suis car si la cmp = 0 
		; je lierais l'addr du noeud precedent au next de celui que je supp
		mov rbx, r12
		mov r12, [r12 + 8]
		jmp .loop_next

	.occ_find:

		test rbx, rbx
		je .remove_head

		; remove midle
		mov r8, [r12 + 8]; je save le next pour le rattacher au prev

		mov r9, [r12]
		push r8

		mov rdi, r9
		call r15

		pop r8

		; ici je dois mettre rbx->next au next de r12

		mov [rbx + 8], r8

		; free r12
		mov rdi, r12
		push r8
		call free wrt ..plt
		pop r8

		; ici r12 est vide je ne peux donc pas l'inc dans inc r12
		; je dois mov r8 dans r12
		mov r12, r8
		jmp .loop_next

	; ici c'est un cas special l'occ a ete trouver sur le premier noeud je dois del le premier et faire pour la tete de noeud
	; (cas a faire plus tard avec un test a part pour voir comment ca fonction)

	.remove_head:
		; rbx prend la place du premier
		mov rbx, r12

		; j'avance r12
		mov r12, [r12 + 8]

		; je del rbx->data
		mov rdi, [rbx]
		sub rsp, 8
		call r15 ; free fct
		add rsp, 8

		; ici je free le noeud ou l'occ a eu lieu

		mov rdi, rbx

		sub rsp, 8
		call free wrt ..plt
		add rsp, 8

		mov [rbp], r12

		; je mets rbx a 0
		xor rbx, rbx
		jmp .loop_next

	.inc_r12:
		mov r12, [r12+8]
		jmp .loop_next

	.done_ret_0:
		pop rbp
		pop rbx
		pop r15
		pop r14
		pop r13
		pop r12
		mov rax, 0
		ret