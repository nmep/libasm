global ft_write

section .data
    null_rsi_error_msg db "argument 2 is null but the corresponding size argument 3 value is not 0", 0x0a
    not_null_rsi_count_to_big db "‘write’ reading too much bytes from a region of size x", 0x0a

section .text

    ft_write:
        xor rcx, rcx
        test rsi, rsi
        je .null_rsi
        jne .not_null_rsi
    
    .rsi_len:
        cmp byte [rsi + rcx], 0
        je .done
        inc rcx
        jmp .rsi_len
    
    .null_rsi:
        cmp rdx, 0
        jne .null_rsi_error
        mov rax, 1
        mov rdi, 0
        mov rdx, 0
        syscall
        mov rax, 0
        ret

    .null_rsi_error:
        mov rax, 1
        mov rdi, 2
        mov rsi, null_rsi_error_msg
        mov rdx, 71
        syscall
        mov rax, 0 
        ret

    .not_null_rsi:
        call .rsi_len
        add rcx, 1
        cmp rcx, rdx
        jl .count_is_too_much
        mov rax, 1
        syscall
        ret

    .count_is_too_much:
        mov rax, 1
        mov rdi, 2
        mov rsi, not_null_rsi_count_to_big
        mov rdx, 59
        syscall
        mov rax, 0
        ret

    .done:
        ret