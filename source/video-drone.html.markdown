---
title: video-drone
date: 2015-08-09 15:55 UTC
tags:
---



https://github.com/coleww/tri-tri

each frame, we:
gonna get the webcam input,
make it the src of a hidden video element,
draw that video element to a canvas,
get the pixel data from that canvas,
find the center pixel,
and get it's r/g/b

WOWOWOWOWOWOWOWOWOWOWOW

this is a little clumsy. it's hard to abstract this into a simple module because there are so many variations in how you can do it. https://github.com/sole/gumhelper is probably most likely a much better choice.

ALL TOLD, doing things by hand looks a little something like this:


```javascript
navigator.getUserMedia = navigator.getUserMedia ||
                         navigator.webkitGetUserMedia ||
                         navigator.mozGetUserMedia

var getCenterPixel = require('get-center-pixel') // HOW HANDY!
var ctx = document.getElementById('can').getContext('2d')

gumDropMagic(function(pixel){
  // DO YR MAGIC HERE!!!
})

function gumDropMagic (cb){
  if (navigator.getUserMedia) {
    navigator.getUserMedia({video: true}, function (stream) {
      var video = document.getElementById('video')
      video.src = window.URL.createObjectURL(stream)
      video.onloadedmetadata = function (e) {
        video.play()

        function draw () {
          ctx.drawImage(video, 0, 0, 320, 240)
          var data = ctx.getImageData(0, 0, 320, 240).data
          var pixel = getCenterPixel(data, 320, 240)

          cb(pixel)
          requestAnimationFrame(draw)
        }
        draw()
      } 
    }, function (err)  {
        document.body.textContent = 'sorry gosh, wow, something horrible must have happened'
      })
  } else {
    document.body.textContent = 'sorry yr device does not have a webcam or something whoops'
  }
}
```








once we have rgb you can do a number of things.

grab the center pixel,
get the average of the pixels,
run the pixels through machine learning software and play different music for cats and dogs (umm),
use face detection software to play different music if someone is smiling or frowning,
or control an instrument with your eyes,
or increase the intensity of the sound if the person moves around a lot,

range-fit=> map some r, g, b values to oscillator or filter frequencies (might be super harsh, may be better to range it over an array of notes somehow)
https://www.npmjs.com/package/drone-e-o-synth
https://www.npmjs.com/package/tri-tri
color-search DEMO match colors to control sounds





