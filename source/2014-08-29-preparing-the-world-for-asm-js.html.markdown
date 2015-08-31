---
title: Preparing The World For ASM.js
date: 2014-08-29 00:00 UTC
tags: javascript, asm, async, ruby, rails, jquery, the future
---

# Preparing The World For ASM.js
## An Open-Sauce Primer

[Thanks to one brave soul’s experiments with Unix based time travel](https://www.destroyallsoftware.com/talks/the-birth-and-death-of-javascript) we have confirmed that, although no one alive today actually understands what asm.js is or does, someday someone will grok it hard and the net result is that we will be able to run Ruby on Rails inside of any web-browser. It is now imperative that we re-evaluate our definition of ‘close to the metal’, or else the future may arrive late to dinner.

asm.js throws a particularly dense monkey wrench into the NodeJS camp of Metallurgology because once you can compile any language to be run as JavaScript in the browser there will no longer be a reason to use NodeJS, except perhaps to execute server code written in Ruby on Rails. Imagine the speed!

While we cannot be certain precisely what role asm.js will play in the coming singularity and/or robot uprising, we should be working to build confidence in a technique I have come to refer to as ‘Polyglot Noding’. That is, the ability to monkey patch functionality from NodeJS and JavaScript into any language so as to fully exploit the power and promise of a compiler-target where every line ends with an ‘| 0'. This is very close to the metal hacking, but I am sure that you did not need to be made aware of this fact! It should be apparent by the abundance of coerced static typing!

Nevertheless, a brief coding exercise:

The jQuery programming language has a function called $.get(). This function is very powerful because it can be used to get money, but it is built on top of the asynchronous A.J.A.X. protocol which the Ruby on Rails core library lacks.
Write a method ‘get’ which accepts a url and a callback, opens the url, passes the response to the callback, and does all of this through non-synchronous means.

```
def get(url, callback)
# yr code here
end
```

We will let you ponder this one for a bit



------------------------------

![](jgl.gif)

--------------------------------

## YOU READY FOR THIS?

<script src="https://gist.github.com/coleww/3771e718dc4778c40a0f.js"></script>

We start by loading open-uri, which gets packaged for free into every purchase of Ruby on Rails. No need to mess with Gemfiles or worry about dependencies here! This is also considered Ruby on Rails Best Practice(tm) because although NPM has solved the issue of dependencies in the NodeJS community, it is unclear whether or not such a package maid would be used in a post-asm.js world.

Our method is just a clean and readable one-liner that requires no explanation. Invoking it is as easy as passing the url from which you will be getting your money and a callback that will do something with that money. Perhaps count it, sort it, spend it, who knows! I don’t! The code is freely licensed open-sauce software so do with it what you wish.

As you can see, I am using the Super-Seattle-Style Ruby on Rails wherein parentheses are never used unless necessary, and opening parentheses are never used before arguments. Yes, my co-workers do hate me. How did you know?

So there you have it! We took a brief detour down into the metal, and wrote some functional code that can be used in every Ruby on Rails project. Just imagine what other Javascripts and jQueries we can implement in Ruby on Rails! Why, with enough bare-metal hacking we might even be able to pull a reverse asm.js and run Node code in our Ruby on Rails servers!