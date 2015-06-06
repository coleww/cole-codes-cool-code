---
title: shelling-out
date: 2015-06-08 18:55 UTC
tags:
published: false
---

# Shelling Out
## Because Sharing Is Good


I'm a big fan of the UNIX philosophy which holds, among other things, that it's better to build tools that do one thing really well than large tools that do all sorts of things. With a plethora of focused modules at our disposal building an app becomes a matter of connecting them together in interesting ways. But a side effect to this preference for small things is that you end up starting new projects all the time! And if we're doing repetitive tasks to setup our small modules then we might as well write some more small generators to help reduce this tedium.

Traditionally with UNIX, various programs would be connected together with pipes (`|`), and for some tasks a simple bash alias is enough to solve the problem. But for more complicated procedures, like scaffolding apps with templates, it might make more sense to do things in Ruby or Node.js. In which case how do you make your code interact with things like npm, bower, ember, rails, git, etc.? Why, you can always shell out to them!

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

With these, you can easily run shell commands and respond to their output as part of your script. But what if instead of just running a command you want to turn over control to a different program? Maybe that program has user prompts that need answering, or it shows some sweet terminal graphics that you want to see, or perhaps your code is just done or over it or can't even and it's time for something to take it's place.

In Ruby, you can use `exec` which replaces the current process with the given command:

```ruby
exec "rails new monolith"
puts "never gets here cuz rails takes over"
```

In Node.js, there is the [kexec](https://www.npmjs.com/package/kexec) module that does the same thing

```javascript
var kexec = require('kexec')
kexec('ember new behemoth')
```

I ran into this problem while building G ([ruby](https://github.com/coleww/g) / [node](https://github.com/coleww/g-node)), which is wrapper around the Ember and Rails CLI that lets you run the same generator commands in both kinds of app. And I made use of the same trick for [mkproj](https://github.com/coleww/mkproj) which runs `npm init` and `npm install` after making some files and setting up some boilerplate code.

.......bring it back to unix?