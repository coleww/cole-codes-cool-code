---
title: drawing-stuff-to-canvas-in-node
tags:
---

smash dabbers, middle gfinger..um...

FUN TO MASH UP IMAGES! WOW!

DRAW TEXT OM TJE THING! SPLIT SCREEN! QUADRANTS! GOSH!



var fs = require('fs')
var Canvas = require('canvas')
var Image = Canvas.Image
var exec = require('child_process').exec
var pick = require('pick-random')


function loadFile(path, cb){
  fs.readFile(path, function(err, data){
    if (err) throw err;
    img = new Image;
    img.onload = function() {
      cb(img)
    }
    img.src = data;
  });
}

module.exports = function (words, cb) {
  exec("rm -rf ./imgs && mkdir imgs && fim '" + words +"' -d imgs -n 3", function(err, stdout){
    console.log('got imgs')
    if(err) throw err
    var imag = './imgs/' + pick(fs.readdirSync('./imgs'))

    loadFile('./the_bird.png', function(img){
      console.log('loaded bird')
      var width = img.width
      var height = img.height
      canvas = new Canvas(width, height)
      ctx = canvas.getContext('2d');

      loadFile(imag, function(toFlip){
        console.log('loaded corporation')
        ctx.drawImage(toFlip, 0, 0, width, height);
        ctx.drawImage(img, 0, 0, width, height);
        console.log('writing file')
        var pathe = 'current.png'
        fs.writeFileSync(pathe, canvas.toBuffer());
        cb(pathe)
      })
    })
  })
}