#include <arpa/inet.h>
#include <dirent.h>
#include <errno.h>
#include <netdb.h>
#include <netinet/in.h>
#include <signal.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <sys/time.h>

#define PORT "6000"

static int start_server(char *port_number);
void list_directory_contents();
int handle_request(int descriptor);
ssize_t read_line(int sockd, void *voidbuffer, size_t maxLength);

void sigchld_handler(int s)
{
  while(waitpid(-1, NULL, WNOHANG) > 0);
}

void *get_in_addr(struct sockaddr *sa)
{
  if (sa->sa_family == AF_INET) {
    return &(((struct sockaddr_in*)sa)->sin_addr);
  }

  return &(((struct sockaddr_in6*)sa)->sin6_addr);
}

int main(int argc, char *argv[]) {
  char *port_number = PORT;

  // Detect if we should use a custom port:

  if (argc > 1 && ((argc - 1) % 2 == 0)) {
    char *port_argument = argv[1];

    if (strncmp(port_argument, "--port:", strlen("--port:")) != 0) {
      port_number = argv[2];
    }
  }

  // Start the server:

  /* list_directory_contents(); */
  start_server(port_number);

  // while (1) {
    // Wait for a connection
  // }

  return 0;
}

int start_server(char *port_number) {
  int sock_fd, remote_fd;
  struct addrinfo hints, *servinfo, *p;
  struct sockaddr_storage remote_address;
  socklen_t sin_size;
  struct sigaction sa;
  char s[INET6_ADDRSTRLEN];
  int rv;
  int yes = 1;

  memset(&hints, 0, sizeof hints);
  hints.ai_family = AF_UNSPEC;
  hints.ai_socktype = SOCK_STREAM;
  hints.ai_flags = AI_PASSIVE;

  if ((rv = getaddrinfo(NULL, PORT, &hints, &servinfo)) != 0) {
    fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(rv));
    return 1;
  }

  for (p = servinfo; p != NULL; p->ai_next) {
    if ((sock_fd = socket(p->ai_family, p->ai_socktype, p->ai_protocol)) == -1) {
      printf("Failed to set socket file descriptor\n");
      continue;
    }

    if (setsockopt(sock_fd, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(int)) == -1) {
      printf("Set socket options failed\n");
      exit(1);
    }

    if (bind(sock_fd, p->ai_addr, p->ai_addrlen) == -1) {
      close(sock_fd);
      printf("Failed to bind\n");
      continue;
    }

    break;
  }

  if (p == NULL) {
    printf("Server failed to bind\n");
    return 2;
  }

  freeaddrinfo(servinfo);

  if (listen(sock_fd, 10) == -1) {
    printf("Failed to listen\n");
    exit(1);
  }

  sa.sa_handler = sigchld_handler;
  sigemptyset(&sa.sa_mask);
  sa.sa_flags = SA_RESTART;

  if (sigaction(SIGCHLD, &sa, NULL) == -1) {
    exit(1);
  }

  printf("Server started on port %s\n", port_number);

  while (1) {
    sin_size = sizeof remote_address;
    remote_fd = accept(sock_fd, (struct sockaddr *)&remote_address, &sin_size);

    if (remote_fd == -1) {
      printf("Failed to accept connection\n");
      exit(0);
    }

    inet_ntop(remote_address.ss_family, get_in_addr((struct sockaddr *)&remote_address), s, sizeof s);

    printf("Server got connection from %s\n", s);

    if (!fork()) {
      close(sock_fd); // Close the listening socket, we won't be handling any more requests.

      handle_request(remote_fd);

      printf("Cleaning up child process with ID %d\n\n", getpid());
      close(remote_fd);
      exit(0);
    }

    close(remote_fd);
  }
}

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

int handle_request(int descriptor) {
  printf("Handling request with descriptor: %d\n", descriptor);

  for (int n = 1; n < 100; n++) {
    char buffer[1024] = {0};
    ssize_t size = read_line(descriptor, &buffer, 1024);

    printf("Buffer: %s (size %lu)\n", buffer, size);
  }

  /* if (send(descriptor, "Hello, world!\n", 13, 0) == -1) { */
  /*   // Failed to send */
  /* } */

  return 0;
}

ssize_t read_line(int sockd, void *voidbuffer, size_t maxLength) {
  ssize_t n, rc;
  char c, *buffer;

  buffer = voidbuffer;

  for (n = 1; n < maxLength; n++) {
    if ((rc = read(sockd, &c, 1)) == 1) {
      *buffer++ = c;

      if (c == '\n') {
        break;
      }
    }
    else if (rc == 0) {
      if (n == 1) {
        return 0;
      } else {
        break;
      }
    }
    else {
      printf("Error in read_line\n");
    }
  }

  *buffer = 0;
  return n;
}
