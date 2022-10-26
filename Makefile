all: client server-mingw64

client: client/rdp2tcp
client/rdp2tcp:
	make -C client

server-mingw64: server/rdp2tcp.exe
server/rdp2tcp.exe:
	make -C server -f Makefile.mingw64

clean:
	make -C client clean
	make -C server -f Makefile.mingw64 clean
	make -C tools clean
