---
title: Eating Glue
date: 2015-06-03 23:37 UTC
tags: paste events, browser hijacking, magic, glue, unix
---

# EATING GLUE
## Taking Over the Paste Event

Though they started out as simple document viewers, over the years web browsers have escaped from their sandbox and gained more and more access to operating system level goodness, like your camera and GPS coordinates. This level of intrusivenes used to only be possible for those with the skills and courage to wield awkward Flash hacks, but today this sort of stuff is made available through simple JavaScript APIs to every website you visit. _Awesome._

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

I used this trick to build a [JSON formatter](http://coleww.github.io/json-formatter/) [[code](https://github.com/coleww/json-formatter)] because I wanted to quickly paste a JSON blob to the page and see it transformed, and an input field or textarea would just get in the way of things. Most JSON formatters on the web are laden with options and advertisements, but all I really needed was a quick way to inspect API responses.

By hacking the paste event, I was able to take something that looked like this:

![before](json-og.png)

And make it work more like this:

![after](json-example.gif)

This approach is well aligned with the UNIX philosophy, which holds among it's tenets "make small things" and "text in/text out". Only in this instance, input is handled by the paste event and the output is a div. The web page itself does only one thing and nothing else (literally, there isn't even a title or attribution) which means it composes well with other "modules" in the browser, like for example using `cmd+f` to find things in the formatted JSON. And if I needed to add an option for controlling the indentation level or something I could perhaps add it as a query param in the URL.

The JSON formatter is actually just a wrapper around a node module called [json-nice](https://github.com/JerrySievert/json), and there are probably many other small command line tools that could benefit from being turned into tiny web apps. With [browserify](https://github.com/substack/browserify-handbook) and [npm](http://maxogden.com/node-packaged-modules.html) this becomes really easy.
