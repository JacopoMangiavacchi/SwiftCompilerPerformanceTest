#include <stdint.h>
#include <stdio.h>

void test6(int64_t *buffer, int64_t size) {
    for(int i=0; i<size; i++) {
        *buffer++ = 6;
    }
}
