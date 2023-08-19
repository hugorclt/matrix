
NAME 		= 	matrix

FILES 		=	lib/test/vector_test.cpp	\

INCL_DIR	=	-I./lib/inc

CC 			= 	c++
CXXFLAGS 	= 	-std=c++11 -Wall -Wextra -Werror -g3

OBJS_DIR	=	.objs
OBJS 		= 	$(addprefix $(OBJS_DIR)/, $(notdir $(FILES:%.cpp=%.o)))

DEP			=	$(addprefix $(OBJS_DIR)/, $(notdir $(FILES:%.cpp=%.d)))

$(OBJS_DIR)		:
					@mkdir -p $(OBJS_DIR)


# For Multiple Directory
$(OBJS_DIR)/%.o	: 	lib/test/%.cpp
					@printf "\033[0;33mGenerating matrix object... %-38.38s \r" $@
					@$(CC) $(CXXFLAGS) -c $< -o $@ -MMD $(INCL_DIR)

# End Multiple Directory

all 			: 	$(NAME)

$(NAME)			: 	$(OBJS_DIR) $(OBJS)
		      		@$(CC) $(CXXFLAGS) $(OBJS) -o $(NAME)
					@echo "\033[1;32mMatrix: Done!\033[0m"

clean			:
		      		@rm -f $(OBJS)
					@rm -rf $(OBJS_DIR)
					@echo "\033[1;31mObject cleaned!\033[0m"

fclean			:	
					@rm -f $(OBJS)
					@rm -rf $(OBJS_DIR)
					@rm -f $(NAME)
					@echo "\033[1;31mProgram and object cleaned!\033[0m"

re				:	fclean all

.PHONY			:
					all test clean fclean re

.SECONDEXPANSION:


-include $(DEP)