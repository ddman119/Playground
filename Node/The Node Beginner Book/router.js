function route(handle, pathname, response) {
  if (typeof handle[pathname] === 'function') {
    handle[pathname](response);
  }
  else {
    console.log("No handler for " + pathname);

    response.writeHead(404, {"Content-Type": "text/plain"});
    response.write("Not found");
    response.end();
  }
}

exports.route = route;
