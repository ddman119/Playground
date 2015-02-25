#include <stdio.h>
#include <stdlib.h>

int main(void) {
  void *ptr = malloc(1024);
  printf("Top of heap: %p\n", ptr);

  void *second_ptr = malloc(1);
  printf("Top of heap: %p\n", second_ptr);

  void *third_ptr = malloc(1);
  printf("Top of heap: %p\n", third_ptr);

  return 0;
}
