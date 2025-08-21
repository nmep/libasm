global ft_strdup

extern malloc
extern ft_strcpy
extern ft_strlen

section .data
    null_str_err_msg db "Str is NULL", 0x0A
    malloc_error db "Error malloc", 0x0A

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
        mov rdi, rax
        pop rsi
        call ft_strcpy
        ret
        

    .malloc_error:
        mov rax, 1
        mov rdi, 2
        mov rsi, malloc_error
        mov rdx, 13
        syscall
        mov rax, 0
        ret

    .strdup_null_str:
        mov rax, 1
        mov rdi, 2
        mov rsi, null_str_err_msg
        mov rdx, 12
        syscall
        mov rax, 0
        ret


;  ajouter error sur les erreur voit man strdup
    .error:
        push rbx
        neg rax    ; get absolute value of syscall return
        mov rbx, rax
        call __ernno_location
        mov [rax], rbx  ; set the value of errno
        mov rax, -1
        pop rbx
        ret