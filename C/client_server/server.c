#include <arpa/inet.h>
#include <errno.h>
#include <netdb.h>
#include <netinet/in.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdbool.h>

#define PORT "3500"
#define BACKLOG 15

void sigchld_handler(int s)
{
  while(waitpid(-1, NULL, WNOHANG) > 0);
}

void *get_in_address(struct sockaddr *socket_address)
{
  if (socket_address->sa_family == AF_INET) {
    return &(((struct sockaddr_in*)socket_address)->sin_addr);
  }

  return &(((struct sockaddr_in6*)socket_address)->sin6_addr);
}

int main(void) {
  printf("Configuring state...");

  int listening_fd, connection_fd;
  struct addrinfo hints, *servinfo, *p;
  struct sockaddr_storage their_addr;
  socklen_t sin_size;
  struct sigaction sa;
  char s[INET6_ADDRSTRLEN];
  int return_value;
  
  printf("Setting up...");

  memset(&hints, 0, sizeof hints);
  hints.ai_family = AF_UNSPEC;
  hints.ai_socktype = SOCK_STREAM;
  hints.ai_flags = AI_PASSIVE;

  if (getaddrinfo(NULL, PORT, &hints, &servinfo) != 0) {
    printf("Failed to get address info.\n");
    return 1;
  }

  p = servinfo;

  if ((listening_fd = socket(p->ai_family, p->ai_socktype, p->ai_protocol)) == -1) {
    return 1;
  }

  int yes = 1;

  if (setsockopt(listening_fd, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(int)) == -1) {
    exit(1);
  }

  if (bind(listening_fd, p->ai_addr, p->ai_addrlen) == -1) {
    printf("Failed to bind.\n");
    close(listening_fd);
    return 2;
  }

  freeaddrinfo(servinfo);

  printf("Listening to %d\n", listening_fd);

  if (listen(listening_fd, BACKLOG) == -1) {
    close(listening_fd);
  }

  printf("Preparing server loop\n");

  while (1) {
    sin_size = sizeof their_addr;
    connection_fd = accept(listening_fd, (struct sockaddr *)&their_addr, &sin_size);

    inet_ntop(their_addr.ss_family, get_in_address((struct sockaddr *)&their_addr), s, sizeof s);
    printf("Got connection from %s\n", s);

    send(connection_fd, "Hello, world!", 13, 0);
    close(connection_fd);
  }

  return 0;
}
