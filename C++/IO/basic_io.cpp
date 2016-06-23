#include <iostream>

int main() {
  std::cout << "Enter two numbers:" << std::endl;

  int first, second = 0;
  std::cin >> first >> second;

  (std::cout << "Their sum is ") << first + second << std::endl;

  return 0;
}
