# Compilateur
CXX = g++
# Options de compilation
CXXFLAGS = -std=c++11 -Wall -Wextra -Werror

# Répertoires
SRC_DIR = lib/src
INC_DIR = lib/inc
TEST_DIR = lib/test
BUILD_DIR = .

# Fichiers source
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))

# Nom de la bibliothèque
LIB_NAME = matrix.a
LIB_PATH = $(BUILD_DIR)/$(LIB_NAME)

# Fichiers de test
TEST_SRCS = $(wildcard $(TEST_DIR)/*.cpp)
TEST_OBJS = $(patsubst $(TEST_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(TEST_SRCS))
TEST_EXEC = $(BUILD_DIR)/unit_tests

# Dépendances
LIB_DEPS = # Ajouter les dépendances externes si nécessaire
TEST_DEPS = $(LIB_PATH) # Dépend de la bibliothèque

.PHONY: all clean test

all: $(LIB_PATH) $(TEST_EXEC)

$(LIB_PATH): $(OBJS)
	ar rcs $@ $^

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -I$(INC_DIR) -c -o $@ $<

$(BUILD_DIR)/%.o: $(TEST_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -I$(INC_DIR) -c -o $@ $<

$(TEST_EXEC): $(TEST_OBJS)
	$(CXX) $(CXXFLAGS) -I$(INC_DIR) -L$(BUILD_DIR) -o $@ $^ -lgtest -lpthread $(LIB_DEPS)

test: $(TEST_EXEC)
	$(TEST_EXEC)

clean:
	rm -rf $(BUILD_DIR)
