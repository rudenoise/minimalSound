#include <math.h>

#define PI 3.14159265358979323846264338327

int main(int argc, char** argv) {
    // 30 degrees = 0.083... of a circle
    //return round(sin((30 * (PI / 180))) * 128);
    //
    return round(sin((PI * 2) * 0.083333) * 128);
}
