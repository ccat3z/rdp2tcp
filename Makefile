PREFIX=/usr/local

all: client server-mingw64

client: client/rdp2tcp
client/rdp2tcp:
	make -C client

server-mingw64: server/rdp2tcp.exe
server/rdp2tcp.exe:
	make -C server -f Makefile.mingw64

.PHONY: install
install: client/rdp2tcp tools/rdp2tcp.py
	install client/rdp2tcp $(PREFIX)/bin/rdp2tcp
	install tools/rdp2tcp.py $(PREFIX)/bin/rdp2tcpctl

clean:
	make -C client clean
	make -C server -f Makefile.mingw64 clean
	make -C tools clean
