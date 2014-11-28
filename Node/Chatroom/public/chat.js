window.onload = function() {
  var messages = [];
  var socket = io.connect('http://localhost:4700');
  var field = document.getElementById("field");
  var name = document.getElementById("name");
  var sendButton = document.getElementById("send");
  var content = document.getElementById("content");

  socket.on('message', function(data) {
    if (data.message) {
      console.log("Received message: ", data.message);

      messages.push(data);
      var html = '';

      for (var i = 0; i < messages.length; i++) {
        html += '<b>' + (messages[i].username ? messages[i].username : 'Server') + ': </b>';
        html += messages[i].message + "<br/>";
      }

      content.innerHTML = html;
    }
    else {
      console.log("Something broke: ", data);
    }
  });

  sendButton.onclick = function() {
    if (name.value == "") {
      alert("Please enter your name");
    }
    else {
      var text = field.value;
      socket.emit('send', { message: text, username: name.value });
    }
  };
};
