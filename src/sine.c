#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define AMP_MAX 255
#define AMP_MIN 0

#define PI 3.14159265358979323846264338327

int main(int argc, char** argv) {
    // set start values for vars
    bool rising = false;
    int period, quaterPeriod, i;
    double stepRad;
    // get halfPeriod
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
    double sequence[period / 4];
    // work out steps to make complete cycle
    // in radians
    stepRad = (2 * PI) / period;
    // populate sequence
    for (i = 0; i < quaterPeriod; i += 1) {
        // calculate amplitude of opposite side
        // using sine of step
        // multiplied by radius (1/2 maximum amplitude)
        sequence[i] = round(sin(stepRad * i) * (AMP_MAX / 2));
    }

    return 0;
}