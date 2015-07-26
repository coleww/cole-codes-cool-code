---
title: Pitching Samples Around In Overtone
date: 2015-07-26 20:53 UTC
tags: 
---

# Pitching Samples Around In Overtone
## because sometimes, you're too lazy to sample the entire piano

![otone](otone.gif)

For a while now I have been [building interfaces](http://shreddit-hard-co.re/) for [creating music](http://coleww.github.io/problumz/) with [JavaScript and Web Audio](https://www.npmjs.com/package/drone-e-o-synth), but apparently Overtone already does everything I could ever possibly think of or want. Cool, my lifes work for nothing.

One of the coolest things about Overtone is that it interfaces directly with [Freesound](https://www.freesound.org/), a database of free audio samples. That means that you can execute `(freesound 123456)` and the audio file at ID 123456 will be automatically downloaded, stored in `.overtone/assets`, and played back. I don't know what sample 123456 is, so listener beware... 

With this newly discovered power I began scouring the Freesound website for vocal samples to lay on top of my music. I found this sample pack called [Simplesong (MAC) pitched vocal formants](https://www.freesound.org/people/beskhu/packs/4560/) and set out to convert it into an instrument along the lines of this [blog post by Joseph Wilk](http://blog.josephwilk.net/clojure/creating-instruments-with-overtone.html)

Now that I had samples that I liked I just needed to grab their IDs from the website. The aformentioned Joseph Wilk post contains a Ruby script for grabbing ids for a pack, and I also wrote a [node script](https://gist.github.com/coleww/939bc606645c57dd1b29) for grabbing IDs based on a query. 

Unfortunately, this pack only contained samples of the notes C# A# G and E at various octaves, but I could still play the intermediate pitches by altering the playback rate of the sample. If I wanted to play midi note 34 but I only had a sample for midi note 32 I would just convert both notes to frequencies, divide them, and use the result as the playback value: `((freesound 123456) :rate (/ (midi->hz 34) (midi->hz 32)))`. 

With this simple piece of mathematics in hand, I just needed a play function to do all the equations and make some noise:

```clojure
(ns syllable-synth.synth
  (:require [overtone.live :refer :all]))

;; object of objects mapping syllable sound to midi note to a freesound sample
(def voices {

  ;; there were many different syllable sounds represented, but for this example we can only make "oooo" sounds
  :oooo {
    70 (freesound 70529) 67 (freesound 70528) 64 (freesound 70527) 61 (freesound 70526) 58 (freesound 70525) 55 (freesound 70524) 52 (freesound 70523) 49 (freesound 70522) 46 (freesound 70521) 43 (freesound 70520) 40 (freesound 70519) 37 (freesound 70518) 34 (freesound 70517) 31 (freesound 70516)}})

(defn play
  "accepts midi note and syllable to play, uses random if none passed"
  [note & [syll]]

        ;; if no syllable is passed, pick one at random
  (let [syllable (or syll (rand-nth (keys voices)))

        ;; grab the notes for which we have a sample 
        ;; that are lower than the note we want to play
        notes (filter #(<= % note) (keys (syllable voices)))

        ;; our base-note is the highest note in notes, 
        ;; or 31 if it is lower than 31
        base-note (or (last (sort notes) 31)

        ;; in order to pitch the base-note up to our desired note, 
        ;; we convert them both to frequencies and divide
        rate (/ (midi->hz note) (midi->hz base-note))]

    ;; grab the sample for the given syllable and base-note,
    ;; and play it back with the rate set 
    ;; to pitch the sample up the desired note
    ((get (syllable voices) base-note) :rate rate)))


(play 40)

```

You can see the complete code [here](https://github.com/coleww/my-symphony/blob/master/src/my_symphony/silly-bills.clj) or see it [in action](https://github.com/coleww/my-symphony/blob/master/src/my_symphony/beat.clj).

