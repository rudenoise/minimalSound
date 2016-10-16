#include <stdio.h>
#include <stdbool.h>

#define CYCLE_RADIUS 600
#define AMP_MAX 255
#define AMP_MIN 0

int main(int argc, char** argv) {
    // set start values for vars
    int tick = 0;
    bool max = false;
    // start unending loop
    while (1) {
        if (tick == CYCLE_RADIUS) {
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
