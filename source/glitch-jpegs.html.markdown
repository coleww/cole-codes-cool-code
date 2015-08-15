---
title: open up yr jpegs 
date: 2015-08-08 17:57 UTC
tags:
---

# open up yr jpegs 
## ...in text editors

This quote from substack pretty much sums up everything I am about to tell you:

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">you can just fuck with jpegs in vim btw</p>&mdash; substack (@substack) <a href="https://twitter.com/substack/status/612136577737756672">June 20, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Genius.

You can make arbitrary changes to the data of a JPEG and because of how the compression works it will still usually be able to load something, usually ending up with weird glitchy art.

LINK TO Cory Arcangel wrote a research paper on the jpeg algorithm which is supposedly important but I understand very little of it. math is hard.

You can of course just open an image, delete, type randomly, copy and paste, etc., save it, and re-open to see a profound effect. Take care to avoid doing anything to the first 1/5-1/4 of the file, which contains important header information that must not be manipulated.  There is probably some byte sequence you could look for that signifies the end of the headers, but, you know, data format specifications and mathematics, blah blah blah. Tweet at me if you know this!

Another approach is to encode a glitching algorithm in, err, um, code. I published one such algorithm as a Ruby gem called [scrambled_jpeg](https://github.com/coleww/scrambled_jpeg). Annotated sauce and examples below:

```ruby
def scramble filename, n=5
  # load the file into a store, pop off the ending, and start a cache
  ending, cache = (store = File.readlines filename).pop, []

  # open a file and write the first chunk of data to it
  (new_file = File.open Time.now.hash.to_s + '.jpg', "w").write store.shift

  #  write the next n chunks of data. this should get us past the headers (hopefully)
  n.times { new_file.write store.shift }

        # then, save off n chunks to the cache
       .times {       cache << store.shift }

       # write the next n chunks to the file
       .times { new_file.write store.shift }
  
       # write the cached lines to the file, and continue doing this until the store and cache are empty
       .times { new_file.write cache.shift } until store.empty? && cache.empty?

  # write the ending data to the file and close it.
  new_file.write ending && new_file.close
end
```

DEMO JPEGS HERE WITH N LEVE



This is just one example of a glitching algorithm, you could do many things:

- Could shuffle the data up totally randomly (probably gonna fail, shuffle larger chunks so as to be less disruptive. yes this is the one instance in comptuer science where you should NOT disrupt), 
- could copy paste the front page of the new york times into the middle of the file, 
- could take 2 jpegs and randomly mash their datas together (for political juxtaposition and statement perhaps?)

not only that, could build an interface to the algorithm for live experimentation. some params might be prettier than others. LIKE TO SNORPEY