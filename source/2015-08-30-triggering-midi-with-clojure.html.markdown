---
title: Controlling electronic Instruments With MIDI and Clojure
date: 2015-08-30 13:58 UTC
tags: midi, overtone, clojure, music, emacs, boss sp
---

# Controlling Electronic Instruments With MIDI and Clojure
## Let Rich Hickey Be Your DJ

Most of the time when people are trying to use MIDI in Overtone and Clojure, they just want to play an artisanal hand-coded soft-synth with a standard MIDI keyboard. And there are plenty of helper methods and [some documentation](https://github.com/overtone/overtone/wiki/midi) to make this easy, but what if you want to use Clojure as a MIDI sequencer for hardware samplers and synthesizers? The same functional-programming and LISP-y principles that make Clojure effective for audio synthesis can be just as powerful when used for audio sequencing. 

Recently I have been working on a [probability-based audio sequencer](https://github.com/coleww/overtone-live-coding/blob/master/src/my_symphony/sequencer.clj), which allows you to write music as deeply nested arrays of numbers that are then "performed" by the computer, resulting in different compositions each time. It is absolutely thrilling to create music by typing integers into emacs, I swear.

I could of course just have this sequencer control some of the synths that are built into Overtone, but I feel much more comfortable manipulating sounds on actual drum machines and FX pedals. Overtone has very little documentation in regards to sending MIDI signals out to control other devices, but luckily the [source code](https://github.com/overtone/overtone/blob/master/src/overtone/studio/midi.clj) to the high-level Overtone MIDI module is clearly written and of a reasonable length. <em>Though of course had this blog post existed yesterday I would have just read this and not bothered reading the code at all... ah, c'est la open source.</em>

### LETS ROLL

This is what we are trying to achieve: write some sweet sequencing code that sends MIDI data to our hardware instruments, that way we can live code changes to the sequencer and manipulate FX on the instruments directly.

<blockquote class="instagram-media" data-instgrm-captioned data-instgrm-version="4" style=" background:#FFF; border:0; border-radius:3px; box-shadow:0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width:658px; padding:0; width:99.375%; width:-webkit-calc(100% - 2px); width:calc(100% - 2px);"><div style="padding:8px;"> <div style=" background:#F8F8F8; line-height:0; margin-top:40px; padding:50.0% 0; text-align:center; width:100%;"> <div style=" background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAsCAMAAAApWqozAAAAGFBMVEUiIiI9PT0eHh4gIB4hIBkcHBwcHBwcHBydr+JQAAAACHRSTlMABA4YHyQsM5jtaMwAAADfSURBVDjL7ZVBEgMhCAQBAf//42xcNbpAqakcM0ftUmFAAIBE81IqBJdS3lS6zs3bIpB9WED3YYXFPmHRfT8sgyrCP1x8uEUxLMzNWElFOYCV6mHWWwMzdPEKHlhLw7NWJqkHc4uIZphavDzA2JPzUDsBZziNae2S6owH8xPmX8G7zzgKEOPUoYHvGz1TBCxMkd3kwNVbU0gKHkx+iZILf77IofhrY1nYFnB/lQPb79drWOyJVa/DAvg9B/rLB4cC+Nqgdz/TvBbBnr6GBReqn/nRmDgaQEej7WhonozjF+Y2I/fZou/qAAAAAElFTkSuQmCC); display:block; height:44px; margin:0 auto -44px; position:relative; top:-22px; width:44px;"></div></div> <p style=" margin:8px 0 0 0; padding:0 4px;"> <a href="https://instagram.com/p/6_KhLZSaV_/" style=" color:#000; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:normal; line-height:17px; text-decoration:none; word-wrap:break-word;" target="_top">Controlling drum machine and keyboard with Clojure over MIDI.</a></p> <p style=" color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; line-height:17px; margin-bottom:0; margin-top:8px; overflow:hidden; padding:8px 0 7px; text-align:center; text-overflow:ellipsis; white-space:nowrap;">A video posted by coles 2 metal (@cole_dubs) on <time style=" font-family:Arial,sans-serif; font-size:14px; line-height:17px;" datetime="2015-08-30T00:11:57+00:00">Aug 29, 2015 at 5:11pm PDT</time></p></div></blockquote>
<script async defer src="//platform.instagram.com/en_US/embeds.js"></script>



First things first: open up a new .clj file and add a namespace declaration:

```
  (ns midi-seq.core
    (:require [overtone.live :refer :all]
              [overtone.studio.midi :refer :all]))
```

This will pull in overtone and the midi functions we need. Next connect your computer to your hardware audio device with some sort of a USB-to-MIDI cable. Make sure you do this before launching Overtone, as it will only register MIDI devices that are found on boot up.

Next, use `cider-jack-in` to connect to a REPL. I use [emacs live](https://github.com/overtone/emacs-live) for all my Clojure hacking, and it integrates very well with Overtone. Evaluate the namespace to load all the requires, and then if you run `(midi-connected-receivers)` you should see your MIDI output device listed. If this function returns nothing then something went horribly wrong and I cannot help you, sorry! 

The way you send out a midi-note is to use the function called, um, `midi-note`, and it takes the following arguments: `receiver midi-note velocity(0-127) duration(s) channel`, with channel being optional. You might notice that `(first (midi-connected-receivers))` contains a key called `:receiver` that points to some kind of MIDI output object and so you might also guess that the `midi-note` function is expecting that as it's receiver argument, and you would be incorrect, much like I was. It just wants that whole entire receiver object for some reason. That's cool. 

If we are hooked up to a synthesizer, we can play a C4 note (a.k.a. MIDI note 60) at full velocity for 1 second like so:

```clojure
(midi-note (first (midi-connected-receivers)) 60 127 1)
```

Hopefully you only have the one MIDI receiver connected, but if there are multiple outputs listed then you will have to figure out which one is correct through trial and error or a lucky guess. I assume that if you have multiple MIDI outputs you know what you are doing here. Cheers. 

#### A pro-tip for creative technologists: 

Programmers like to zero-index EVERYTHING because that is the computer science way of doing things. However, consumer audio equipment tends to number things 1-10. For example, my Boss SP-303 sampler says that it will respond to events on channel 10, but for Overtone that is actually channel 9 i.e, `(midi-note (first (midi-connected-receivers)) 96 127 1 9)`. If you are ever trying to hook things together through some sort of integer/index/channel and nothing is working, consider the possibility that the two sides hold differing opinions on how to count to ten. 

#### WHAT ELSE CAN MY COMPUTER CONTROL?

MIDI can initiate program changes, modulate effects, start, stop, and change sequences, and much more. But you will probably need to read a lot of MIDI implementation specs and the Overtone MIDI source code in order to figure out what data to send to do those things. I was trying to do something as simple as changing the selected pad bank on my Boss SP-505 and gave up after scouring the [many](http://sp-forums.com/viewtopic.php?f=7&t=10941&start=0), [many](http://forums.rolandclan.com/viewtopic.php?f=16&t=34352), [many](http://www.vsplanet.com/ubbthreads/ubbthreads.php?ubb=showflat&Number=210137), [many](https://www.gearslutz.com/board/electronic-music-instruments-electronic-music-production/783954-boss-sp-505-question.html), [many](http://www.vdrums.com/forum/advanced/technical/11801-triggering-samples-with-a-boss-sp-505-sampler) unanswered threads about this subject.

