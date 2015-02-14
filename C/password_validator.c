#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int is_valid(const char* password) {
  if (strcmp(password, "secret") == 0) {
    return 1;
  }
  else {
    return 0;
  }
}

int main() {
  char *input = malloc(256);
  printf("Please enter your password: ");
  scanf("%s", input);

  if (is_valid(input)) {
    printf("Correct!\n");
  }
  else {
    printf("Invalid password.\n");
  }

  free(input);

  return 0;
}
