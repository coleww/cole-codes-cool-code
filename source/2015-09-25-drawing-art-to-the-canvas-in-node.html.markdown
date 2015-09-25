---
title: Drawing Art To The Canvas With Node
date: 2015-09-25 14:09 UTC
tags: node, javascript, canvas, art, detournement, situationism
---

# Drawing Art To The Canvas With Node
## Build Your Own Photoshop! Cuz That's Something You Want To Do I Bet!

![may 1968, paris](68.jpg)

[The Situationists](https://en.wikipedia.org/wiki/Situationist_International) were a group of French radicals who almost overthrew their government through non-violent means in 1968. Pretty cool. 

One tactic they emphasized is called [Détournement](https://en.wikipedia.org/wiki/D%C3%A9tournement) which essentially entails "turning expressions of the capitalist system and its media culture against itself".

The Situationists would [re-dub old movies](http://physicalimpossibility.com/2011/05/22/movie-rip-offs-a-users-guide-detournement-and-dub-parodies/) with their own theories in place of the dialogue, or put [revolutionary slogans](http://bopsecrets.org/comics/dagwood.htm) over the text in comic books.

If you are interested in the history and nuances of this technique, may I recommend [A User’s Guide to Détournement](http://www.bopsecrets.org/SI/detourn.htm)?

While the Situationists had to [manually cut up their texts](https://en.wikipedia.org/wiki/Cut-up_technique) and [tediouslyedit their films](https://en.wikipedia.org/wiki/The_Clock_(2010_film)) we can abstract away a lot of this work with a few lines of JavaScript. With a handful of node modules we can write scripts that will recombine images into new forms, perhaps adding some procedurally generated text along the way as well, and then post the result to twitter or tumblr or whatever is popular these days. Because all algorithms are political, we can guide our work to try to make a potent statement or perhaps just a funny joke about something (though always be sure to punch up and not down).

Some fantastic Twitter innovations in this area include [Alt Universe Prompts](https://twitter.com/AU_Prompts) and [https://twitter.com/MenDoing](Men Doing Things) by [Darius Kazemi](https://twitter.com/tinysubversions), [Think I Do](https://twitter.com/think_i_do) and [UnconventionalDesire](https://twitter.com/desires_exe) by [Casey Kolderup](https://twitter.com/ckolderup), [Penguin and House](https://twitter.com/penguinandhouse) and [https://twitter.com/eventuallybot](Eventually Bot) by [Allison Parrish](https://twitter.com/aparrish), as well as [smoke weed](https://twitter.com/_WE_GET_IT_BRO_) and [Super Smash Dabbers](https://twitter.com/SmashDabberBros) by myself. 

![my mind has been replaced by moving images](mind.gif)

In order to draw images to the canvas we will using the [node canvas module](https://www.npmjs.com/package/canvas). This module depends on [cairo](https://github.com/Automattic/node-canvas/wiki/_pages) for which the installation might vary depending on your system. 

The question of how and where to get your source images from is a pretty good question. I'd give it 7/10 points, definitely could be better but it shows improvement from last time. [The Flickr API](https://www.flickr.com/services/api/) has I think been historically the place to go to get random appropriately-licensed images. I recorded [a screencast](https://vimeo.com/139794441) in which I made a bot that recklessly used a [google image search node module](https://www.npmjs.com/package/fetch-image) and [corpora data](https://github.com/dariusk/corpora)  to grab random interesting images. Apparently [imgur](https://api.imgur.com/) and [giphy](https://api.giphy.com/) both have APIs but I do not have opinions about either one.

### WHATEVER STOP TALKING ABOUT FRENCH PHILOSOPHY AND TWITTER BOTS JUST SHOW ME THE CODE

##### fine... 

What follows is basically the code that powers [The Bird](https://twitter.com/the_______bird_), which is a pseudo-bot that auto-magically layers my middle finger on top of images of corporate headquarters. I made this because I wanted to try to flip off every startup in San Francisco, but they kept getting acquired or shutting down before I could get to their offices, so I needed a faster way to express my distaste for capitalism.

```
// pronounced fuss
var fs = require('fs')
// hope u `npm install --save canvas` already!
var Canvas = require('canvas')
var Image = Canvas.Image

// A simple helper function to load image data from the file system. i'm not gonna annotate this function because it's boring. 
// Suffice to say that it turns data into pixels and other than that just accept it ok, gosh.
function loadFile(path, cb){
  fs.readFile(path, function(err, data){
    if (err) throw err
    img = new Image
    img.onload = function() {
      cb(img)
    }
    img.src = data
  })
}

// use our helper function to load the middle finger image, yeah.
loadFile('./the_bird.png', function(img){
  // get the size of the image. i suppose i could hardcode this, it'll never change. oh well. lazy.
  var width = img.width
  var height = img.height

  // make a new canvas that is the same size as the middle finger image, because we wouldn't want to let that get distorted or lose any fidelity
  canvas = new Canvas(width, height)

  // get that context
  ctx = canvas.getContext('2d')

  // load a corporation image
  loadFile('./a_corporation.png', function(toFlip){

    // draw the corporation to the context, scaling it to the size of the canvas. 
    // The other 4 arguments are the x,y coordinates for the top-left and bottom-right corners of the image.
    ctx.drawImage(toFlip, 0, 0, width, height)

    // draw the middle finger on top of the corporation. 
    // If, for example, you wanted to draw it only on the right half of the canvas you would instead pass `(img, width/2, height/2, width, height)`
    ctx.drawImage(img, 0, 0, width, height)

    // write the image to the file system
    fs.writeFileSync('current.png', canvas.toBuffer())
  })
})
```

Interacting with the node canvas is exactly the same as the [HTML5 Canvas](https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API), so any tutorials for that will basically work the same here. The only differences are in loading and saving images because in the browser you use AJAX and in node you use `fs`. 

Now that you know how to edit images in node, go forth and build a bot that critiques capitalism through clever pop cultural tropes! 




