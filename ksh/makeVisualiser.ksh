#!/bin/ksh

set -e

rm -f _build/$1.ksh _build/$1.gif

echo "#!/bin/ksh" > _build/$1.ksh
echo "gnuplot << EOF" >> _build/$1.ksh
echo "set terminal dumb" >> _build/$1.ksh
echo "set output '_build/$1.txt'" >> _build/$1.ksh
echo "plot '-' using 1:2" >> _build/$1.ksh
_build/$1 200 | _build/testPlot >> _build/$1.ksh
echo "        e" >> _build/$1.ksh
echo "EOF" >> _build/$1.ksh

chmod +x _build/$1.ksh

exec _build/$1.ksh
