; ft_atoi_base(char *str, char *base)

; dans la base
;     pas de ' ' \r \n \t \v '-' '+'


global ft_atoi_base

; rdi str | rsi base

section .text
    ft_atoi_base:
        test rdi, rdi
        je .ft_atoi_base.str_is_null
        test rsi, rsi
        je .ft_atoi_base.base_is_null

    ; while (base[i])
    ; {
    ;     j = 0
    ;     while (base[j])
    ;     {
    ;         if (base[i] == base[j] && i != j)
    ;             return 0

    ;     }
    ;     if base[i] == ' ' \r \n \t \v '-' '+'
    ;         return 0
    ; }

    .ft_atoi_base.parsing:
        xor rcx, rcx
        .ft_atoi_base.loop_til_rsi_i_end:
            cmp byte [rsi + rcx], 0
            je .ft_atoi_base.num_parsing

            .ft_atoi_base.loop_til_rsi_j_end:
                xor r8, r8 
                .ft_atoi_base.loop_til_rsi_j_end_check_double:
                    cmp byte [rsi + r8], 0
                    je .ft_atoi_base.check_syntax
                    mov al, [rsi + rcx]
                    mov dl, [rsi + r8]
                    cmp byte al, dl
                    je .ft_atoi_base.cmp_index
                    inc r8
                    jmp .ft_atoi_base.loop_til_rsi_j_end_check_double
                .ft_atoi_base.check_syntax:
                    cmp byte [rsi + rcx], 0x20; ' '
                    je .ft_atoi_base.return_0
                    cmp byte [rsi + rcx], 0x07; '\a'
                    je .ft_atoi_base.return_0
                    cmp byte [rsi + rcx], 0x08; '\b'
                    je .ft_atoi_base.return_0
                    cmp byte [rsi + rcx], 0x09; '\t'
                    je .ft_atoi_base.return_0
                    cmp byte [rsi + rcx], 0x0A; '\n'
                    je .ft_atoi_base.return_0
                    cmp byte [rsi + rcx], 0x0B; '\v'
                    je .ft_atoi_base.return_0
                    cmp byte [rsi + rcx], 0x0C; '\f'
                    je .ft_atoi_base.return_0
                    cmp byte [rsi + rcx], 0x0D; '\r'
                    je .ft_atoi_base.return_0
                    cmp byte [rsi + rcx], 0x2B; '-'
                    je .ft_atoi_base.return_0
                    cmp byte [rsi + rcx], 0x2D; '+'
                    je .ft_atoi_base.return_0
                
            inc rcx
            jmp .ft_atoi_base.loop_til_rsi_i_end

    .ft_atoi_base.num_parsing:
        cmp rcx, 2
        jl .ft_atoi_base.return_0
        xor rcx, rcx
        .ft_atoi_base.num_parsing_loop:
            cmp byte [rdi + rcx], 0
            je .ft_atoi_base.exec
            mov al, [rdi + rcx]
            cmp al, '0'
            jb .ft_atoi_base.return_0
            cmp al, '9'
            ja .ft_atoi_base.return_0
            inc rcx
            jmp .ft_atoi_base.num_parsing_loop

    .ft_atoi_base.cmp_index:
        cmp r8, rcx
        jne .ft_atoi_base.return_0
        inc r8
        jmp .ft_atoi_base.loop_til_rsi_j_end_check_double

    .ft_atoi_base.exec:
        mov rax, 1
        ret

    .ft_atoi_base.return_0:
        mov rax, 0
        ret

    .ft_atoi_base.str_is_null:
        mov rax, -1
        ret

    .ft_atoi_base.base_is_null:
        mov rax, -1
        ret