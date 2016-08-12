NAME = push-swap
SRC_NAME = push-swap.c \
			operation_fc.c


INC_PATH = ./includes/
SRC_PATH = ./srcs/*
OBJ_PATH = ./obj/
LIB_PATH = ./libft/
LIB_NAME = libft.a
CC = gcc
CFLAGS = -Werror -Wall -Wextra
OBJ_NAME = $(SRC_NAME:.c=.o)
SRC = $(addprefix $(SRC_PATH),$(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH),$(OBJ_NAME))
LIB = $(addprefix $(LIB_PATH),$(LIB_NAME))
INC = $(addprefix -I,$(INC_PATH))

all:$(NAME)

$(NAME): $(OBJ) libf
	$(CC) $(CFLAGS) $(OBJ) $(LIB) $(INC) -o $@

$(OBJ_PATH)%.o:$(SRC_PATH)%.c
	@mkdir -p $(OBJ_PATH)
	$(CC) -c $< -o $@

libf:
	make -C $(LIB_PATH)

clean:
	make -C $(LIB_PATH) fclean
	rm -rf $(OBJ)
	rm -rf $(OBJ_PATH)

fclean: clean
	rm -rf $(NAME)

re: fclean all

norme:
	norminette $(SRC)
	norminette $(INC_PATH)*.h
