---
title: throwing-errs-js
tags:
---

name. message.
prototype is Error. makes it inherit that good sauce.
constructor is the function we made. what gets called when you `new ()`.
that will give us an object with the name/message.
but that object will inherit a bunch of stuff from Error(),
and thus will do magical thinks, i guess. idk.

function ThatScriptsEntryAlreadyExistsThereInThePackageDotJsonMyFriendError () {
  this.name = 'ThatScriptsEntryAlreadyExistsThereInThePackageDotJsonMyFriendError'
  this.message = 'My friend:\n  it seems as though the script entry you have specified,\n  is already present in the package.json file,\n  of your current working directory.\n  Please try again,\n  or amend this egregious error.\nThank You.'
}

ThatScriptsEntryAlreadyExistsThereInThePackageDotJsonMyFriendError.prototype = new Error()
ThatScriptsEntryAlreadyExistsThereInThePackageDotJsonMyFriendError.prototype.constructor = ThatScriptsEntryAlreadyExistsThereInThePackageDotJsonMyFriendError


you can also pass arguments to yr error, so as to set custom messages (BE KIND TO THE USER LIKE IN TRON) ![](tron.gif)