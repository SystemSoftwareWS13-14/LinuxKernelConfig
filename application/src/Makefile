CC=gcc
CFLAGS=-c -Wall

HWEXEC=helloworld
BINDIR=../bin
OUTFILE=$(BINDIR)/$(HWEXEC)
HWSOURCE=$(HWEXEC).c
HWOBJECT=$(HWSOURCE:.c=.o)

helloworld: $(HWOBJECT)
	$(CC) $(HWOBJECT) -o $(OUTFILE)

helloworld.o: $(HWSOURCE)
	$(CC) $(CFLAGS) $(HWSOURCE)

clean:
	rm -rf *.o
