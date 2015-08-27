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

A lot of people talk a lot of things about TDD. There are those that talk about TDD as their jobs. There are even meta-TDD consultants who talk to management about talking to their employees about TDD. But while it is easy to spew empty platitudes at developers, it is much harder to figure out how to use this knowledge in your day to day software engineering. Some skills can only be gained through practice, experience, and pain. However there are those rare techniques and stategies that can be effectively utilized on every project.

Recently I discovered one such technique while working on a [code kata in clojure](https://github.com/gigasquid/wonderland-clojure-katas). The challenge was to compute a magic square: given a bunch of floating point numbers, you must arrange them in a 2-dimensional array such that ever row, column, and diagonal of the matrix/square a sum up to the same "magic number". 

![magic square](magic.png)

There are similar games in most newspapers. Some people solve puzzles like this to keep their mind sharp, while programmers write scripts that solve these puzzles to stay sharp in a language. Weird.

The tests for this kata looked like this:

```clojure
(defn sum-rows [m]
  (map #(reduce + %) m))

(defn sum-cols [m]
  [(reduce + (map first m))
   (reduce + (map second m))
   (reduce + (map last m))])

(defn sum-diagonals [m]
  [(+ (get-in m [0 0]) (get-in m [1 1]) (get-in m [2 2]))
   (+ (get-in m [2 0]) (get-in m [1 1]) (get-in m [0 2]))])

(deftest test-magic-square
  (testing "all the rows, columns, and diagonal add to the same number"
    (is (= (set (sum-rows (magic-square values)))
           (set (sum-cols (magic-square values)))
           (set (sum-diagonals (magic-square values)))))

    (is (= 1
           (count (set (sum-rows (magic-square values))))
           (count (set (sum-cols (magic-square values))))
           (count (set (sum-diagonals (magic-square values))))))))
```

There are some helper functions to sum the rows, columns, and diagonals of a 2-d matrix, as well as a test that runs those helpers to check that the return value is actually a magic square. Because this is functional programming, there is no state and our function is expected to be pure, so it should always returns the same output for a given input and has no side effects.

I'm sure there is some really clever solution to solve this problem instantly, or at the very least some way to construct an optimized tree or queue or stack or some other horrifying software-interview-whiteboarding-question data-structure, but in this case it is really easy to just copy-paste the `sum-___` functions into our src file and randomly shuffle the values around until you get a valid arrangement:

```clojure
(defn make-a-square [values]
  (mapv #(vec %) (partition 3 (shuffle values))))
```

That example might be a little confusing, lets thread that s-expression with the `->>` macro. *queries emacs manual* `C-c RET t-l`!

```clojure
(defn make-a-square [values]
  (->> 
    values ; we take the values
    (shuffle) ; we shuffle them
    (partition 3) ; we partition them into 3 element arrays
    (mapv #(vec %)))) ; finally, we convert the lists into vectors
```

You can take a peak at [all the code](https://github.com/coleww/wonderland-clojure-katas/tree/coles-solution/magic-square), but essentially we call `make-a-square` in a loop until it randomly happens upon a result that passes all the copy pasta'd magic square tests, then we return that result to the magic square tests, which all pass because the result has already been tested, and you have green dots my friend!

<center>![chill, passing tests](chill.png)</center>

Now lets not celebrate just yet. This function we have created might not always be pure for every given input! If a set of numbers had multiple magic-square arrangements then we might return any one of them. This is an utter betrayal of the principles and philosophies of functional programming, but I'm gonna let it slide in this instance. 

Perhaps more troubling is the fact that this algorithm could potentially take until the-sun-burns-out-into-a-dull-husk-and-all-life-on-earth-ceases to find a correct result. That's ok though, Ruby on Rails has similar speeds yet it is very popular and used by many important businesses. 

Furthermore, despite it's potential for random sluggishness this script is still usually way faster than your human meat brain can even begin to comprehend. The [Nielsen Norman Group](http://www.nngroup.com/articles/response-times-3-important-limits/) lays out some important limits in software response times:

> 0.1 second is about the limit for having the user feel that the system is reacting instantaneously, meaning that no special feedback is necessary except to display the result.

> 1.0 second is about the limit for the user's flow of thought to stay uninterrupted, even though the user will notice the delay...

> 10 seconds is about the limit for keeping the user's attention focused on the dialogue. For longer delays, users ... should be given feedback indicating when the computer expects to be done...

Therefore if you can, on average, usually come up with a randomized solution to your problem in under 10 seconds, then that is a reasonable solution to your problem! Remember! Our definition of TDD stated that the last step is refactoring your code, but it never says that you have to do that refactoring immediately! This is an agile shop of course, we'll deal with fixing that in another sprint, just slap a spinner on it and call it a day.

<center>![spinners](spinnerz.gif)</center>

We were particularly lucky here in that the kata did not require handling the case of being passed a list of numbers for which there is no magic square. If that test was added, our function would run forever and ever, never ever returning anything. In a real world deployment of the magic square algorithm we would certainly need to improve things by adding a timeout that detects if no magic square has been found after a healthy amount of time, and does something accordingly. 

I hope you have learned a trick or two in this lesson. If I could present a succint `tl;dr` version, it would be this: 

> the most important thing is to have passing tests, even if that means breaking your code to do it.

_:clap-emoji:_
