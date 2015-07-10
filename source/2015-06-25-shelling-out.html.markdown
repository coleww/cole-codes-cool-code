---
title: shelling out to the system
date: 2015-06-25 18:55 UTC
---

# Shelling Out
## I would gladly shell out 5$ for you to pipe a burrito to me, streaming, over the course of the next 7 minutes.

I'm a big fan of the UNIX philosophy which holds, among other things, that it's better to build tools that do one thing really well. With a plethora of focused modules at our disposal building an app becomes a matter of connecting them together in new and interesting ways. But a side effect to this preference for small things is that you end up starting new projects all the time! And if we're doing repetitive tasks to setup our small modules then we might as well write some more small modules to help reduce this tedium. Turtles all the way down.

Traditionally one would connect the output of various programs to the inputs of others with pipes (`|`), like so `cd | grep potatoes`.

![pipe](pipe.png)

This works fine for non-interactive programs that are all text-in/text-out, and you can certainly write bash scripts taht `touch` and `mkdir` your way to much accomplishment, but what about  more complicated CLI tools like npm, bower, ember, rails, or git which might do things like prompt the user, hit the network, or generate a metric ton of files? Well, you can always shell out to them instead!

![shelling](shelling.png)

In Ruby, the easiest way to shell out a command is to put it backticks, like so:

```ruby
# this would print the current directory
puts `ls`
```

The same shelling, but with Node.js:

```javascript
var exec = require('child_process').exec
exec('ls', function (error, stdout, stderr) {
  // this would print the current directory
  console.log(stdout)

  // probably some callback hell here
});
```

With these, you can easily run shell commands and respond to their output as part of your script. But what if instead of just running a command you want to turn over control to a different program? Maybe that program has user prompts that need answering or it shows some pretty sweet terminal graphics

In Ruby you can use `exec`, which replaces the current process with the given command:

```ruby
exec "rails new monolith"
puts "never gets here cuz rails takes over"
```

In Node.js there is the [kexec](https://www.npmjs.com/package/kexec) module, which does the exact same thing:

```javascript
var kexec = require('kexec')
kexec('ember new behemoth')
```

I used some of these magical spells to build [mkproj](https://github.com/coleww/mkproj), which generates a bunch of files and does some NPM stuff in order to scaffold lil browserify projects. Being able to run code on the command line from a Ruby or Node script opens up tons of possibilities for destroying your computer in a for loop! Reader beware!