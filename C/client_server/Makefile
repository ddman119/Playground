server: server.o request_header.o
	clang -o server server.o request_header.o -Wall

server.o: src/server.c
	clang -o server.o src/server.c -Wall

request_header.o: src/request_header.c src/request_header.h
	clang -o request_header.o src/request_header.c -Wall
