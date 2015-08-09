---
title: Publishing Web Audio Instruments to npm
tags:
---

Web audio is awesome but very close to the metal. Need a way to publish pre-assembled synths so our projects don't get taken over by audioNode boilerplate. Create a high level audio-node like interface that allows us to quickly create and connect synths and fx's while still being able to modify any individual paramater.

I have been using the following interface to achieve this:

```
synth: {
  keys(),
  connect(destination),
  start(),
  stop(),
  export(),
  import(data),
  audioNodes, ...,
  fns?, ...
}
```

- `keys()` => Returns an array of string keys to audioNodes, for example: `["osc1", "filter", "distortion", "gain"]`. One could then do `synth["osc1"].frequency.value = 10000` or whatever you so desire. The naming of these keys is arbitrary but hopefully somehow indicates which type of audioNode they are.
- `connect(destination)` => Connects the output nodes of the synth to a destination or other node.
- `start()` => Calls start() on all the source nodes. 
- `stop()` => Calls stop() on all the source nodes. Shhhhhh.
- `export()` => Returns JSON respresentation of the instrument. For easily saving settings between browser sessions.
- `import(data)` => Loads JSON data, or use default values if no data is passed.
- `audioNodes ...` => Each node in the synth will be present as a property on the object, allowing for direct manipulation. Their keys can be found with `keys()`
- `fns? ...` => Other arbitrarily named functions might or might not also be present on the object, such as for performing complex control changes that would be unwieldy to do directly, like setting oscillators to play chords, or turning on that dubstep wobble




experimenting with html5 browser apis controlling web audio, and for each project i do i have been publishing the synth i build to npm, using this api

https://www.npmjs.com/package/drone-e-o-synth

https://www.npmjs.com/package/tri-tri