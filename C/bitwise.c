#include <stdio.h>

int main() {
  int first = 0x01;
  int second = 0x03;
  int xor = first ^ second;
  int and = first & second;

  printf("First: %x, second: %x, XOR: %x, AND: %x\n", first, second, xor, and);

  return 0;
}
