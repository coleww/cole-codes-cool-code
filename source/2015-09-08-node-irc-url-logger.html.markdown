---
title: Logging URLS from IRC to Delicious with Node
date: 2015-09-08 22:10 UTC
tags: node, irc, url, bot, logging, delicious
---

# Logging URLS from IRC to Delicious with Node
## Oh you know just plugging some APIs together

Like most people, I participate in secret societies through hidden IRC channels. The conversations that take place in these circles are bound by blood, however as the US government has proven it is not actually "spying" if all you do is collect "metadata".

In this instance, the "metadata" I am after is any and all URLs that get posted in one of these esoteric chatrooms. Even if I can't keep up on the day to day message logs, I can still peruse the links that others have shared. After all, that is why we are on the internet of course. To hyperlink.

To that end I wrote a simple node.js bot that sits in some IRC channels, scans any messages it sees for URLs, and posts any that it finds to a Delicious account. 

The source code is as follows:

<script src="https://gist.github.com/coleww/a9f82ba7f37504bae368.js"></script>

You could, for example, have it join every IRC channel about Ember and make a page that is all about what is going on in Ember. That might be cool.

I picked Delicious because it was the first link I recognized when I searched for "bookmark site API", you could in theory have this script post links anywhere you want. It must be noted that I am using `childProcess.exec` here to call a CLI tool out of sheer laziness: I am sure there is a `require`-able Delicious API wrapper module out there somewhere.

While making this I was thinking about certain programming language channels where people will often ask for help with bugs. For example:

```
> coledubs: what is up with this error "ILLEGAL: FOO"
> derbyshire: wow that sounded awful 
> elephant: coledubs - do a nom bom, that should fix it
```

 With a sufficient amount of regex'ing, one could parse the logs of these channels and create automatic Q&A pages. In the example above, it wouldn't be difficult to detect that elephant is answering coledubs's question, and by saving it somehwere this might help someone else down the line who sees an `ILLEGAL: FOO` error.  
