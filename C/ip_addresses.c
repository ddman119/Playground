#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <netinet/in.h>

int main(int argc, char *argv[]) {
  struct addrinfo hints, *result, *p;

  int status;
  char ipstr[INET6_ADDRSTRLEN];

  if (argc != 2) {
    printf("Usage: ip_addresses host_name\n");
    return 1;
  }

  memset(&hints, 0, sizeof hints);
  hints.ai_family = AF_UNSPEC;
  hints.ai_socktype = SOCK_STREAM;

  if ((status = getaddrinfo(argv[1], NULL, &hints, &result)) != 0) {
    fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(status));
    return 2;
  }

  printf("IP addresses for %s:\n\n", argv[1]);

  for (p = result; p != NULL; p = p->ai_next) {
    void *address;
    char *ip_version;

    if (p->ai_family == AF_INET) {
      struct sockaddr_in *ipv4 = (struct sockaddr_in *)p->ai_addr;
      address = &(ipv4->sin_addr);
      ip_version = "IPv4";
    }
    else if (p->ai_family == AF_INET6) {
      struct sockaddr_in6 *ipv6 = (struct sockaddr_in6 *)p->ai_addr;
      address = &(ipv6->sin6_addr);
      ip_version = "IPv6";
    }
    else {
      return 3;
    }

    inet_ntop(p->ai_family, address, ipstr, sizeof ipstr);
    printf(" %s: %s\n", ip_version, ipstr);
  }

  freeaddrinfo(result);

  return 0;
}
