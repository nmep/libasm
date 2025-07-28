global ft_list_push_front

 section .text:
    ft_list_push_front:
        mov rax, [rdi]
        test rax, rax; !(*list)
        je .return_0
        test rsi, rsi; !new
        je .return_0

        mov [rsi + 8], rax; new->next = (*list)
        mov [rdi], rsi; *list = new
        ret

    .return_0:
        mov rax, 0
        ret