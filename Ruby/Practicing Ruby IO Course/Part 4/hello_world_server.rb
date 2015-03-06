require 'socket'

server = TCPServer.new 'localhost', 8888

def print_successful_socket_response(socket, response)
  socket.print "HTTP/1.1 200 OK \r\n" +
               "Content-Type: text/html\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Server: HelloWorldServer\r\n" +
               "Connection: close\r\n"

  socket.print "\r\n"
  socket.print response
end

loop do
  socket = server.accept
  request = socket.gets

  STDOUT.puts request

  response = "<h1>Hello, world!</h1>\n"
  print_successful_socket_response socket, response

  socket.close
end
