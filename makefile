all: square saw triangle sine plot

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

plot:
	cc -std=c99 -Wall src/testPlot.c -o _build/testPlot

bashTestSquare:
	timeout 0.01 _build/square 500 | aplay -t raw -f u8 -c 1 -r 44100

bashTestSaw:
	timeout 0.01 _build/saw 500 | aplay -t raw -f u8 -c 1 -r 44100

bashTestTriangle:
	timeout 0.01 _build/triangle 500 | aplay -t raw -f u8 -c 1 -r 44100

bashTestSine:
	timeout 0.01 _build/sine 500 | aplay -t raw -f u8 -c 1 -r 44100

bashDraw: bashDrawSquare bashDrawSaw bashDrawTriangle bashDrawSine

bashDrawSquare:
	bash/makeVisualiser.bash square
	cat _build/square.txt

bashDrawSaw:
	bash/makeVisualiser.bash saw
	cat _build/saw.txt

bashDrawTriangle:
	bash/makeVisualiser.bash triangle
	cat _build/triangle.txt

bashDrawSine:
	bash/makeVisualiser.bash sine
	cat _build/sine.txt

bashBuildAndDrawSquare: square bashDrawSquare

bashBuildAndDrawSaw: saw bashDrawSaw

bashBuildAndDrawTriangle: triangle bashDrawTriangle

bashBuildAndDrawSine: sine bashDrawSine

kshDrawAll: kshDrawSquare kshDrawSaw kshDrawTriangle kshDrawSine

kshDrawSquare:
	ksh/makeVisualiser.ksh square
	cat _build/square.txt

kshDrawSaw:
	ksh/makeVisualiser.ksh saw
	cat _build/saw.txt

kshDrawTriangle:
	ksh/makeVisualiser.ksh triangle
	cat _build/triangle.txt

kshDrawSine:
	ksh/makeVisualiser.ksh sine
	cat _build/sine.txt

kshBuildAndDrawSquare: square kshDrawSquare
kshBuildAndDrawSaw: saw kshDrawSaw
kshBuildAndDrawTriangle: triangle kshDrawTriangle
kshBuildAndDrawSine: square kshDrawSine

kshTestAll: kshTestSquare kshTestSaw kshTestTriangle kshTestSine

kshTestSquare:
	_build/square 500 | aucat -e u8 -c 0:0 -i - &
	sleep 1
	kill `pgrep square`

kshTestSaw:
	_build/saw 500 | aucat -e u8 -c 0:0 -i - &
	sleep 1
	kill `pgrep saw`

kshTestTriangle:
	_build/triangle 500 | aucat -e u8 -c 0:0 -i - &
	sleep 1
	kill `pgrep triangle`

kshTestSine:
	_build/sine 500 | aucat -e u8 -c 0:0 -i - &
	sleep 1
	kill `pgrep sine`

clean:
	rm -fr _build
