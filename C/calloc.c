#include <stdio.h>
#include <stdlib.h>

int main() {
  size_t size = sizeof(int);
  int elements = 4;
  int *memory = calloc(elements, size);

  memory[0] = 1;
  memory[1] = 2;
  memory[2] = 123456789;

  printf("int size: %lu\n", size);

  for(int index = 0; index < elements; index++) {
    printf("Memory contents: %08X\n", memory[index]);
  }

  return 0;
}
