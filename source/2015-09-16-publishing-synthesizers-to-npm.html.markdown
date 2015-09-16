---
title: Publishing Web Audio Instruments to npm
date: 2015-09-16 15:18 UTC
tags: sound, javascript, web audio, noise, npm
---

# Publishing Web Audio Instruments to npm
## npm install dubstep

The state of web audio in the browser is pretty chill these days, but using it is still very close to that audio metal. Web audio provides excellent core objects like oscillators and filters, but it is up to the user to wire them together. For complex synthesizers and effects this might involve dozens of audioNodes and many lines of code just to get that skrillex monster bass wobbles bumping out your webpage.

We need a way to publish pre-assembled audio graphs with a consistent API so that our projects don't get taken over by copy pasted audioNode boilerplate.

This pre-built synth can be thought of just like any other audioNode. It will have `start` and `stop` functions, a `connect` function to send it to the speakers or other nodes. But instead of having audioParams, it will have a `keys` function that returns the names of all the audioNodes that make up the synth. You create such a synth by `require`'ing the module and calling it, passing the audioContext as an argument.

I have been using the following interface to achieve this dream:

```
synth: {
  keys(),

  connect(destination),
  input(),

  start(time),
  stop(time),

  export(),
  import(data),

  audioNodes ...,
  fns? ...
}
```

- `keys()` => Returns an array of string keys to audioNodes, for example: `["osc1", "filter", "distortion", "gain"]`. One could then do `synth["osc1"].frequency.value = 10000` or whatever you so desire. The naming of these keys is arbitrary but hopefully somehow indicates which type of audioNode they are.

- `connect(destination)` => Connects the output nodes of the synth to a destination or other node.
- `input()` => For an effect or audio processor, this function returns the input node, for example `guitar.connect(dubstep.input())`. Of course, you can connect the output of any audioNode to an audioParam on another audioNode like `guitar.connect(wobbler.lfo.frequency)`.

- `start(time)` => Calls start(time) on all the source nodes. 
- `stop(time)` => Calls stop(time) on all the source nodes. Shhhhhh.

- `export()` => Returns JSON respresentation of the instrument. For easily saving settings between browser sessions.
- `import(data)` => Loads JSON data, or use default values if no data is passed.

- `audioNodes ...` => Each node in the synth will be present as a property on the object, allowing for direct manipulation. Their keys can be found with `keys()`. For example, drone-e-o-synth contains the keys `['source', 'filter', 'lowFilter', 'distortion', 'volume']`
- `fns? ...` => Other arbitrarily named functions might or might not also be present on the object, such as for performing complex control changes that would be unwieldy to do directly, like setting oscillators to play chords, or turning on that dubstep wobble. Presumably the module author would tell you about this magic if it exists.

--------------------------------------------------------------

To use one of these modules you would first `npm install` it, probably with a `--save-dev` as this is presumably a browserify project and because you want your dependencies to be well documented and to welcome collaboration. In your codes, you might do something like:

```
  var makeSynth = require('the-name-of-a-synth-module')
  var context = new (window.AudioContext || window.webkitAudioContext)()
  var synth = makeSynth(context)
  synth.connect(context.destination)
  synth.start()
```

At which point a horrible noise would be wailing out of your speakers! A W E S O M E!!!

-----------------------------------------------------------------

Thus far I have made 3 modules in this fashion, each of which includes some sort of strange demo app as well:

- [drone-e-o-synth](https://www.npmjs.com/package/drone-e-o-synth) - a drone synth with a bunch of resonance filters and a demo that lets you control them by moving your laptop or phone around.
- [tri-tri](https://www.npmjs.com/package/tri-tri) - a weird triangly synth with a fun and noisy video game about color to demonstrate what it sounds like
- [wobbler](https://www.npmjs.com/package/wobbler) - a simple dubstep wobble effect with a demo that lets you tap/click to change the wub wubs.

My hope is that after making a handful or two of these synth modules, it will be possible to quickly `npm install`, `require()`, and `connect` together some reallllllllllly out-there browser synths with [web-audio-ui](https://www.npmjs.com/package/web-audio-ui), [Browserify](https://github.com/substack/browserify-handbook), and a few lines of code. 

------------------------------------------------------------------------------

[https://github.com/openmusic](openmusic) also provides a collection of very useful audioNodes and web components. Most of my synths include at least one openmusic module, and I find the sample player and oscillator to be indispensable for doing audio work on the web. 