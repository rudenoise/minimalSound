#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define AMP_MAX 255
#define AMP_MIN 0

#define PI 3.14159265358979323846264338327

int main(int argc, char** argv) {
    // set start values for vars
    int period, i, out;
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

    // work out steps to make complete cycle
    // in radians
    stepRad = (2 * PI) / period;

    // set counter
    i = 0;

    // generate wave infinitely
    while (1) {

        if (i == period) {
            i = 0;
        }

        out = round(sin(stepRad * i) * ((AMP_MAX - 1) / 2));

        putchar(out + 127);

        i += 1;
    }

    return 0;
}
