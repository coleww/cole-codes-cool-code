---
title: TDD for the Lazy, Patient, and Messy
date: 2015-08-26 14:37 UTC
tags: tdd, clojure, human brain response times, magic square
---

# TDD for the lazy, patient, and messy
## Because sometimes, doing things in potentially unbounded time is still "fast enough"

<center>![tdd](tdd.png)</center>

TDD is a very important software engineering buzz word that you should be able to define so that people think that you know what you are doing. Here is some text I copied from [wikipedia](https://en.wikipedia.org/wiki/Test-driven_development):

----------------------------------------------------------

Test-driven development (TDD) is a software development process that relies on the repetition of a very short development cycle: 

- first the developer writes an (initially failing) automated test case that defines a desired improvement or new function, 
- then produces the minimum amount of code to pass that test, 
- and finally refactors the new code to acceptable standards.

---------------------------------------------------------

<center>![test-driven](tdn.png)</center>

A lot of people talk a lot about TDD. Some do it as their jobs. But while it is easy to spew buzz words and empty platitudes, it is much harder to figure out how to use this knowledge in your day to day software engineering. Some things can only be learned through practice and experience and pain, but there are some general techniques and stategies that can be utilized across projects.

I discovered one such technique recently while working on a [code kata in clojure](https://github.com/gigasquid/wonderland-clojure-katas)

The challenge: magic square. given a bunch of floating point numbers, arrange them in a 2d array such that all horiz, verts, and diags sum up to the same "magic number". There are games like this in most newspapers...sudoku...etc. some people do them to "stay sharp". programmers write hacks to solve them to "stay sharp" in a language. weird meta-puzzle-solving. 

THE CODE:
https://github.com/coleww/wonderland-clojure-katas/tree/coles-solution/magic-square

if you have a test for some pure function,
just copy the test logic into yr source file,
and write a function that randomly generates potentially valid output.
might take forever to return true. That's ok though, ruby on rails has similar speeds yet it is very popular. 

once the test logic returns true, return that value, and you will have green dots my friend!

<center>![chill, passing tests](chill.png)</center>

THIS IS STILL way faster than your human meat brain can even comprehend. we often complain about websites or computers being laggy, but yr cruel meat computer of a brain barely notices. cruel assemblage of meat and wires we call our brain. and in any case, just put a spinner on it

http://www.nngroup.com/articles/response-times-3-important-limits/

0.1 second is about the limit for having the user feel that the system is reacting instantaneously, meaning that no special feedback is necessary except to display the result.
1.0 second is about the limit for the user's flow of thought to stay uninterrupted, even though the user will notice the delay. Normally, no special feedback is necessary during delays of more than 0.1 but less than 1.0 second, but the user does lose the feeling of operating directly on the data.
10 seconds is about the limit for keeping the user's attention focused on the dialogue. For longer delays, users will want to perform other tasks while waiting for the computer to finish, so they should be given feedback indicating when the computer expects to be done. Feedback during the delay is especially important if the response time is likely to be highly variable, since users will then not know what to expect.

<center>![spinners](spinnerz.gif)</center>