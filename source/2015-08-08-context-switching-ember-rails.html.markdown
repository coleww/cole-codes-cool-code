---
title: Eliminating The Ember-Rails Context Switch
date: 2015-08-08 16:48 UTC
tags: ember, rails, generators, ruby, node, unix
---

# Eliminating The Ember-Rails Context-Switch
## making your frameworks work for you

Ember and Rails make a great choice for a one-two slam-dunk of a front-and-back-end-framework combo. They both have powerful CLI tools, integrate seamlessly with each other, and come fresh-out-the-generator all-set-up to create RESTful JSON CRUD APIs (ooo la la) through Test-Driven-Development (oh my). 

Both frameworks emphasize convention over configuration which means less bikeshedding over how to organize files or names things or set up basic infrastructure. But you still retain the ability to enter that bikeshed and paint it whatever color the team decides on if that is the route you end up choosing to go down after a series of lengthy meanings. 

It also means that common solutions can be extracted and easily re-used on other projects because they all share a consistent architecture. If I solve a deployment issue in my Ember app then I can extract it into an add-on so other people can use my solution too, as is done in the Ember community. And if I solve some problem with my Rails app then I can release a gem that flagrantly monkey patches Ruby core, as is done in the Rails community.

This architectural consistency also exists between Ember and Rails in the APIs of their CLI tool. Both frameworks recommend using generator commands to ensure that files are named right and add boilerplate code. And luckily they both settled on the same word for this command:

```bash
ember generate controller dubsteps 
rails generate controller dubsteps
```

But this can still get a bit confusing for those of us who spend all day hopping back and forth between Ember and Rails code bases. You might one day find yourself in this unenviable position:

```bash
$ ember g model foo
version: 0.2.3
You have to be inside an ember-cli project in order to use the generate command
```

OOPS you forgot where you were and what you were doing and tried to use `ember` inside of a `rails` project. You should consider yourself lucky that ember-cli catches this error for you. 

This kind of thing happens more than we might care to admit, and it is caused by a phenomenon known as context switching. We get our brain all set on doing one particular task in a given environment, and then when we go to accomplish a related-but-different task in a nearby environment we get all discombobulated. 

Technologists hate context switching because it means they have less time available in their life to ship product and engage with brands on twitter. That is why a lot of startups demand that their employees give up their personal lives and abandon their families to work 80+ hour weeks: if there is no longer a division between work and life, then one no longer suffers from context switching between them!

That kind of mentality is a bit too extreme and fascist for my tastes. Making it easier to jump between Rails and Ember projects is a much nicer goal to have than ruthlessly optimizing the extraction of surplus value from laborers.

To that end, I have created a command line tool called geee (abbreviated to `g` (but it is called geee because people have already pushed libraries called `g` :/)). You see, both Ember and Rails already give you a MAJOR productivity boost by allowing you to substitute the word `generator` for the letter `g`, like so:

```bash
ember g controller dubsteps 
rails g controller dubsteps
```

I thought: "why not take this a step further and drop the CLI command entirely?". That way we would just have to type:

```bash
g controller dubsteps
```

And the computer would figure out what kind of project folder we are inside of and do the right thing accordingly! Not only are you typing shorter commands, but you no longer have to switch contexts either!

#### LETS SEE A DEMO:

![geee demo](g-demo.gif)

geee/g will run any generator that Rails or Ember supports, and could be easily be forked and extended to cover other frameworks (if such things exist). It is also an exemplary demonstration of the composability of simple command line tools in a UNIX fashion. 

The best part about geee is that it comes packaged as either a [Ruby gem](https://rubygems.org/gems/geee) or a [Node module](https://www.npmjs.com/package/geee), so that way you don't even have to figure out the context of what package manager you are using! 

Just do this:

```bash
gem install geee
```

Or this:

```bash
npm install -g geee
```

and `g` will be made available on yr `path`!

BUT NEVER BOTH, DO NOT INSTALL BOTH AT THE SAME TIME, BAD THINGS WILL HAPPEN, MIT LICENSE YO!!!!!!!!!!!!!! "IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."!!!!
