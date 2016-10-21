#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define AMP_MAX 255
#define AMP_MIN 0

int main(int argc, char** argv) {
    // set start values for vars
    bool rising = false;
    double period, halfPeriod, step, amp = (AMP_MAX / 2);
    // get halfPeriod
    if (argc == 2) {
        // cast the bytes from pos 1 in argv
        // to an integer
        period = atoi(argv[1]);
    } else {
        // set default
        period = 400;
    }
    halfPeriod = period / 2;
    // work out step
    step = AMP_MAX / halfPeriod;
    // start unending loop
    while (1) {
        if (rising) {
            amp += step;
        } else {
            amp -= step;
        }
        if (amp >= AMP_MAX) {
            // reached the top amplitude
            // start descent
            rising = false;
            // limit to maximum amplitude
            amp = AMP_MAX;
        }
        if (amp <= AMP_MIN) {
            // reached minimum amplitude
            // start ascent
            rising = true;
            // limit to minimum amplitude
            amp = AMP_MIN;
        }
        // send the sample
        putchar(round(amp));
    }
    return 0;
}
