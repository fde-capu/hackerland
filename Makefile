# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fde-capu <fde-capu@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/01 20:08:05 by fde-capu          #+#    #+#              #
#    Updated: 2022/02/01 20:36:02 by fde-capu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	hacker_land
SRCS	=	hackerland.cpp
HEAD	=	Makefile
SHELL	=	/bin/sh
CC		=	c++
CCFLAGS	=	-Wall -Werror -Wextra -g
OBJS	=	$(SRCS:.cpp=.o)
VAL		=	valgrind
VALFLAG	=	--tool=memcheck \
			--leak-check=full \
			--show-leak-kinds=all \
			--track-origins=yes \
			--show-reachable=yes
all:		$(NAME)
	export OUTPUT_PATH='cost.txt'
$(NAME):	$(OBJS)
	$(CC) $(CCFLAGS) $(OBJS) -o $(NAME)
$(OBJS):	%.o : %.cpp $(HEAD)
	$(CC) $(CCFLAGS) -o $@ -c $<
clean:
	-rm -f $(OBJS)
fclean:		clean
	-rm -f $(NAME)
re:			fclean all
rt:			re t
vf:			all
	$(VAL) $(VALFLAG) ./$(NAME) < args
	cat $(OUTPUT_PATH)
t:			all
	./$(NAME) < args
	cat $(OUTPUT_PATH)
v:			all
	$(VAL) ./$(NAME) < args
	cat $(OUTPUT_PATH)
