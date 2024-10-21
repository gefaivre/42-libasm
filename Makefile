SHELL = /bin/sh
SRCS			=	ft_strlen.s \
					ft_strcpy.s \
					ft_strcmp.s \
					ft_write.s  \
					ft_read.s	\
					ft_strdup.s


OBJS			= $(SRCS:.s=.o)

AS				= nasm 
ASFLAGS			= -f elf64 			# [-f] specify a format | [elf64] the format
AR				= ar							
ARFLAGS			= rcv							# try with or without s
CC				= clang
CCFLAGS			= -Wall -Wextra -Werror
RM				= rm -rf

NAME			= libasm.a
TEST_NAME		= test

all:			$(NAME)

$(NAME):		$(OBJS)
				$(AR) $(ARFLAGS) $(NAME) $(OBJS)

.s.o:
	$(AS) $(ASFLAGS) -o $@ $?

test:			$(NAME) main.c
				$(CC) $(CCFLAGS) main.c -L. -lasm -g -o $(TEST_NAME)

clean:
				$(RM) $(OBJS)

fclean:			clean
				$(RM) $(NAME) $(TEST_NAME)

re:			fclean $(NAME)

.PHONY:			all clean fclean re so