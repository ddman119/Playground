#include <cstdio>
#include <iostream>

using namespace std;

class Message {
  public:
    Message();
    void Print();
};

Message::Message() {
  cout << "Instantiated new Message\n";
}

inline void Message::Print() {
  cout << "Hello, world!\n";
}

int main() {
  Message *message = new Message();
  message->Print();

  return 0;
}
