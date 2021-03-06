# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gwyman-m <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/12/02 17:48:56 by gwyman-m          #+#    #+#              #
#    Updated: 2019/10/12 02:32:58 by sts              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=libft.a

PRINTFSRC_DIR = printfsrc/

LIBFTSRC_DIR = libsrc/

FLAGS = -Wall -Wextra -Werror -c -I.

HEADER = libft.h

HEADER_PRINTF = ft_printf.h

CLIBFT= ft_atoi.c ft_bzero.c ft_countchars.c ft_countwords.c ft_create_coords.c \
		ft_get_coords.c ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c \
		ft_islower.c ft_isprint.c ft_isupper.c ft_itoa.c ft_itoa_base.c \
		ft_lstadd.c ft_lstdel.c ft_lstdelone.c ft_lstiter.c ft_lstmap.c \
		ft_lstnew.c ft_lstsplit.c ft_memalloc.c ft_memccpy.c ft_memchr.c \
		ft_memcmp.c ft_memcpy.c ft_memdel.c ft_memmove.c ft_memrevcpy.c \
		ft_memset.c ft_numlen.c ft_putchar.c ft_putchar_fd.c ft_putendl.c \
		ft_putendl_fd.c ft_putnbr.c ft_putnbr_fd.c ft_putstr.c ft_putstr_fd.c \
		ft_sqrt.c ft_strcat.c ft_strchr.c ft_strchr_replace.c ft_strchr_swap.c \
		ft_strchrpos.c ft_strclr.c ft_strcmp.c ft_strcpy.c ft_strcpy_whilech.c \
		ft_strdel.c ft_strdup.c ft_strequ.c ft_striter.c ft_striteri.c \
		ft_strjoin.c ft_strlcat.c ft_strlen.c ft_strmap.c ft_strmapi.c \
		ft_strncat.c ft_strncmp.c ft_strncpy.c ft_strnequ.c ft_strnew.c \
		ft_strnstr.c ft_strrchr.c ft_strrejoin.c ft_strsplit.c ft_strstr.c \
		ft_strsub.c ft_strtrim.c ft_strtrim_all.c ft_tolower.c ft_toupper.c \
		get_next_line.c \

CPRINTF= apply_len_mod.c atoi_binary.c create_dig_output.c \
		 create_float_output.c create_fnum.c def_inf.c double_arithmetics.c \
		 float_signfp_func.c ft_printf.c ftoa.c itoa.c make_str_upper.c \
		 optstrrejoin.c parse.c prepare_opt.c print_c.c print_d.c print_f.c \
		 print_lf.c print_o.c print_p.c print_s.c print_type.c print_u.c \
		 print_x.c rounding.c signfp_func.c \

LIBFTSRC = $(addprefix $(LIBFTSRC_DIR),$(CLIBFT))

PRINTFSRC = $(addprefix $(PRINTFSRC_DIR),$(CPRINTF))

CFILES = $(PRINTFSRC) $(LIBFTSRC)

OFILES = $(LIBFTSRC:%.c=%.o) $(PRINTFSRC:%.c=%.o)

VPATH := printfsrc:libsrc

all: $(NAME)

$(NAME): $(OFILES)
	@ar rc libft.a $(OFILES)
	@ranlib libft.a
	@printf "\r\033[0;32m.o files are ready                      \033[0m\n"
	@printf "\e[?25h\033[0;32mlibft.a is ready\033[0m\n"

libsrc/%.o: %.c $(HEADER)
	@gcc -c $(FLAGS) $< -o $@
	@printf "\e[?25l\033[0;34mcompiling $<\033[0m\033\r"
	@printf "                                 \r"

printfsrc/%.o: %.c $(HEADER_PRINTF)
	@gcc -c $(FLAGS) $< -o $@
	@printf "\e[?25l\033[0;34mcompiling $<\033[0m\033\r"
	@printf "                                 \r"

clean:
	@rm -f $(OFILES)
	@echo "\033[0;33mthe libft directory is cleaned\033[0m"

fclean: clean
	@rm -f libft.a
	@echo "\033[0;33mdeleted libft.a\033[0m"

re: fclean all
