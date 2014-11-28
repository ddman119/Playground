var express = require("express");
var app = express();
var port = 4700;

app.set('views', __dirname + '/tpl');
app.set('view engine', 'jade');
app.engine('jade', require('jade').__express);
app.use(express.static(__dirname + '/public'));

app.get("/", function(request, response) {
  response.render("page");
});

var io = require("socket.io").listen(app.listen(port));
console.log("Listening on port " + port);

// Handle socket.io's traffic:

io.sockets.on('connection', function(socket) {
  socket.emit('message', { message: "Welcome to the chat" });
  socket.on('send', function(data) {
    io.sockets.emit('message', data);
  });
});
