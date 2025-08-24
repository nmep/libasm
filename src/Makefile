NAME=libasm.a

# ======================== SRC ======================== #

SRC=mandatory/ft_read.s \
	mandatory/ft_strcmp.s \
	mandatory/ft_strcpy.s \
	mandatory/ft_strdup.s \
	mandatory/ft_strlen.s \
	mandatory/ft_write.s

SRC_BONUS=bonus/ft_atoi_base.s \
			bonus/ft_list_remove_if.s \
			bonus/ft_list_size.s \
			bonus/ft_list_sort.s \
			bonus/ft_list_push_front.s

# ======================== OBJ ======================== #

OBJ_DIR=./obj/
OBJS=$(addprefix $(OBJ_DIR), $(SRC:.s=.o))
OBJS_BONUS=$(addprefix $(OBJ_DIR), $(SRC_BONUS:.s=.o))

# ======================== COMPILE ======================== #

CC=gcc
CFLAGS=-g3
NASM=nasm
NASMFLAGS=-f elf64 -F dwarf -g


# ======================== RULE ======================== #


$(OBJ_DIR)%.o: %.s
	@mkdir -p ./obj/mandatory ./obj/bonus
	$(NASM) $(NASMFLAGS) $< -o $@

all: $(NAME)

ifdef BONUS
$(NAME): $(OBJS) $(OBJS_BONUS)
	ar rcs $@ $?
	ranlib $@

else
$(NAME): $(OBJS)
	ar rcs $@ $?
	ranlib $@

endif

# fait un make avec bonus a un et vas dans la regle 
# bonus de name sinon je ne peux pas faire deux regle nam
bonus:
	@$(MAKE) --no-print-directory BONUS=1 

clean:
	rm -f $(OBJS) $(OBJS_BONUS)
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all bonus clean fclean re
