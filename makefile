all: square saw triangle sine

static-musl:
	mkdir -p _build
	musl-gcc -static -std=c99 -Wall src/square.c -lm -o _build/square
	musl-gcc -static -std=c99 -Wall src/saw.c -lm -o _build/saw
	musl-gcc -static -std=c99 -Wall src/triangle.c -lm -o _build/triangle
	musl-gcc -static -std=c99 -Wall src/sine.c -lm -o _build/sine


square:
	mkdir -p _build
	cc -std=c99 -Wall src/square.c -o _build/square

saw:
	mkdir -p _build
	cc -std=c99 -Wall src/saw.c -lm -o _build/saw

triangle:
	mkdir -p _build
	cc -std=c99 -Wall src/triangle.c -lm -o _build/triangle

sine:
	mkdir -p _build
	cc -std=c99 -Wall src/sine.c -lm -o _build/sine

test-linux-square:
	timeout 0.01 _build/square 500 | aplay -t raw -f u8 -c 1 -r 44100

test-linux-saw:
	timeout 0.01 _build/saw 500 | aplay -t raw -f u8 -c 1 -r 44100

test-linux-triangle:
	timeout 0.01 _build/triangle 500 | aplay -t raw -f u8 -c 1 -r 44100

test-linux-sine:
	timeout 0.01 _build/sine 500 | aplay -t raw -f u8 -c 1 -r 44100

test-openBSD-square:
	_build/square 500 | aucat -e u8 -c 0:0 -i - &
	sleep 1
	kill `pgrep square`

test-openBSD-saw:
	_build/saw 500 | aucat -e u8 -c 0:0 -i - &
	sleep 1
	kill `pgrep saw`

test-openBSD-triangle:
	_build/triangle 500 | aucat -e u8 -c 0:0 -i - &
	sleep 1
	kill `pgrep saw`

test-openBSD-sine:
	_build/sine 500 | aucat -e u8 -c 0:0 -i - &
	sleep 1
	kill `pgrep saw`

clean:
	rm -fr _build
