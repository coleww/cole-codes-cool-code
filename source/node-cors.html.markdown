---
title: NODE CORS API
tags:
published: false
---

# Enabling CORS in Node.js
## TASTE THE ROCKIES

Building a simple API in node. Cool to serve lil bits of data to a thing. Awesome. express/rails/whatever have cors libraries, but sometimes the app is so simple that it's nice to play with that bare metal http server. _CLOSENESS TO IT_

what is the coors:

```javascript
var http = require("http")
var server = http.createServer(function (req, res) {
    res.setHeader('Access-Control-Allow-Origin', '*')
    res.setHeader('Access-Control-Request-Method', '*')
    res.setHeader('Access-Control-Allow-Methods', 'OPTIONS, GET')
    res.setHeader('Access-Control-Allow-Headers', '*')

    if ( req.method === 'OPTIONS' ) {
      res.writeHead(200)
      res.end()
      return
    }

    // do stuff
})
server().listen(process.env.PORT || 8000)
```

allow requests from any origin (maybe you just want your websites to use this endpoint)
<!-- first you allow all req methods, then restrict? -->
only allow OPTIONS and GET requests. (open up other METHODS if you support dat?)
allow headers:

OPTIONS: sometimes, the cors needs to ask yr server if it can cors before it cors's. That's pretty weird, but it's pretty typical for how the HTTP internet tubes work. If you get an OPTIONS request, just 200 ok it immediately.

https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS


simple api for serving up folders of JSON
https://github.com/coleww/corpora-api
