var server = require("./server.js");
var router = require("./router.js");
var routeHandlers = require("./routeHandlers.js");

var handle = {};
handle['/'] = routeHandlers.start;
handle['/start'] = routeHandlers.start;
handle['/upload'] = routeHandlers.upload;

server.start(router.route, handle);
