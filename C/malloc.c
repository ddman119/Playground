#include <stdio.h>

void *custom_malloc(size_t size);

int main() {
  int value = 1;
  int *value_pointer = &value;
  
  printf("Pointer: %d", *value_pointer);

  return 0;
}

void *custom_malloc(size_t size) {
  
}
