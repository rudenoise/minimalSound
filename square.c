#include <stdio.h>
#include <stdbool.h>

int main(int argc, char** argv) {
    int tick = 0;
    bool max = false;
    // start unending loop
    while (1) {
        if (tick == 600) {
            tick = 0;
            max = !max;
        }
        if (max == true) {
            putchar(255);
        } else {
            putchar(0);
        }
        tick += 1;
    }
    return 0;
}
