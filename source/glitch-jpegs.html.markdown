---
title: gitch-jpegs
date: 2015-08-08 17:57 UTC
tags:
---

# open up jpegs in text editors
## seriously it is awesome

This quote from substack pretty much sums up everything I am about to tell you:

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">you can just fuck with jpegs in vim btw</p>&mdash; substack (@substack) <a href="https://twitter.com/substack/status/612136577737756672">June 20, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Genius.

JPEG/JPG compression is such that you can make changes to it's data and it will still try to load something, usually ending up with weird glitchy art.

Cory Arcangel wrote a research paper on the jpeg algorithm which is supposedly important but i understand little of it. math is hard.

You can of course just open an image, delete, type randomly, copy and paste, etc., save it, and re-open to see a profound effect. Take care to avoid doing anything to the first 1/5-1/4 of the file, which contains important header information that must not be manipulated.  There is probably some bytesequence you could look for that signifies the end of the headers, but, you know, data format specifications and mathematics. blah blah blah

Another approach is to encode a glitching algorithm in, err, um, code. Might take control paramaters, which you can modify to explore the possibilities of this failure. 

I published one such algorithm as a Ruby gem called [scrambled_jpeg](https://github.com/coleww/scrambled_jpeg). Annotated sauce below:

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


/// EXAMPLES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




Could shuffle the data up totally randomly (probably gonna fail, shuffle larger chunks so as to be less disruptive. yes this is the one instance in comptuer science where you should NOT disrupt), 
could copy paste the front page of the new york times into the middle of the file, 
could take 2 jpegs and randomly mash their datas together (for political juxtaposition and statement perhaps?)

Many possibilities for different algorithms, as well as interfaces to these algorithms. Web cam or some sort of live image feed as input, sliders and knobs for the params. 





