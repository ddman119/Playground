#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  char *const parameters[] = {"/bin/ls", NULL};
  int result = execv("/bin/ls", parameters);

  return 0;
}
