#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

#define AMP_MAX 255
#define AMP_MIN 0

int main(int argc, char** argv) {
    // set start values for vars
    int tick = 0;
    bool max = false;
    int halfPeriod;
    // get halfPeriod
    if (argc == 2) {
        // cast the bytes from pos 1 in argv
        // to an integer
        halfPeriod = atoi(argv[1]) / 2;
    } else {
        halfPeriod = 60;
    }
    // start unending loop
    while (1) {
        if (tick == halfPeriod) {
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
