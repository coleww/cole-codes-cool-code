---
title: The Joy of Twitter Bots
date: 2014-10-01 00:00 UTC
tags: twitter, bots, ruby, blink182
---


# The Joy of Twitter Bots
## Signal vs. Noise

[Twitter bots are estimated to create approximately 24% of tweets that are on Twitter](http://en.wikipedia.org/wiki/Twitterbot), and if you ask me that number is far too low. We are living in an era of unprecedented technological advancement! Do you see me washing my clothes by hand? Well…no, because I am filthy, but if I did do my laundry like an adult then I would use machines to make my life easier.

To this end I have created the [twitter_bot_generator](http://rubygems.org/gems/twitter_bot_generator) gem !!!DEPRECATED: USE [mkproj -t](https://www.npmjs.com/package/mkproj) INSTEAD!!! so that rapid scaffolding of new Twitter bots is never an issue ever again! A Twitter bot is a great medium through which to ship a simple project while also increasing your social media points! Yr bot might tweet something funny at random intervals, or respond to tweets sent to it, or re-tweet tweets that match various criteria. [@adams_songer](https://twitter.com/adams_songer) is a bot that I built with the gem that follows the latter approach. For example:

<center>
![adams tweets](adams_tweets.png)

Surely an application of this level of importance merits access to the [“firehose”](https://dev.twitter.com/streaming/reference/get/statuses/firehose) stream? Twitter support has not yet responded to my requests/demands.
</center>

This bot came about after I noticed that you can type practically any popular song lyric into Twitter and see dozens of people who have tweeted it verbatim. In lieu of doing some really tough and confusing machine learning and web scraping to search for instances of “ALL LYRICS EVER WRITTEN EVER”, I decided to settle on the much smaller domain of “lyrics that are contained within the song ‘Adam\’s Song’ by Blink 182, from the album ‘Enema of the State’, released June 1st, 1999".

However after successfully shipping this bot I had another insight: while this project has very tight specifications and a rather small domain, the use-cases for being able to quickly determine whether or not a string contains a lyric from Adam’s Song are potentially quite far and wide!

Following in the footsteps of David Henemeier Hansson, who extracted the Ruby programming language out of his work on the project management project Trello, I have published the [adams_song](http://rubygems.org/gems/adams_song) gem based on my work on the @adams_songer project. Usage of the gem is quite simple:




<script src="https://gist.github.com/coleww/1f41b73244ebf344000f.js"></script>

> Example code for adams_song. This code looks somewhat similar to code that might be running on production Ruby on Rails apps created by companies like Yahoo and or Facebook, or it might not.

[The code is open-sauce](https://github.com/coleww/adams_song) so anyone can easily adapt the gem to work for any kind of song or text by simply forking it, cloning it, bundling it, committing to it, pushing it back up, pulling it down again, and then typing ‘rake release’, in that exact order.

Now that the core functionality of @adams_songer has been extracted into a gem, the bot itself is basically just a [require statement](https://github.com/coleww/adams_song_bot/blob/master/bot.rb#L3! This fulfills the Node.JS promise of small modules as foretold by R. Dahl. The Rails programming language encourages us to move logic from the controller down to the model, but Node.JS emphasizes pushing things even further down to the level of the package manager.

Or is it up? I mean, you push the code to the package manager and then you pull it back down again so that you can require it…so… Code is hard.