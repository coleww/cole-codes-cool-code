---
title: context-switching-ember-rails

tags:
---

Ember and Rails make a great choice for a one-two-slam of front and back end framework. They both have powerful CLI tools and come fresh-out-the-generator setup to create RESTful JSON CRUD APIs (ooo la la) through test-driven-development (oh my). 

Both frameworks emphasize convention over configuration which means less bikeshedding over how to organize files or names things or set up basic infrastructure, but still having the ability to enter that bikeshed and paint it whatever color the team decides on if that is the route we end up choosing to go down after a series of lengthy meanings.

It also means that common solutions can be extracted and easily re-used on other projects because they all share a consistent architecture. If I solve a deployment issue in my Rails app then I can possibly abstract it into a gem or plugin so others can solve the same issue. 

This consistency in architecture also exists between Ember and Rails in their CLI. Both frameworks emphasize using generator commands to ensure that files are named right and add boilerplate code.

You will notice that:

ember generate ...
rails generate ...

buuuuut



But do u ever find yrself in this position?


```
$ ember g model foo
version: 0.2.3
You have to be inside an ember-cli project in order to use the generate command
```

OOPS u forgot what you were doing and tried to `ember` inside of a rails project.


This is called context switching. very bad. MAKE THEM THE SAME!

![geee demo](g-demo.gif)



geee (because people have already pushed libraries called `g`).


With geee, you can simply type `g model foo` and it will figure out whether you are in an Ember or Rails project and pre-prend the correct generator accordingly

[Ruby gem](https://rubygems.org/gems/geee) (`gem install geee`) or [Node module](https://www.npmjs.com/package/geee) (`npm install -g geee`)