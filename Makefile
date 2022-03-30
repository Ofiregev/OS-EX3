#!make -f

CXX=gcc
CXXFLAGS=-pthread

OBJECTS=server.c

all: server
	./$^

original: original.clang
	$(CXX) $^ -o original

client: client.c
	$(CXX) $^ -o client
	

server: $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o server


clean:
	rm -f *.o main server ser cli a.out client original