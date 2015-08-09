---
title: twist-and-shout/shake-it-off
date: 2015-08-08 19:29 UTC
tags:
---

https://github.com/coleww/shake-it-off

http://www.shreddit-hard-co.re/twist-and-shout/

first in series on making weird smartphone controlled toys.

device orientation. x/y/z plane

range of numbers

using range-fit/similar functions to get to 0-1 or 0-127 or 0-255 as is yr wont.


add event handler to make some rad noise or do other cool things on turn.

video game => direction determined by orientation?
crud app => turn in diffy directions to do something? a 180 turn does ???


```
var makeSynth = require('../')
var mapRange = require('range-fit');
var context = new (window.AudioContext || window.webkitAudioContext)()


var nodes = []
for(var i = 0; i < 3; i++){
  nodes.push(makeSynth(context))
  nodes[i].connect(context.destination)
  nodes[i].start()
}

if (window.DeviceOrientationEvent) {
  window.addEventListener("deviceorientation", handleOrientation, true);
} else {
  document.body.textContent = 'BORKED yr browser does not support deviceorientation'
}

var r = 0
var g = 0
var b = 0

function handleOrientation(event) {
  var absolute = event.absolute;

// alpha is the compass direction the device is facing in degrees
  // The DeviceOrientationEvent.alpha value represents the motion of the device around the z axis, represented in degrees with values ranging from 0 to 360.
  // The DeviceOrientationEvent.beta value represents the motion of the device around the x axis, represented in degrees with values ranging from -180 to 180.  This represents a front to back motion of the device.
  // The DeviceOrientationEvent.gamma value represents the motion of the device around the y axis, represented in degrees with values ranging from -90 to 90. This represents a left to right motion of the device.
  var alpha    = event.alpha;
  var beta     = event.beta;
  var gamma    = event.gamma;
  // console.log(alpha, beta, gamma)
  if(alpha) {
    r = mapRange(alpha, 0, 360, 0, 255)
    nodes[0].filter.frequency.value = mapRange(alpha, 0, 360, 200, 5000)
    nodes[0].lowFilter.frequency.value = mapRange(alpha, 0, 360, 300, 3000)
  }
  if(beta) {
    g = mapRange(beta, -180, 180, 0, 255)
    nodes[1].filter.frequency.value = mapRange(beta, -180, 180, 300, 3000)
    nodes[1].lowFilter.frequency.value = mapRange(beta, -180, 180, 200, 5000)
  }
  if(gamma) {
    b = mapRange(gamma, -90, 90, 0, 255)
    nodes[2].filter.frequency.value = mapRange(gamma, -90, 90 , 400, 3500)
    nodes[2].lowFilter.frequency.value = mapRange(gamma, -90, 90, 200, 5000)
  }
  // console.log("rgb("+r+","+g+","+b+")")
  document.body.style.backgroundColor = "rgb("+~~r+","+~~g+","+~~b+")"
}
```