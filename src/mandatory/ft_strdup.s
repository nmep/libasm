global ft_strdup

extern malloc
extern ft_strcpy
extern ft_strlen
extern __errno_location

section .data
	null_str_err_msg db "Str is NULL", 0x0A

section .text
	ft_strdup:
		test rdi, rdi
		je .strdup_null_str
		mov rsi, rdi
		call ft_strlen

		push rsi

		inc rax
		mov rdi, rax
		mov rbx, 12
		call malloc wrt ..plt
		cmp rax, 0
		jl .set_errno
		mov rdi, rax
		pop rsi
		call ft_strcpy
		ret

	.set_errno
		neg rax
		mov rdi, rax
		call __errno_location wrt ..plt
		mov [rax], rdi
		mov rax, -1
		ret

	.strdup_null_str:
		mov rax, 0
		ret


;  ajouter error sur les erreur voit man strdup
	.error:
		push rbx
		neg rax	; get absolute value of syscall return
		mov rbx, rax
		call __errno_location wrt ..plt
		mov [rax], rbx  ; set the value of errno
		mov rax, -1
		pop rbx
		ret


