#!/bin/bash

set -e

rm -f _build/$1.bash _build/$1.gif

echo "#!/bin/bash" > _build/$1.bash
echo "gnuplot << EOF" >> _build/$1.bash
echo "set terminal gif" >> _build/$1.bash
echo "set output '_build/$1.gif'" >> _build/$1.bash
echo "plot '-' using 1:2" >> _build/$1.bash
_build/$1 | _build/testPlot >> _build/$1.bash
echo "        e" >> _build/$1.bash
echo "EOF" >> _build/$1.bash

chmod +x _build/$1.bash

exec _build/$1.bash
