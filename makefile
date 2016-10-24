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

linuxTestSquare:
	timeout 0.01 _build/square 500 | aplay -t raw -f u8 -c 1 -r 44100

linuxTestSaw:
	timeout 0.01 _build/saw 500 | aplay -t raw -f u8 -c 1 -r 44100

linuxTestTriangle:
	timeout 0.01 _build/triangle 500 | aplay -t raw -f u8 -c 1 -r 44100

linuxTestSine:
	timeout 0.01 _build/sine 500 | aplay -t raw -f u8 -c 1 -r 44100

linuxDraw: linuxDrawSquare linuxDrawSaw linuxDrawTriangle linuxDrawSine

linuxDrawSquare:
	bash/makeVisualiser.bash square

linuxDrawSaw:
	bash/makeVisualiser.bash saw

linuxDrawTriangle:
	bash/makeVisualiser.bash triangle

linuxDrawSine:
	bash/makeVisualiser.bash sine

linuxBuildAndDrawSquare: square linuxDrawSquare

linuxBuildAndDrawSaw: saw linuxDrawSaw

linuxBuildAndDrawTriangle: triangle linuxDrawTriangle

linuxBuildAndDrawSine: sine linuxDrawSine

openDrawAll: openDrawSquare openDrawSaw openDrawTriangle openDrawSine

openDrawSquare:
	ksh/makeVisualiser.ksh square
	cat _build/square.txt

openDrawSaw:
	ksh/makeVisualiser.ksh saw
	cat _build/saw.txt

openDrawTriangle:
	ksh/makeVisualiser.ksh triangle
	cat _build/triangle.txt

openDrawSine:
	ksh/makeVisualiser.ksh sine
	cat _build/sine.txt

openBuildAndDrawSquare: square openDrawSquare
openBuildAndDrawSaw: saw openDrawSaw
openBuildAndDrawTriangle: triangle openDrawTriangle
openBuildAndDrawSine: square openDrawSine

openTestAll: openTestSquare openTestSaw openTestTriangle openTestSine

openTestSquare:
	_build/square 500 | aucat -e u8 -c 0:0 -i - &
	sleep 1
	kill `pgrep square`

openTestSaw:
	_build/saw 500 | aucat -e u8 -c 0:0 -i - &
	sleep 1
	kill `pgrep saw`

openTestTriangle:
	_build/triangle 500 | aucat -e u8 -c 0:0 -i - &
	sleep 1
	kill `pgrep triangle`

openTestSine:
	_build/sine 500 | aucat -e u8 -c 0:0 -i - &
	sleep 1
	kill `pgrep sine`

clean:
	rm -fr _build
