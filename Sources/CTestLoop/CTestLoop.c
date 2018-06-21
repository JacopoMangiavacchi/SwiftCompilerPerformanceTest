#include <stdint.h>
#include <stdio.h>

void test6(int64_t *buffer, int64_t tot) {
    for(int i=0; i<tot; i++) {
        *buffer++ = 6;
    }
}

void test7(int64_t *buffer, int64_t tot) {
    int64_t t = tot/10;
    for(int i=0; i<t; i++) {
        *buffer++ = 7;
        *buffer++ = 7;
        *buffer++ = 7;
        *buffer++ = 7;
        *buffer++ = 7;
        *buffer++ = 7;
        *buffer++ = 7;
        *buffer++ = 7;
        *buffer++ = 7;
        *buffer++ = 7;
    }
}
