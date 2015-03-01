#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
  int value = 5;
  char first_buffer[8], second_buffer[8];

  strcpy(first_buffer, "one");
  strcpy(second_buffer, "two");

  printf("[BEFORE] second_buffer is at %p and contains '%s'\n", second_buffer, second_buffer);
  printf("[BEFORE] first_buffer is at %p and contains '%s'\n", first_buffer, first_buffer);
  printf("[BEFORE] value is at %p and contains %d (0x%08x)\n", &value, value, value);

  printf("Copying %lu bytes into second_buffer\n", strlen(argv[1]));
  strcpy(second_buffer, argv[1]);

  printf("[AFTER] second_buffer is at %p and contains '%s'\n", second_buffer, second_buffer);
  printf("[AFTER] first_buffer is at %p and contains '%s'\n", first_buffer, first_buffer);
  printf("[AFTER] value is at %p and contains %d (0x%08x)\n", &value, value, value);

  return 0;
}
