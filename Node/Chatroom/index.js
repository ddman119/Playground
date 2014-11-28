var express = require("express");
var app = express();
var port = 4700;

app.get("/", function(request, response) {
  response.send("It works!");
});

app.listen(port);
console.log("Listening on port " + port);
