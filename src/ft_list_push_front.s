global ft_list_push_front

 section .text
    ft_list_push_front:

        test rsi, rsi            ; new == NULL ?
        je .return_0

        mov rax, [rdi]           ; rax = *list
        mov [rsi + 8], rax       ; new->next = *list
        mov [rdi], rsi           ; *list = new

        mov rax, 0
        ret

    .return_0:
        mov rax, 0
        ret