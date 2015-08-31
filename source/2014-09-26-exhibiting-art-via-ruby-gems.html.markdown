---
title: How To Exhibit Works of Conceptual Art Via Ruby Gems dot Org
date: 2014-09-26 00:00 UTC
tags: ruby, gems, art, conceptual art
---

# How To Exhibit Works of Conceptual Art Via Ruby Gems dot Org
## An Agile Primer

Ruby Gems dot Org is a package manager for Ruby on Rails which allows hackers to share useful pieces of code via the cloud. But that is not necessarily it’s only purpose. In reality, Ruby Gems (or NPM, or PIP, or etc.) is a tool for sharing all sorts of files in a semantically versioned manner! For example, substack's [stream-handbook](https://github.com/substack/stream-handbook) is a node module that lets you stream the stream-handbook into your favorite command line text reading application, so that you are learning about streams while streaming them asynchronously.

Now these package managers have more modules combined than there are grains of sand on the earth. This makes the job of a programmer very easy because basically all the code that can ever be written has already been wrote, so all you really need to do is combine some existing libraries together and BOOM! GAME CHANGER!

With this in mind, I wanted to create a small diversion in code. If we have all this new-found free time, unburdened by worries of code-dependencies or actual work, then why not take some of that time to think critically about what it is we are doing on a meta-philosophical level?

With that, I turn to the work of Jorge Luis Borges, whose wikipedia intro I have pasted mostly verbatim:

> Jorge Francisco Isidoro Luis Borges KBE (24 August 1899 – 14 June 1986) was an Argentine short-story writer, essayist, poet and translator, and a key figure in the Spanish language literature. His work embraces the “character of unreality in all literature”.[1] — [http://en.wikipedia.org/wiki/Jorge_Luis_Borges](http://en.wikipedia.org/wiki/Jorge_Luis_Borges)
<center>
![borges](borges.jpeg)
</center>


Borges wrote about [libraries that went on forever](https://archive.org/index.php), filled with books that contained every possible permutation of characters. Every time I read one of his stories, I think to myself: “I get it now”, and the next time I read it I discover that I was wrong, and I think to myself: “I get it now”.

On Exactitude in Science is the name of one of his shortest stories, and I have read it many times over the years so at this point I am slightly more certain that I get it, but on the other hand I am distrustful of such braggadocio and am considering the possibility that I actually really don’t get it at all, so I wanted to share with the world this thing that I think I might possibly get before I give up and open a kale farm cat sanctuary.

To this end, I have shipped a Ruby on Rails gem called `on_exactitude_in_science` which meta-programmatically modifies the source code at runtime to ensure that whenever a user calls a method whose name is identical to the snake\_cased version of the exact text of ‘On Exactitude in Science’ by Jorge Luis Borges, the Ruby interpreter will reply with a pretty-printed version of that same text.

For example, and also, in conclusion:

<script src="https://gist.github.com/coleww/5016c7aedd112c20b328.js"></script>


[View the source or fork it and clone it then pull it down and push it back up and make a request to pull, or open an issue or](https://github.com/coleww/on_exactitude_in_science)