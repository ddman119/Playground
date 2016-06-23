#include "book.h"
#include <iostream>

int main(void) {
  int pages = 0;
  std::cin >> pages;

  Book book = Book(pages, 2);
  Book secondBook = Book(pages, 2);

  Book total = book + secondBook;

  std::cout << "Number of pages: " << book.pages() << std::endl;

  return 0;
}
