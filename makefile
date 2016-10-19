all: square saw

static-musl:
	mkdir -p _build
	musl-gcc -static -std=c99 -Wall square.c -lm -o _build/square
	musl-gcc -static -std=c99 -Wall saw.c -lm -o _build/saw


square:
	mkdir -p _build
	cc -std=c99 -Wall square.c -o _build/square

saw:
	mkdir -p _build
	cc -std=c99 -Wall saw.c -lm -o _build/saw

clean:
	rm -fr _build
