---
title: Meta Test Driven Development
date: 2015-08-03 15:02 UTC
tags: testing, tdd, unix, meta-tdd, ruby, node, generators
---

# Meta Test Driven Development
## Making your test suite run another test suite

As a programmer, I find myself in a weird position of being both lazy and all about dat UNIX philosophy. My laziness makes me want to do as little work as possible, but my enthusiasm for UNIX makes me want to create as many small modules as possible. And what could be more boring than setting up boiler plate code for a new small module?

The solution, of course, is to write a scaffolding generator(s)! That way the computer can create all the appropriately named folders and files that I will need for a project, and also do things like fill in sensible defaults for config files or even insert some dummy smokescreen code. 

The generator code will of course have a test suite: we create a new dummy app and then check that the files are all there and that they contain what we expect and then we rimraf it. But what about the dummy app? It too might have a smokescreen test suite, which we can use to demonstrate that everything is running correctly (or at least correctly enough to print "hello world"). 

![glitchy test recursion](testrecurse.png)

### RUBY

The first time I did this trick was in Ruby with Minitest. Here, it turned out to be easy as loading the test file:

`load './such_test_bot/test/such_test_bot_test.rb'`

Thats about all there is to see, but if you really want more sauce code here are the tests for my [twitter bot generator](https://github.com/coleww/twitter_bot_generator/tree/master/test). The rakefile simply loads all these files, which runs the tests for the generator as well as each different type of generated bot. 

- WOW THAT WAS SO EASY THAT I AM ALREADY BORED

You are correct, Ruby is like that. 

### NODE.JS

I recently tried to do this trick again in Node and wound up facing some strange issues. I thought I could take the easy route and just `require` my test files, and after that failed I even put in some extra effort to test out something like `exec(cd botDir && npm test)`, but I instantly hit a wall that seemed to be surrounding a littly bundle of hell that we all know as `/node_modules`. 

Don't get me wrong, npm is A M A Z I N G, but when it comes to "how my JavaScript dependencies get from the internet to a compiled state in my project folder" I know absolutely nothing and prefer to keep it that way. The error I was facing seemed to be that when my project's copies of tap/tape ran the test suite for the generated project, there was some sort of unfathomable versioning error that caused the function/constant `defined` to be `undefined`. O_o wow.

To verify that this was in fact the culprit I made it so that the generated app did an `npm install` before running the tests, and everything worked! But making my test suite hit the network and download packages would be a horrible, just awful thing. (fact: at my first job our test suite did this)

Instead I took the middle-road-hack: I generated a new dummy app, `cd`'d into the directory, and then manually `npm install --save-dev`'d the bare minimum packages that it would take for it's test suite to run/pass. I then took the `node_modules` folder that was created and copied it over to my generator project as `test_modules`. Now when I wanted to run a generated test suite I just had to copy that `test_modules` folder over to the generated project as it's `node_modules` before running the tests:

```javascript
var exec = require('child_process').exec

tap.test('does all the stuff', function (t) {
  // generate a generatedAppThing i guess?
  
  exec('cp -r test_modules generatedAppThing/node_modules && cd generatedAppThing && node test.js', function (error, stdout, stderr) {
    t.ok(!error, 'generated module also works')
  })
})
```

After that runs I just call a test assertion from the meta-test callback, and if that fails I know I broke something in the generated code. See more in [mkproj/test.js](https://github.com/coleww/mkproj/blob/master/test.js) 

It is indeed unfortunate that I now have this `test_modules` thing checked into my project, and even worse that those modules will be harder to update now, but I think this awkwardness is worth the assurance that my code is really really working.

--------------------------------------------

To take this one step further, for a particularly complicated generator app one might use a meta-TDD style. The test suite for the generator would simply create a new app and call it's test suite. You would start out by writing the bare minimum of code to generate an app that has a failing test, then make that generated test pass, and continue in this fashion, forever and ever. For a larger project like Yeoman which abstracts project generation across multiple domains, one might even write a generator-generator which could be meta-meta-test-driven. Turtles, all the way.

![turtles](turts.jpg)

### WOWWWW