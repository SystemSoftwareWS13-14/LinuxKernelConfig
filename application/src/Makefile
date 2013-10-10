CC=gcc
CFLAGS=-c -Wall

HWEXEC=helloworld
HWSOURCE=$(HWEXEC).c
HWOBJECT=$(HWSOURCE:.c=.o)

helloworld: $(HWOBJECT)
	$(CC) $(HWOBJECT) -o $(HWEXEC)

helloworld.o: $(HWSOURCE)
	$(CC) $(CFLAGS) $(HWSOURCE)

clean:
	rm -rf *.o
