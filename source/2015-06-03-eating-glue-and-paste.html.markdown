---
title: Eating Glue
date: 2015-06-03 23:37 UTC
---

# EATING GLUE
## Taking Over the Paste Event

Over the years browsers have gained more and more access to the underlying operating system level goodness, like your camera and GPS coordinates. This level of intrusivenes used to only be possible for those who made use of awkward Flash hacks, but today this sort of stuff is made available through simple JavaScript APIs to every website you visit. _Awesome._

![Ralph likes to hack JavaScript](paste.jpg)

One basic computer technology that we can hijack and manipulate however we please is pasting. Some people think it's wrong to mess with fundamental UI behavior like clicking or scrolling or, I suppose, `ctrl+v`, but I say SHOW ME THE CODE:

```javascript
    // take over any paste event that occurs on this page
    document.body.addEventListener('paste', function(e){
      var data = e.clipboardData.getData('text/plain')

      alert('YOU TRIED TO PASTE ' + data + ', TOO BAD.')

      return false // don't let the normal "paste" event happen
    })
```

And that's it!

[According to my in depth research into this subject](http://stackoverflow.com/questions/6035071/intercept-paste-event-in-javascript) you need to use `window.clipboardData.getData('Text')` in IE, or `e.originalEvent.clipboardData` if you install the event handler with something called "Jquery".


#### ok but why

I used this trick to build a [JSON formatter](http://coleww.github.io/json-formatter/) [[code](https://github.com/coleww/json-formatter)] because I wanted to be able to quickly paste a JSON blob to the page and see it transformed, and an input field or textarea would just get in the way of things.

This approach is also fairly well aligned with the UNIX philosophy, which holds among it's tenets "make small things" and "text in/text out". Only here, input is handled by the paste event and the output is a div. The web page itself does only one thing and nothing else which means it composes well with other modules, like perhaps using `cmd+f` to find things in the formatted JSON. And if I needed to add an option for controlling the indentation level I could perhaps add it as a query param in the URL.

The JSON formatter is actually just a wrapper around a node module called [json-nice](https://github.com/JerrySievert/json), and there are probably many other small command line tools that could benefit from being turned into tiny web apps. With [browserify](https://github.com/substack/browserify-handbook) and [npm](http://maxogden.com/node-packaged-modules.html) this becomes really easy.
