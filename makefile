all: square saw

square:
	mkdir -p _build
	cc -std=c99 -Wall square.c -o _build/square

saw:
	mkdir -p _build
	cc -std=c99 -Wall saw.c -lm -o _build/saw

clean:
	rm -fr _build
