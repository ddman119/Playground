#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int check_authentication(char *password) {
  int authenticated = 0;
  char password_buffer[16];

  strcpy(password_buffer, password);

  if (strcmp(password_buffer, "s3cr3t") == 0) {
    authenticated = 1;
  }

  return authenticated;
}

int main(int argc, char *argv[]) {
  if (argc < 2) {
    printf("Not enough arguments\n");
    return 1;
  }

  if (check_authentication(argv[1])) {
    printf("Authenticated!\n");
  }
  else {
    printf("Incorrect password.\n");
  }

  return 0;
}
