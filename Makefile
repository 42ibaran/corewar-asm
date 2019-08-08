# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ibaran <ibaran@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/07/10 13:28:55 by ibaran            #+#    #+#              #
#    Updated: 2019/08/08 17:17:50 by ibaran           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ASM					:=	asm

VPATH				:=	./sources/ ./objects/ ./includes/

SRC_NAME_ASM		:=	asm.c \
						asm_read_and_save.c \
						asm_define_word.c \
						asm_definition_1.c \
						asm_definition_2.c \
						asm_errors.c \
						asm_init_1.c \
						asm_init_2.c \
						asm_debug.c \
						asm_new_struct.c \
						asm_translator.c \
						asm_write_file.c \
						asm_put_name_and_comment.c \
						asm_prepare_operations.c \
						asm_put_code.c \
						asm_process_negative_arg_val.c \
						asm_check_operations_1.c \
						asm_check_operations_2.c \
						asm_check_operations_3.c \
						asm_check_operations_4.c \
						asm_word_is_what.c \
						asm_get_f_arr.c \
						asm_check_arg.c \
						asm_get_operation_parameters.c \
						asm_get_label_distance.c \
						asm_free.c

HEAD_NAME_ASM		:=	asm.h
HEAD_NAME_COMMON	:=	op.h
LIB_NAME			:=	libft.a

OBJ_NAME_ASM		:=	$(SRC_NAME_ASM:.c=.o)

SRC_PATH			:=	./sources
HEAD_PATH			:=	./includes
LIB_PATH			:=	./libft

CFLAGS				:=	-Wall -Wextra -Werror

OBJ_PATH			:=	./objects

SRC_ASM				:=	$(addprefix $(SRC_PATH)/, $(SRC_NAME_ASM))
OBJ_ASM				:=	$(addprefix $(OBJ_PATH)/, $(OBJ_NAME_ASM))

HEAD_COREWAR		:=	$(addprefix $(HEAD_PATH)/, $(HEAD_NAME_COREWAR))
HEAD_ASM			:=	$(addprefix $(HEAD_PATH)/, $(HEAD_NAME_ASM))

HEAD				:=	$(HEAD_ASM) $(HEAD_NAME_COMMON)
OBJ					+=	$(OBJ_ASM)

LIBFT				:=	$(LIB_PATH)/$(LIB_NAME)

CC					:=	gcc
CPPFLAGS			:=	-I$(HEAD_PATH) -I$(LIB_PATH)/includes
LIBS				:=	-lft -L$(LIB_PATH)

RED					:=	\033[0;31m
GREEN				:=	\033[0;32m
YELLOW				:=	\033[1;33m
DEFAULT				:=	\033[0m

all: $(ASM)

$(ASM): $(LIBFT) $(OBJ_ASM) $(HEAD) $(HEAD_COREWAR)
	@$(CC) $(CFLAGS) $(LIBS) $(CPPFLAGS) $(OBJ_ASM) -o $@
	@ echo "$(GREEN)[asm Compiled]$(DEFAULT)"

$(OBJ_PATH)/%.o : $(SRC_PATH)/%.c $(HEAD)
	@echo [CC] $<
	@$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

$(LIBFT):
	@$(MAKE) -C $(LIB_PATH)

norm:
	@norminette **/*.[ch]

clean:
	@$(MAKE) -C $(LIB_PATH) $@
	@rm -f $(OBJ)
	@echo "$(YELLOW)[Corewar Objects Removed]$(DEFAULT)"

fclean: clean
	@$(MAKE) -C $(LIB_PATH) $@
	@rm -f $(ASM)
	@echo "$(RED)[Corewar Executives Removed]$(DEFAULT)"

re: fclean all

.PHONY: all clean fclean re norm
