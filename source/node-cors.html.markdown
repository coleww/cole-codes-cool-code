---
title: Building a simple CORS API in node
tags:
published: false
---

# Building a simple CORS API in node
## TASTE THE ROCKIES

So you want to build a lil API. Maybe you have some live data to share with the world, maybe you want to make a [funny joke](http://bikeshed.io/), maybe I don't really care what your reasons are. If you want people to use your API, you should consider enabling CORS requests so that it can be accessed from client side javascript. If you don't, then when I try to use jQuery to hit yr API in order to populate my Reactive Backbone Models while idling in Deep Flux, I will get an error and the whole system will crash. It's bad. Trust me.

I'm sure there are all kinds of things pre-built for Express or Hapi and probably even just a plain ole' NPM module somewhere that does the CORS magic for you, but you know sometimes it's nice to drop down a lil closer to that bare http server metal.

### SO, SHOW ME THE CODE!

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

You are of course welcome to copy pasta that code snippet and be on your merry way, but I have taken the liberty of reading through some boring technical documents [[1](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS), [2](http://www.w3.org/TR/cors/#access-control-request-method-request-header)] to try to figure out what the heck this all means:

`res.setHeader('Access-Control-Allow-Origin', '*')`
The Access-Control-Allow-Origin header indicates whether a resource can be shared based by returning the value of the Origin request header, "*", or "null" in the response.  a space-separated list of origins,

`res.setHeader('Access-Control-Request-Method', '*')`
The Access-Control-Request-Method header indicates which method will be used in the actual request as part of the preflight request.


`res.setHeader('Access-Control-Allow-Methods', 'OPTIONS, GET')`
The Access-Control-Allow-Methods header indicates, as part of the response to a preflight request, which methods can be used during the actual request.

The `Allow` header is not relevant for the purposes of the CORS protocol.

`res.setHeader('Access-Control-Allow-Headers', '*')`
The Access-Control-Allow-Headers header indicates, as part of the response to a preflight request, which header field names can be used during the actual request.

```
if ( req.method === 'OPTIONS' ) {
  res.writeHead(200)
  res.end()
  return
}
```
In response to a preflight request the resource indicates which methods and headers (other than simple methods and simple headers) it is willing to handle and whether it supports credentials.

OPTIONS: sometimes, the cors needs to ask yr server if it can cors before it cors's. That's pretty weird, but it's pretty typical for how the HTTP internet tubes work. If you get an OPTIONS request, just 200 ok it immediately.


simple api for serving up folders of JSON
https://github.com/coleww/corpora-api

SAUCES:



