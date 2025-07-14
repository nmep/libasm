global ft_strdup

extern malloc
; extern memcpy
extern ft_strcpy
extern ft_strlen

section .data
    null_str_err_msg db "Str is NULL", 0x0A
    malloc_error db "Error malloc", 0x0A

section .text
    ft_strdup:
        test rdi, rdi
        je .strdup_null_str

        ; push rdi

        mov r9, rdi

        call ft_strlen
        add rax, 1

        mov rdi, rax

        push r9

        call malloc

        pop r9

        ; test rax, rax
        ; je .malloc_error

        mov rdi, rax
        mov rsi, r9
        ; pop rsi
        ; mov rdx, rcx
        call ft_strcpy
        ret

    ; .malloc_error:
    ;     mov rax, 1
    ;     mov rdi, 2
    ;     mov rsi, malloc_error
    ;     mov rdx, 13
    ;     syscall
    ;     mov rax, 0
    ;     ret

    ; .strdup_null_str:
    ;     mov rax, 1
    ;     mov rdi, 2
    ;     mov rsi, null_str_err_msg
    ;     mov rdx, 12
    ;     syscall
    ;     mov rax, 0
    ;     ret