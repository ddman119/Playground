#include <stdio.h>

#define MAXLENGTH 1000

int getCurrentLine(char line[], int maxline);
void copy(char to[], char from[]);

int main() {
  int currentLength;
  int maximumLength;

  char currentLine[MAXLENGTH];
  char longestLine[MAXLENGTH];

  maximumLength = 0;

  while ((currentLength = getCurrentLine(currentLine, MAXLENGTH)) > 0) {
    if (currentLength > maximumLength) {
      maximumLength = currentLength;
      copy(longestLine, currentLine);
    }

    if (maximumLength > 0) {
      printf("Longest line: %s", longestLine);
    }
  }

  return 0;
}

int getCurrentLine(char line[], int maxline) {
  int c, i;

  for (i = 0; i < maxline - 1 && (c = getchar()) != EOF && c != '\n'; ++i) {
    line[i] = c;
  }

  if (c == '\n') {
    line[i] = c;
    ++i;
  }

  line[i] = '\0';

  return i;
}

void copy(char to[], char from[]) {
  int i = 0;

  while ((to[i] = from[i]) != '\0') {
    ++i;
  }
}
