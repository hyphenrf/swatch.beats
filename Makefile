PREFIX 	= 	/usr
CC 		= 	gcc
CFLAGS 	= 	"-O3 -march=native"
BINDIR  = 	$(PREFIX)/bin
BINNAME = 	beats

.PHONY: beats install uninstall clean

all: beats

beats: beats.c
	CFLAGS=$(CFLAGS) $(CC) beats.c -o $(BINNAME)

install: $(BINNAME)
	-mkdir -p $(BINDIR)
	install -m '0755' $(BINNAME) $(BINDIR)/$(BINNAME)

uninstall:
	rm -f $(BINDIR)/$(BINNAME)

clean:
	rm -f $(BINNAME)
