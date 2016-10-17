#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

#define AMP_MAX 255
#define AMP_MIN 0

int main(int argc, char** argv) {
    // set start values for vars
    int tick = 0;
    bool max = false;
    int radius;
    // get radius
    if (argc == 2) {
        // cast the bytes from pos 1 in argv
        // to an integer
        radius = atoi(argv[1]);
    } else {
        radius = 60;
    }
    // start unending loop
    while (1) {
        if (tick == radius) {
            // half a cycle done, reset count
            tick = 0;
            // reverse amplitude
            max = !max;
        }
        // write out value
        if (max == true) {
            putchar(AMP_MAX);
        } else {
            putchar(AMP_MIN);
        }
        // tick
        tick += 1;
    }
    return 0;
}
