#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define AMP_MAX 255
#define AMP_MIN 0

int main(int argc, char** argv) {
    // set start values for vars
    int tick = 0;
    double period, step, amp = 48.0;
    // get period
    if (argc == 2) {
        // cast the bytes from pos 1 in argv
        // to an integer
        period = atoi(argv[1]);
    } else {
        period = 120;
    }
    // work out step
    step = AMP_MAX / period;
    // start unending loop
    while (1) {
        if (tick == period) {
            // half a cycle done, reset count
            tick = 0;
            // drop the aplitude back to min
            amp = AMP_MIN;
        }
        // raise the amplitude
        if (amp < AMP_MAX) {
            amp += step;
        }
        // write out value
        putchar(round(amp));
        // tick
        tick += 1;
    }
    return 0;
}
