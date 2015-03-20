#include <stdio.h>
#include <stdlib.h>

void someFunction(int a, int b) {
  int result = a + b;
  char *ptr = malloc(sizeof(char));

  printf("result address (on the stack): %p\n", &result);
  printf("ptr address (on the stack): %p\n", &ptr);
  printf("ptr address (on the heap): %p\n", ptr);
}

int main(void) {
  someFunction(1, 2);
  return 0;
}
