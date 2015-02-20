/*

  request_header.c
  ================
  Sam Symons (sam@samsymons.com)

  Functions for parsing HTTP headers.

*/

#include "request_header.h"
#include <ctype.h>
#include <stdbool.h>
#include <string.h>
#include <stdlib.h>
#include <sys/time.h>
#include <stdio.h>
#include <errno.h>
#include <ctype.h>

ssize_t read_socket_line(int fd, void *void_pointer, size_t maximum_length) {
  ssize_t n, rc;
  char    c, *buffer;

  buffer = void_pointer;

  for ( n = 1; n < maximum_length; n++ ) {

    if ( (rc = read(fd, &c, 1)) == 1 ) {
      *buffer++ = c;
      if ( c == '\n' )
      break;
    }
    else if ( rc == 0 ) {
      if ( n == 1 )
      return 0;
      else
      break;
    }
    else {
      if ( errno == EINTR )
      continue;

      exit(0);
    }
  }

  *buffer = 0;
  return n;
}

void initRequestHeader(struct RequestHeader *header) {
  header->method = UNSUPPORTED;
  header->referrer = NULL;
  header->useragent = NULL;
  header->resource = NULL;
  header->host = NULL;
  header->statuscode = 200;
}

void freeRequestHeader(struct RequestHeader *header) {
  if (header->useragent) {
    free(header->useragent);
  }

  if (header->referrer) {
    free(header->referrer);
  }

  if (header->resource) {
    free(header->resource);
  }

  if (header->host) {
    free(header->host);
  }
}

int parseHeader(char *buffer, struct RequestHeader *header) {
  printf("Parsing header line: %s", buffer);

  static bool first_header_line = true;
  char *temp;
  char *endptr;
  int length;

  if (first_header_line) {
    /*  Get the request method, which is case-sensitive. This
    version of the server only supports the GET and HEAD
    request methods.                                        */

    if (!strncmp(buffer, "GET ", 4)) {
      header->method = GET;
      buffer += 4;
    }
    else if (!strncmp(buffer, "HEAD ", 5)) {
      header->method = HEAD;
      buffer += 5;
    }
    else {
      header->method = UNSUPPORTED;
      header->statuscode = 501;
      return -1;

      printf("Unsupported request\n");
    }

    /*  Skip to start of resource  */

    while (*buffer && isspace(*buffer)) {
      buffer++;
    }

    /*  Calculate string length of resource...  */

    endptr = strchr(buffer, ' ');

    if (endptr == NULL) {
      length = strlen(buffer);
    }
    else {
      length = endptr - buffer;
    }

    if (length == 0) {
      header->statuscode = 400;
      return -1;
    }

    /*  ...and store it in the request information structure.  */

    header->resource = calloc(length + 1, sizeof(char));
    strncpy(header->resource, buffer, length);

    /*  Test to see if we have any HTTP version information.
    If there isn't, this is a simple HTTP request, and we
    should not try to read any more headers. For simplicity,
    we don't bother checking the validity of the HTTP version
    information supplied - we just assume that if it is
    supplied, then it's a full request.                        */

    if (strstr(buffer, "HTTP/")) {
      header->type = FULL;
    }
    else {
      header->type = SIMPLE;
    }

    first_header_line = false;

    return 0;
  }


  /*  If we get here, we have further headers aside from the
  request line to parse, so this is a "full" HTTP request.  */

  /*  HTTP field names are case-insensitive, so make an
  upper-case copy of the field name to aid comparison.
  We need to make a copy of the header up until the colon.
  If there is no colon, we return a status code of 400
  (bad request) and terminate the connection. Note that
  HTTP/1.0 allows (but discourages) headers to span multiple
  lines if the following lines start with a space or a
  tab. For simplicity, we do not allow this here.              */

  endptr = strchr(buffer, ':');
  if ( endptr == NULL ) {
    header->statuscode = 400;
    return -1;
  }

  temp = calloc((endptr - buffer) + 1, sizeof(char));
  strncpy(temp, buffer, (endptr - buffer));
  // StrUpper(temp);


  /*  Increment buffer so that it now points to the value.
  If there is no value, just return.                    */

  buffer = endptr + 1;

  while (*buffer && isspace(*buffer)) {
    ++buffer;
  }

  if (*buffer == '\0') {
    return 0;
  }

  /*  Now update the request information structure with the
  appropriate field value. This version only supports the
  "Referer:" and "User-Agent:" headers, ignoring all others.  */

  if (!strcmp(temp, "User-Agent")) {
    header->useragent = malloc(strlen(buffer) + 1);
    strcpy(header->useragent, buffer);
  }
  else if (!strcmp(temp, "Referer")) {
    header->referrer = malloc(strlen(buffer) + 1);
    strcpy(header->referrer, buffer);
  }
  else if (!strcmp(temp, "Host")) {
    header->host = malloc(strlen(buffer) + 1);
    strcpy(header->host, buffer);
  }

  free(temp);

  return 0;
}

int getRequest(int fd, struct RequestHeader *header) {
  char   buffer[1024] = {0};
  int    return_value;
  fd_set fds;
  struct timeval timeout;

  timeout.tv_sec  = 10;
  timeout.tv_usec = 0;

  do {
    FD_ZERO(&fds);
    FD_SET(fd, &fds);

    return_value = select(fd + 1, &fds, NULL, NULL, &timeout);

    if (return_value < 0) {
      exit(0);
    }
    else if (return_value == 0) {
      return -1;
    }
    else {
      read_socket_line(fd, buffer, 1024 - 1);
      // Trim(buffer);

      if ( buffer[0] == '\0' ) {
        break;
      }

      if (parseHeader(buffer, header)) {
        break;
      }
    }
  } while (header->type != SIMPLE);

  return 0;
}
