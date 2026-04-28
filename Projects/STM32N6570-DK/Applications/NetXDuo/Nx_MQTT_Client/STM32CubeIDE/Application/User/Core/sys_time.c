/*
 * sys_time.c
 *
 *  Created on: Jan 8, 2026
 *      Author: mika
 */


#include <sys/time.h>
#include <time.h>


int _gettimeofday(struct timeval *tv, void *tzvp)
{
    (void)tzvp;

    if (tv) {
        tv->tv_sec  = 1769240627;
        tv->tv_usec = 0;
    }
    return 0;
}
