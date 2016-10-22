#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define AMP_MAX 255
#define AMP_MIN 0

#define PI 3.14159265358979323846264338327

int main(int argc, char** argv) {
    // set start values for vars
    bool rising = true, firstHalf = true;
    int period, quaterPeriod, i, out;
    double stepRad;

    // get period
    if (argc == 2) {
        // cast the bytes from pos 1 in argv
        // to an integer
        period = atoi(argv[1]);
    } else {
        // set default
        period = 400;
    }

    // setup an array to store amplitudes to 1/4 cycle
    quaterPeriod = period / 4;
    double sequence[quaterPeriod];

    // work out steps to make complete cycle
    // in radians
    stepRad = (2 * PI) / period;

    // populate sequence
    for (i = 0; i < quaterPeriod; i += 1) {
        // calculate amplitude of opposite side
        // using sine of step
        // multiplied by radius (1/2 maximum amplitude)
        sequence[i] = round(sin(stepRad * i) * ((AMP_MAX - 1) / 2));
    }

    // reset counter
    i = 0;

    // generate wave infinitely
    while (1) {

        if (firstHalf) {
            out = (127 + sequence[i]);
        } else {
            out = (128 - sequence[i]);
            if (i > 5 && sequence[i] <= 1) {
                out = 0;
            }
        }

        if (rising) {
            i += 1;
        } else {
            i -= 1;
        }

        if (i == 0) {
            rising = true;
            firstHalf = !firstHalf;
        }

        if (i >= quaterPeriod) {
            rising = false;
        }

        putchar(out);
    }

    return 0;
}
