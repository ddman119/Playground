/*

  request_header.h
  ================
  Sam Symons (sam@samsymons.com)

  Functions for parsing HTTP headers.

*/

#ifndef REQUEST_HEADER_H
#define REQUEST_HEADER_H

enum RequestMethod { GET, HEAD, UNSUPPORTED };
enum RequestType { SIMPLE, FULL };

struct RequestHeader {
  enum RequestMethod method;
  enum RequestType type;
  char *referrer;
  char *useragent;
  char *resource;
  int statuscode;
}

#define MAXIMUM_REQUEST_LINES (1024)

void initRequestHeader(struct RequestHeader *header);
void freeRequestHeader(struct RequestHeader *header);

int parseHeader(char *buffer, struct RequestHeader *header);
int getRequest(int fd, struct RequestHeader *header);

#endif // REQUEST_HEADER_H
