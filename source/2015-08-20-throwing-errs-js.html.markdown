---
title: Throwing Good Errors With JavaScript
date: 2015-08-20 22:09 UTC
tags: javascript, error handling, errors, problems, throwing, catching, node
---

# Throwing Good Errors With JavaScript
## Putting the "roar" in "erroars"

As you may already know, error handling is very important in an asynchronous language such as JavaScript. You probably have callbacks nested inside of each other so intricately that it is impossible to know what is calling what, let alone where errors might emerge from, and the only way to get a handle on this mess is to make sure that all of your callbacks accept `err` as their first argument. That way you are both reminded and forced to handle errors when they happen, rather than allowing them to bubble up towards the user in unexpected ways.

Maybe you already have a handle on handling errors: you `console.log` the unimportant ones, and halt the entire program on the really bad ones. But what do you do when you are writing code that needs to throw a special sort of error itself? JavaScript has some [built-in error types](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error#Error_types), but like everything in JavaScript they are a little wonky. And maybe you need something a little bit more specialized, or want to include additional debugging information.

For this task, we can wire up a simple custom error by hand! Lets see some stinking code:

```javascript
// First we define a function. 
// By convention, it should be capitalized-camel-case 
// and end with the word "Error". 
// This function can take arguments, 
// or not, 
// whatever you want, 
// it's JavaScript after all!
function TheNameOfYourErrorGoesHereError (msg) {
  
  // Give your error a name!
  // This should probably be the same as the name of the function,
  // It is what will show up when the error gets thrown.
  this.name = 'TheNameOfYourErrorGoesHereError'

  // A helpful message about what went wrong!
  // You might want to include data from the arguments,
  // or explain how to fix things.
  // A link to a blog post/issue tracker/docs might also be nice!
  this.message = 'My friend:\n  There seems to have been an issue with:\n  ' + msg + '\n  Please amend it at your earliest convenience.\nThank You.'
}

// Next, we use prototypal inheritance to make our error function
// inherit from the plain ole vanilla Error object.
// This will give it all the properties of an Error,
// making it throwable and probably some other things.
TheNameOfYourErrorGoesHereError.prototype = new Error()

// Lastly, we set the constructor 
// of the prototype 
// of our custom error function 
// (which is now a basic Error) 
// to be our custom error function itself. 
TheNameOfYourErrorGoesHereError.prototype.constructor = TheNameOfYourErrorGoesHereError
```
By setting the constructor of the prototype to be the custom error function, we make it so that calls to `new TheNameOfYourErrorGoesHereError('problems!')` will call it to create the new `Error` object, which is really just yr average object with name and message attributes and some other special functions, so our function satisfies the `Error` interface because it has a name and a message and descends from `Error`, which is of course itself an `Error`!

This makes JavaScript happy, so now when a problem comes up in our code we can deal with it like so:

```javascript
  throw new ACatastrophicProblemHasArisenError()
```

And everything will work magically because `throw` expects to be passed an `Error`, and our function satisfies these demands due to it's prototypal ancestry. A W E S O M E !

## BE KIND TO THE USER, THROW GOOD ERRORS! 

<center>![tron: fight for the users](tron.jpg)</center>

