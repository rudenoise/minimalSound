#include <stdio.h>
int main(int argc, char** argv) {
    int count = 1, amp;
    while (count < 500) {
        amp = getchar();
        printf("\t%d %d\n", count, amp);
        count += 1;
    }
    return 0;
}

