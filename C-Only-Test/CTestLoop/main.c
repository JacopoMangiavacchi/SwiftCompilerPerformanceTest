//
//  main.c
//  CTestLoop
//
//  Created by Jacopo Mangiavacchi on 6/22/18.
//  Copyright © 2018 Jacopo Mangiavacchi. All rights reserved.
//

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>

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

int main(int argc, const char * argv[]) {
    int tot = 1000;
    if(argc > 1) {
        tot = atoi(argv[1]);
    }

    int64_t *a = malloc(tot * sizeof(int64_t));
    int64_t n = 0;
    clock_t startTime, timeElapsed;

    startTime = clock();
    test6(a, tot);
    timeElapsed = clock();
    n = a[tot/2];
    printf( "Time elapsed for loop%lld: %f s.\n", n, (timeElapsed-startTime)/(double)CLOCKS_PER_SEC );
    
    startTime = clock();
    test7(a, tot);
    timeElapsed = clock();
    n = a[tot/2];
    printf( "Time elapsed for loop%lld: %f s.\n", n, (timeElapsed-startTime)/(double)CLOCKS_PER_SEC );

    free(a);
    return 0;
}
