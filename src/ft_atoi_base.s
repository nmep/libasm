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
        xor r9, r9
        .ft_atoi_base.num_parsing_loop:
            cmp byte [rdi + r9], 0
            je .ft_atoi_base.exec
            mov al, [rdi + r9]
            cmp al, '0'
            jb .ft_atoi_base.return_0
            cmp al, '9'
            ja .ft_atoi_base.return_0
            inc r9
            jmp .ft_atoi_base.num_parsing_loop

    .ft_atoi_base.cmp_index:
        cmp r8, rcx
        jne .ft_atoi_base.return_0
        inc r8
        jmp .ft_atoi_base.loop_til_rsi_j_end_check_double

    .ft_atoi_base.exec:
        ; rcx -> base_len
        ; r9 -> num
        xor rax, rax
        mov r8, -1
        ; while (rdi[r8] == ' ' || rdi[r8] == '\t')
            ; i++
        .ft_atoi_base.skip_white_space:
            cmp byte [rdi + r8], ' '
            je .ft_atoi_base.inc_r8_white_space
            cmp byte [rdi + r8], '\t'
            je .ft_atoi_base.inc_r8_white_space
            jmp .ft_atoi_base.skip_white_space

        .ft_atoi_base.inc_r8_white_space:
            inc r8
            jmp .ft_atoi_base.skip_white_space

        .ft_atoi_base.skip_symbole:
            cmp byte [rdi + r8], '-'
            je .ft_atoi_base.inc_r8_symbol_neg
            cmp byte [rdi + r8], '+'
            je .ft_atoi_base.inc_r8_symbol_pos
            jmp .ft_atoi_base.exec.mult_with_baseLen

        .ft_atoi_base.inc_r8_symbol_neg:
            
            inc r8

        .ft_atoi_base.inc_r8_symbol_pos:
            inc r8
            jmp .ft_atoi_base.skip_symbole


        .ft_atoi_base.exec.mult_with_baseLen:
            inc r8
            cmp byte [rdi + r8], 0
            je .ft_atoi_base.done
            mul rcx
            xor r10, r10
            .ft_atoi_base.exec.find_Value_From_Base:
                cmp byte [rsi + r10], 0
                je .ft_atoi_base.return_0
                mov dl, [rdi + r8]
                cmp byte [rsi + r10], dl
                je .ft_atoi_base.exec.add_Value_From_Base
                inc r10
                jmp .ft_atoi_base.exec.find_Value_From_Base

        .ft_atoi_base.exec.add_Value_From_Base:
            add rax, r10
            jmp .ft_atoi_base.exec.mult_with_baseLen

    .ft_atoi_base.return_0:
        mov rax, 0
        ret

    .ft_atoi_base.str_is_null:
        mov rax, -1
        ret

    .ft_atoi_base.base_is_null:
        mov rax, -1
        ret

    .ft_atoi_base.done:
        ret