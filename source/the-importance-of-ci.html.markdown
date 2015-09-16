---
title: The Importance of CI
tags: ci, continuous integration, tdd, tests, acab
---

# The Importance of CI
## This is a blahg about continuous integration, not confidential informants, so if you are a law enforcement office seeking information as to how to get snitches to flip then you are in the wrong place, buddy, and furthermore I fundamentally disagree with both your tactics and life-philosophy. 

Recently I was trying to do something important on GitHub when I got distracted by a shiny announcement in the sidebar about "protected stuff". Not knowing what that is, but liking things to be secure, I set about clicking this link. I did not read most of the words on the page that I was directed to, however I did look at the pictures, and one of them caught my eye:

![cannot merge code till ci passses!](ci-check.png)

Having completely forgotten what I was trying to do, I instead began thinking about the usefulness of continuous integration when working on a team of "professional" software "engineers". But first, What is CI?

every time someone pushes a change to github, 
the CI server will pull down those changes, 
install whatever dependencies it needs, 
builds your code, 
runs your tests, 
and let you know if it passed or failed, 
or do other things. 





devs and management: we only deploy changes through CI. (do other things => auto push-deploy develop to staging, master to production)
- no more like "HOTFIX THIS" things must be more measured, released on schedule (or at least after passing the tests)
- emphasizes importance of/expectation of tests. i.e, yr CI can fail if the test coverage decreases (coverage not the best metric, but an ok way to know if untested code is being added)
- of course management wants a stable and relatively bug-free app! so how can they argue with this process here? 


devs
- can run things like linters! the absolute ONLY way to enforce consistent style on a project is to define it in a linter. no one wants to have to be like "UMM u need 1 space between all parentheses in this PR", much better to have a robot do it for you. EVEN BETTER: if the robot can auto-fix these things for you.
- simple things like adding depedencies to projects, bumping version numbers, etc. just cuz someone wrote and pushed some code does not mean that they ever successfully ran this code. or maybe they have a global dep on their machine that causes it to work. CI unveils these issues before someone else runs into them. pushes failures onto the, err, failer. no more "AUGH SO AND SO FORGOT TO PUBLISH!" but instead "oh, i forgot to publish! let me do that right now and hopefully i will remember next time cuz i just did this thing and spaced repetition learning yo!"
- NO MORE GARBAGE SCRIPTS! you gotta put yr deploy process into a format that the CI box can run. also makes things like rolling back deployments, gathering data, etc. much easier



















