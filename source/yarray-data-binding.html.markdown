---
title: Lazy data binding with JavaScript
date: 2015-08-08 17:52 UTC
tags:
---

# Lazy data binding with JavaScript
## no jQuery(tm)!

A while ago, was working on a thing where I wanted to bind an array of values to some plain ole html input elements. I didn;t need 2 way binding necessarily, I just wanted to have an array in my codes where each element of that array was bound to an html input, so i could update the values on the fly while a setInterval ran constantly. 

I couldn't find a module that did thsi on npm, so i took a hack at it with ember, and even looked at some other js data binding frameworks.

it was beginning to look like i'd have to do something absurd like this:

`[Ember.Object.create({value: 0.72}), Ember.Object.create({value: 18}), Ember.Object.create({value: "Starbursts"})]`

All just to keep a little value bound to some HTML! I knew there had to be a simpler way. Plus I could learn some of the horrors of keeping data in sync with the browser.

Solution: make an input element for each thing in the array, and listen for change events on them, then reach into that sweet closured over data and modify it directly.

```javascript
var controlData = [0.72, 18, "Starbursts"]

var els = []
controlData.forEach(function(val, i){
  var el = document.createElement("input")
  el.setAttribute("type", "text")
  el.setAttribute("data-index", i)
  el.value = val
  el.addEventListener("change", function update(e){
    controlData[~~e.target.dataset.index] = e.target.value
  });
  els.push(el)
})
els.forEach(function(el){
  document.body.append(el)
})

window.setInterval(function(){
  // do something with dat controlData!
  // it will be updated on the fly!
  // yeah!
}, 1000)
```

We can even replace the bound array if we want to! And manually reset the inputs to be the new values! 

```javascript
controlData = loadSomeDataSomehowOkIdkThisIsJustASampleANywaysGosh!("surfing")
controlData.forEach(function(val, i){
  els[i].value = val
})

```

This is kind of like 1.5 way data binding I suppose.


I made a node module that does all this for you called [yarray](https://www.npmjs.com/package/yarray)

Unfortunately, I cannot remember what project i actually built it for and it does not seem to be installed on my machine. This sort of thing happens when you are working on something, and realize you can pull out some piece into a node module, and then you finish the node module and maybe have a beer, and then you go to work, and and and.

