#include <stdio.h>
#include <unistd.h>
#include <dirent.h>

void list_directory_contents() {
  DIR *d = opendir(".");
  struct dirent *dir;

  if (d)
  {
    while ((dir = readdir(d)) != NULL)
    {
      printf("%s\n", dir->d_name);
    }

    closedir(d);
  }
}

int main(int argc, char *argv[]) {
  list_directory_contents();

  return 0;
}
