#include <ncurses.h>
#include <unistd.h>

#define DELAY 20000

int main(int argc, char *argv[]) {
  initscr();
  noecho();
  curs_set(FALSE);

  int x, y = 0;
  int max_y = 0, max_x = 0;
  int next_x = 0;
  int direction = 1;

  while(1) {
    getmaxyx(stdscr, max_y, max_x);

    clear();

    mvprintw(y, x, "o");
    refresh();

    usleep(DELAY);

    next_x = x + direction;

    if (next_x >= max_x || next_x < 0) {
      direction *= -1;
    }
    else {
      x += direction;
    }
  }

  endwin();
}