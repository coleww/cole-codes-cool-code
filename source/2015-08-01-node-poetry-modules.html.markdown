---
title: Node.js Poetic Modules
date: 2015-08-01 22:53 UTC
tags: node, npm, poetry, literature, unix
---

# Node.js Poetic Modules
## Presenting A Voice Unto The Computer

<center>![deep dreamed surrealism](surreal.png)</center>


Node.js and npm provide a wonderfully vibrant and delightfully rich ecosystem for making browser-or-terminal-based works of art. Generally I start a project by searching around for existing modules that do what I need, or if there are none then I write the module that does what I need and publish it to npm (*nice*). With browserify I can use the same code for a CLI tool as I do for a website. 

This makes it really easy to explore the full spectrum of possibilities for a given artistic concept or linguistic algorithm. For example, some modules work well in the browser where you can edit inputs and change paramaters on the fly, while others might be better utilised as part of a command line script. I have heard this style of development and deployment referred to as "isomorphic JavaScript", but call it what you will I just think it's darn nifty that this code will run on anything from a refrigerator to a jumbotron. 

While there are many Node.js modules available for interfacing with every IO stream that you could possibly connect to your computer, I would like to discuss some Node.js modules that I have published recently which operate purely on, by, for, and around text:

----------------

- [eat-wrapper](https://github.com/coleww/eat-wrapper) is a set of helper functions for the Edinburgh Associative Thesauraus, which is kind of like a 70s British pseudo-word-net. One might iterate over a sentence and use it to get random words that are related to that sentence, and then find other sentences that include those related words, and so on.

- [word-vomit](https://github.com/coleww/word-vomit) accepts a string and randomly replaces certain words in that string with other words that are of the same part of speech. Nice for subtly changing the meaning of a passage through random juxtaposition.

- [n-plus-7](https://github.com/coleww/n-plus-7) employs a technique of the [Oulipo](https://en.wikipedia.org/wiki/Oulipo) whereby each noun in a string is replaced with the seventh noun after that noun in the dictionary. You can replace "noun" with any list or category of words, and you can also change the offset from seven to any positive or negative integer.

- [poetic-vomit](https://github.com/coleww/poetic-vomit) is similar to word-vomit, but instead replaces words with a random rhyming word. This is quite useful for generating song lyrics or rhythmic poetry.

- [is-snowball](https://github.com/coleww/is-snowball) detects whether or not a given string is a "snowball", that is, if each word in the string is 1 character longer than the previous one, i.e, "o my wow this snowy ballll". The reverse case of descending length can also be detected. This might might be good to throw in the path of a web scraper or tweet stream or the entirety of Project Gutenberg.

- [new-slang](https://github.com/coleww/new-slang) accepts a map of string sequences to string replacements, and transforms strings of text by replacing those string sequences with the, err, uh, replacements. For example, given a map of `{ou: 'ooo'}` and a string like `'you dawg'`, this module would return `'yooo dawg'`. If the function was called over and over with a map like `{ou: ooui}` and the output of the previous transformation it might produce something similar to [Allison Parrish](https://github.com/aparrish/linear-lsystem-poetry)'s l-system poem generator.

- [lipogram](https://github.com/coleww/lipogram) demonstrates another constraint of the Oulipo whereby a given text does not contain a letter or set of letters, for example [A Void by Georges Perec](https://en.wikipedia.org/wiki/A_Void) which does not contain the letter e. One could, perhaps, draw deep meaning from a poem composed out of sentences from Ruby on Rails blog posts that do not contain the letters `["C", "O", "M", "P", "U", "T", "E", "R"]`.

- [each-cons](https://github.com/coleww/each-cons) does not do anything on it's own...it is just a helper function that exists in Ruby which I wanted to have available in Node.js without requiring all of underscore/lodash/whatever. This function returns consecutive sequences of an array, so given `[1, 2, 3, 4, 5]` and a sequence length of `3`, it would return `[[1, 2, 3], [2, 3, 4], [3, 4, 5]]`. This is particularly handy for constructing [Markov chains](https://www.khanacademy.org/computing/computer-science/informationtheory/moderninfotheory/v/markov_chains), and, I am certain, other things.

- [diacriticize](https://github.com/coleww/diacriticize) basically performs a light [zalgo](http://www.eeemo.net/) maneuver on the text. It seems to be horridly broken on a lot of platforms, so user beware.

- [to-unicode](https://github.com/coleww/to-unicode) transforms some text into unicode equivalents, so you can add circles around all yr letters or switch to a mono-spaced font. Like diacriticize, there are some issues sometimes.  `¯\_(ツ)_/¯ unicode  ¯\_(ツ)_/¯`

---------------------------

These modules don't serve any "real" purpose, but they are fun to make and usually produce amusing output. Furthermore, in my day to day job I am usually almost always fixing minor bugs or building incremental features on user interfaces to RESTful CRUD APIs in a SAAS fashion, so it is nice to have an excuse to design, implement, benchmark, and optimize a real live algorithm. Art is a wonderful excuse to try out something new, whether it be an algorithm, framework, database, or language. I for one first became truly familiar with and enamored by mongoDB only through writing a video game inside of it.

Moreover, all of these modules follow what I consider to be best practices for Node.js projects: uses the [standard](https://github.com/feross/standard) JavaScript style/linter, has tests, has CI setup to run those tests, has documentation that includes a breakdown of the API for the module and some examples, has a small demo app built that demonstrates what the thing does, and, if it makes sense to, it includes a CLI script version of the module. 

Other reasons to use JavaScript to destroy language:

- [NaNoGenMo](https://github.com/dariusk/NaNoGenMo): which, put simply, is an annual event wherein you "Spend the month of November writing code that generates a novel of 50k+ words.".
- [twitter bots](http://tinysubversions.com/2013/09/how-to-make-a-twitter-bot/): make a robot spew nonsense for the world to see! (many of the modules mentioned are being used to power the brain of [Hank](https://twitter.com/pataphysyllabus) (also a lot of taylor swift))
- [slack bots](http://blog.somewhatabstract.com/2015/03/02/writing-a-simple-slack-bot-with-Node.js-slack-client/): make a robot spew nonsense for your co-workers to see! 
- [Poetry](http://www.tcf.ua.edu/Classes/Jbutler/T340/SurManifesto/ManifestoOfSurrealism.htm): it is important.

### make a module

I have many friends and co-workers who agonize over finding a side project to hack on. They don't want to build something that requires costly infrastructure or depends on network effects, but they also don't want to build another TODO app or blogging client. By expanding your conception of the word "product" to include works of art and poetry, you'll soon discover an endless supply of things to work on. 
