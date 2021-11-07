CC	?= 	gcc
CFLAGS	?= 	-s -Os -march=native
PREFIX	= 	$(DESTDIR)/usr
BINDIR	= 	$(PREFIX)/bin
NAME	=	beats

.PHONY: all install uninstall clean

all: $(NAME)

$(NAME): $(NAME).o
	$(CC) $(LDFLAGS) -o $@ $<

install: $(NAME)
	install -Dm 0755 $< $(BINDIR)

uninstall:
	rm -f $(BINDIR)/$(NAME)

clean:
	rm -f $(NAME) *.o

%.o: %.c
	$(CC) $(CFLAGS) -c $<
