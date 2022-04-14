#!make -f

CXX=gcc
CXXFLAGS=-pthread

OBJECTS=server.c

VALGRIND_FLAGS=-v --leak-check=full --show-leak-kinds=all  --error-exitcode=99

all: server 
	./$^

client: clientC
	./client localhost

original: original.c
	$(CXX) $^ -o original

clientC: client.c
	$(CXX) $^ -o client

server: $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o server

valgrind: server
	valgrind --tool=memcheck $(VALGRIND_FLAGS) ./server | { egrep "lost| at " || true; }

clean:
	rm -f *.o main server ser cli a.out client original