#include <stdio.h>

int main(void) {
  char *string = "Hello, world\n";

  printf("Original: %s", string);
  string++;
  printf("Updated: %s", string);

  return 0;
}
