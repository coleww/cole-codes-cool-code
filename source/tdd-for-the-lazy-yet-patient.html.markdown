---
title: TDD for the lazy yet patient
tags: tdd clojure puzzles
---

# TDD for the lazy yet patient
## 

have been learning clojure recently, was doing a kata, discovered one weird trick about test driven development!

The challenge: magic square. given a bunch of floating point numbers, arrange them in a 2d array such that all horiz, verts, and diags sum up to the same "magic number". There are games like this in most newspapers...sudoku...etc. some people do them to "stay sharp". programmers write hacks to solve them to "stay sharp" in a language. weird meta-puzzle-solving. 

THE CODE:
https://github.com/coleww/wonderland-clojure-katas/tree/coles-solution/magic-square

if you have a test for some pure function,
just copy the test logic into yr source file,
and write a function that randomly generates potentially valid output.
might take forever to return true. That's ok though, ruby on rails has similar speeds yet it is very popular. 

once the test logic returns true, return that value, and you will have green dots my friend!