---
title: Manually Trigger Loading Routes in Ember
date: 2015-06-09 17:12 UTC
---

# Manually Trigger Loading Routes in Ember
## cuz Ember can't do  e v e r y t h i n g  for you

Loading routes in Ember are pretty frigging sweet. You can drop a spinner .gif pretty much any frigging where you want. You can even make nested loading routes: it's frigging awesome.

One trick, however, is making use of those loading routes when persisting customer informatin to your datbase. The loading routes automagically hop into place while you are fetching data, but they can't do the same when saving it. That would be weird and unfortunate.

Instead, you must explicitly tell the router that you are loading some stuff and to just chill the frig out for a second while you figure some things out.

FOR EXAMPLE (presuming you are on the user.edit route, editing yrself):

```javascript
saveUserInformation(){

  // MANUALLY TRANSITIONING TO THE LOADING ROUTE
  this.transitionTo('loading');

  // return a promise whose `then` and `catch` callbacks each transition to an appropriate route
  return user.save().then(()=> {
    this.transitionTo('user.index');
    // success! go to the infernal User index and suffer with the rest of them!

  }).catch((e)=> {
    // do something to User with the `e` errors --> very bad... show warning/

    this.transitionTo('user.edit', user);
    // return to the current page, with the current model data all still set like WOWWW
  });
}
```

A N D   T H A T S    I T

Just a simple `this.transitionTo('loading')` and you can punt the Ember route back into loading mode. Try it today!
