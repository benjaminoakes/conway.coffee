if require?
  http   = require('http')
  static = require('node-static')

class WebServer
  start: (port = 8080) ->
    staticServer = new static.Server('./public')
    
    httpServer = http.createServer (req, res) ->
      req.addListener 'end', ->
        staticServer.serve(req, res)
    
    httpServer.listen(port)

    port

root = exports ? this
root.WebServer = WebServer
