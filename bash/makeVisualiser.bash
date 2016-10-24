#!/bin/bash

set -e

#rm -f _build/$1.bash _build/$1.gif
rm -f _build/$1.bash _build/$1.txt

echo "#!/bin/bash" > _build/$1.bash
echo "gnuplot << EOF" >> _build/$1.bash
#echo "set terminal gif" >> _build/$1.bash
#echo "set output '_build/$1.gif'" >> _build/$1.bash
echo "set terminal dumb" >> _build/$1.bash
echo "set output '_build/$1.txt'" >> _build/$1.bash
echo "plot '-' using 1:2" >> _build/$1.bash
_build/$1 300 | _build/testPlot >> _build/$1.bash
echo "        e" >> _build/$1.bash
echo "EOF" >> _build/$1.bash

chmod +x _build/$1.bash

exec _build/$1.bash
