---
title: Picking The Right Text Editor For The Job
date: 2014-08-17 00:00 UTC
tags: text editors, vim, emacs, unix, c, open sauce, pasta recipes
---

# Picking The Right Text Editor For The Job
## Part 1: The Luxury Class


Text editing is a long unsolved problem in the computer science industry.
Strings in general are really tough. I suppose that dates, time, numbers, data persistence, and off by one errors are also tricky. But those are the only ones. That is it. The entire industry is totally on top of everything else except those eight things.

While the classic argument is between vim and emacs, perhaps it would be best to start this analysis of text editors with a reverse Forge-Drive. That is, we will begin by looking at some heavyweight text editors that come with a flashy GUI and cost money, and later move down closer to the metal and examine other editors which are less user friendly. Sound good?

### WTF? I thought this blog was Metal-First?!?!

I hear your concerns, but perhaps it is best to address them with a brief cautionary tale from a real life computer scientist:

```
Once upon a time, 
I accidentally opened emacs while amending a git commit 
and I had to un-plug my computer from it's charger 
and wait for it to run out of power,
before attempting to reboot it, free of emacs.
Lower level editors are quite serious 
because they operate directly 
on the 1s, 0s, As, Bs, and Cs of the computer. 
C is the language that computers are made out of 
so you must be very careful not to mess it up.
```

![metal](metal.jpeg)


### TaxMate

TaxMate originated as accounting software that came bundled with Macintosh eBooks in the early 2000s, however it was quickly discovered that the series of regexen which applied syntax highlighting to the United States tax code also worked for Ruby, Node, HTML5, and several lesser languages. The ability to use just one editor for all of your code types was a revolution for the industry, and allowed for rapid experimentation with dynamic typing. People were moving fast and breaking everything.

However the regexen that powered this upheaval were spread far and wide amid the source code of TaxMate, and early attempts to extract it into other editors proved fruitless. If this situation occurred in the freely licensed open-sauce software community there would be no issue: someone would fork the TaxMate repo, modify a few things, delete a lot more things, add some garbage, change the name to a word picked at random from the dictionary, and then release it to the world through a post on hacker news. However TaxMate was not open-sauce, so this problem required getting a lot closer to the metal.

<center>
![sauce](sauce.jpeg)


This is an example of open sauce. As you can see any diner, or ‘user’, is free to scoop some of the sauce onto their plate. The sauce is not mixed into the pasta, and it is easy to extract out only the parts you want. I find that weird plant growing in the middle to be gross but it is trivial for me to scoop around it, thanks.
</center>

### Subloom

In the closed-sauce software community instead of forking a repo what you do is called a ‘reverse-engineer’. Now I know that this may sound like I am talking about a developer standing on their head but I assure you that this technique should only be executed by senior level metallurgists. It can sometimes involve opening up the computer and slowly moving magnets and batteries in concentric circles over the metal in order to directly alter the quantum super positions of electrons.

The Subloom text-editor is the product of exactly this kind of deep-metal free-diving. In addition to copying every useful feature from TaxMate, Subloom leverages the oft-forgotten Python programming language so that users can dive into the kiddy pool of that text-metal and inject custom ‘scripts’ into their editor. You may also be able to integrate some open-sauce libraries into your workflow through Python’s helpful PIP package manager. Although used principally as a package maid, PIP actually originates from a minor semantic versioning bump of the PHP programming language.

<center>
![jars](jar.jpeg)


This is an instance of closed-sauce. Not only am I denied easy access to the sauce, I do not know what kind it is nor what it does and frankly I am not even positive that this is pasta sauce. I should write a test for that.

</center>

## But What Should I Use?

Probably whatever editor is already installed on your machine. Attempts to migrate to a new editor will result in increased levels of yak shaving and I am a firm believer in animal rights. Furthermore if your coworkers or friends find out that you are experimenting with text editors you may find yourself trapped inside of a bike shed for weeks at a time.

One day the computer science industry will have text manipulation figured out. Until then, I have been loving this @medium website for editing my text-based documents, and I recommend you try it too!