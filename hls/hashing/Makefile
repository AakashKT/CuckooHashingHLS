# -fsanitize=address 
all: clang-check run
clang-check:
	/usr/bin/clang -O1 -fno-optimize-sibling-calls -g -Wall \
		-Wno-unknown-pragmas  execute.cpp \
		execute_test.cpp -o test.out -lstdc++

run:
	./test.out
	valgrind --leak-check=full ./test.out



