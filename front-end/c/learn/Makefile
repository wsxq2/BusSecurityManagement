SOURCE=$(wildcard *.c)
DIR=bin
OBJECTS=$(addprefix $(DIR)/,$(SOURCE:.c=))
CFLAGS=-g -O -std=c99 -I/usr/include/mysql -L/usr/lib64/mysql -lmysqlclient -lpthread -lz -lm -ldl -lssl -lcrypto
CC=gcc

.PHONY: all test clean

all: $(OBJECTS)

$(OBJECTS): $(DIR)/%: %.c
	-$(CC) $(CFLAGS) -o $@ $<

test:
	@echo $(RM)

clean:
	$(RM) $(DIR)/*
