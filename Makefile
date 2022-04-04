#!make -f

CXX=gcc
CXXFLAGS=-pthread

OBJECTS=server.c

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


clean:
	rm -f *.o main server ser cli a.out client original