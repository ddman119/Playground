#ifndef BOOK_H
#define BOOK_H

#include <iostream>
#include <string>

class Book {
  public:
    Book() = default;
    Book(int pageCount): pageCount(pageCount) { }
    Book(int pageCount, int sold): pageCount(pageCount), totalSold(sold) { }

  public:
    int pages();
    int sold();

  private:
    std::string isbn;
    int totalSold = 1;
    int pageCount = 0;
};

int Book::pages() {
  return pageCount;
}

int Book::sold() {
  return totalSold;
}

#endif
