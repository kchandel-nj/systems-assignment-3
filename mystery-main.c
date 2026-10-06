/* Complete the C version of the driver program for mystery. This C code does
 * not need to compile. */

#include <stdio.h>
#include <stdlib.h>

extern long crunch(long, long);

int main(int argc, char *argv[]) {
  char *endptr;
  if (argc >= 3) {
    long result = crunch(strtol(argv[1], &endptr, 10), strtol(argv[2], &endptr, 10));

    if (result < 0) {
      printf("hat\n");
    } else if (result == 0) {
      printf("tea\n");
    } else {
      printf("beer\n");
    }

    return 0;
  } else {
    printf("Two arguments required.\n");
    return 1;
  }
}

