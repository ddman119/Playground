#include <stdio.h>
#include <unistd.h>

int main(void) {
  printf("Preparing to fork\n");

  pid_t pid;

  if ((pid = fork()) == 0) {
    printf("Hello from the child process!\n");
  }
  else {
    printf("Hello from the original process! Child ID: %d\n", pid);
  }

  return 0;
}
