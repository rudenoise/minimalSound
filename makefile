all: square saw

static-musl:
	mkdir -p _build
	musl-gcc -static -std=c99 -Wall src/square.c -lm -o _build/square
	musl-gcc -static -std=c99 -Wall srcsaw.c -lm -o _build/saw


square:
	mkdir -p _build
	cc -std=c99 -Wall src/square.c -o _build/square

saw:
	mkdir -p _build
	cc -std=c99 -Wall src/saw.c -lm -o _build/saw

test-linux-square:
	timeout 0.01 _build/square 500 | aplay -t raw -f u8 -c 1 -r 44100

test-linux-saw:
	timeout 0.01 _build/saw 500 | aplay -t raw -f u8 -c 1 -r 44100

clean:
	rm -fr _build
