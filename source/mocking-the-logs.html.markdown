---
title: mocking-the-logs
tags:
---

# Mocking and overwriting console.log 
## for both testing and profit

TDD! You want to test all the things! Mocking is importantant! CAn test things in isolation! presume some function does what it is supposed to. you will test that behavior in another test! and in that other test, you will mock the behavior of this class/object/function!

GOTTA TEST EM ALL!

Maybe yr making a CLI and it logs important information? Maybe you want to verify that the right errors happen at the right times? 


https://github.com/coleww/mkproj/blob/master/test.js#L12-L14

```javascript
  tap.test('does all the stuff', function (t) {

    // ...

    console.log = function (msg) {
      t.ok(msg, 'logs creation')
    }

    // ...
  })
```

Maybe you want to check that the msg is correct?

```javascript
  console.log = function (msg) {
    t.equal(msg, 'YOU HAVE FAILED THE TASK AT HAND', 'logs failure')
  }
```

in Javascript, of course, you can pass variable args to console.log. There is also, of course, a handy js hack to get those args into a useable array:

```javascript
  console.log = function () {
    var args = Array.prototype.slice.call(arguments);
  }
```

Might notice a side effect that now you can't console.log to debug why your test suite is failing!  YOU BET THERE IS A HACK FOR THAT TOO! 

```javascript
  console.log = (function() {
    // save off the old console.log
    var log = console.log;

    // DO YOUR WORST!

    return function (msg) {
        if (typeof msg.stack == 'string') {
          // ITS A STRING!
            log.call(console, msg);
        } else {
          // ITS A N ARRAY OF ARGS!
            log.apply(console, arguments);
        }
    }
})();
```

HEY! maybe you are tired of letting log statements out into the wild? just redefine console.log to be a no op at the start of allll yr scripts: (but bear in mind won't get debug info now)

```javascript
  console.log = function () {}
```


