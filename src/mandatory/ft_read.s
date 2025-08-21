global ft_read

section .data:
    error_msg db "‘read’ specified size 18446744073709551611 exceeds maximum object size 9223372036854775807", 0x0A

section .text
    ft_read:
        cmp rdx, 0
        jl .error
        mov rax, 0
        syscall
        ret

    .error:
        mov rax, 1
        mov rdi, 2
        mov rsi, error_msg
        mov rdx, 95
        syscall
        mov rax, 0
        ret
