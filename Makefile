CC      = gcc
CFLAGS  = -Wall -Wextra -std=c11 -g -fsanitize=address,undefined
SRC     = src/main.c src/sha1.c
BIN     = sha1tool

$(BIN): $(SRC) src/sha1.h
	$(CC) $(CFLAGS) $(SRC) -o $(BIN)

test: $(BIN)
	./tests/test.sh

clean:
	rm -f $(BIN)

.PHONY: test clean