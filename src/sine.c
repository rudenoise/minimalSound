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
    int period, quaterPeriod, i, halfCount = 0;
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
        sequence[i] = round(sin(stepRad * i) * ((AMP_MAX + 1) / 2));
    }
    i = 0;
    while (1) {
        if (i == quaterPeriod) {
            halfCount += 1;
            rising = false;
        }
        if (i == 0) {
            if (halfCount == 2) {
                halfCount = 0;
            }
            rising = true;
        }
        // send the sample
        if (halfCount < 2) {
            putchar(round(sequence[i] + 127));
        } else {
            putchar(round(128 - sequence[i]));
            //putchar(127);
        }
        // ready the next in sequence
        if (rising == true) {
            i += 1;
        } else {
            i -= 1;
        }
    }

    return 0;
}
