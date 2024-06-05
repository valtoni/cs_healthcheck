# Variáveis
CXX=g++
CXXFLAGS=-m32 -I./ReGameDLL_CS/regamedll/public/regamedll/ -I./ReGameDLL_CS/regamedll/public/ -I./ReGameDLL_CS/regamedll/dlls/ -I./ReGameDLL_CS/regamedll/engine/ -I./ReGameDLL_CS/regamedll/common/

LIBS=ReGameDLL_CS/build/regamedll/cs.so
SRC=call_global.cpp
OBJ=$(SRC:.cpp=.o)
EXEC=call_global

# Regra padrão
all: $(EXEC)

# Regra para baixar o repositório Git
init:
	@if [ -d "rehlds" ]; then \
		echo "Diretório rehlds já existe. Atualizando..."; \
		git -C ./rehlds pull --rebase; \
	else \
		git clone https://github.com/dreamstalker/rehlds.git; \
	fi
	(cd rehlds; ./build.sh); \

	@if [ -d "ReGameDLL_CS" ]; then \
		echo "Diretório ReGameDLL_CS já existe. Atualizando..."; \
		git -C ./ReGameDLL_CS pull --rebase; \
	else \
		git clone https://github.com/s1lentq/ReGameDLL_CS.git; \
	fi
	(cd ReGameDLL_CS; ./build.sh); \

# Regra para o executável
$(EXEC): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LIBS)

# Regra para os objetos
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Regra para limpar os arquivos gerados
clean:
	rm -f $(OBJ) $(EXEC)
