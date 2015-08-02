---
title: 100% EZ Syntax Highlighting With Middleman
date: 2015-05-30 19:12 UTC
tags: middleman, syntax highlighting, code, meta-blog, ruby, markdown, john gruber
---

# 100% EZ Syntax Highlighting With Middleman
## A Meta Blog About This Middleman Blog

I just got these nifty syntax-highlighted-code-blocks working so I thought to myself "why not write a blog about setting up my blog? what could possibly be more fascinating?". The answers to those questions being "there is no reason not to" and "nothing" respectively.

We'll be using the [middleman-syntax gem](https://github.com/middleman/middleman-syntax) in a standard, run-of-the-mill, fresh from the generator, uncustomized Middleman project.

#### Step 1: Add some gems to the `/Gemfile` and `bundle install`

```ruby
    gem "middleman-syntax"
    gem "redcarpet"
```

middleman-syntax will work with other markdown parsers, but if you're at all like me you don't really care what is parsing your markdown, so I went with [redcarpet](https://github.com/vmg/redcarpet) because it's what Github uses and that's usually where I'm writing markdown.

#### Step 2: Add these lines to the bottom of `/config.rb`

```ruby
    activate :syntax
    set :markdown_engine, :redcarpet
    set :markdown, :fenced_code_blocks => true, :smartypants => true
```

`fenced_code_blocks` adds a familiar and pretty background to help set your code blocks apart from the mere plain text that surrounds them. I have absolutely no idea what `smartypants` is and the [middleman docs](https://middlemanapp.com/basics/template_engine_options/) aren't much help in this area, but I left it set to true because why wouldn't you want a pair of smart pants?

#### Step 3: Create a file name `highlighting.css.erb` inside `/source/stylesheets` and add this line

```erb
    <%= Rouge::Themes::Github.render(:scope => '.highlight') %>
```

[Rouge](https://github.com/jneen/rouge) is the actual library doing the syntax highlighting, and the documentation tells me that you can also try out these themes: `ThankfulEyes`, `Colorful`, `Github`, `Base16`, `Base16::Solarized`, `Base16::Monokai`, `Monokai`. I went with Github in the hopes that it would help make developers feel at home reading my blog.

#### Step 4: Reference the generated CSS in the head tag of your `/source/layout.erb` file

```erb
    <%= stylesheet_link_tag "highlighting" %>
```

Middleman, much like Rails, has an asset pipeline which you can probably use to mix this file in with your other styles and export into a single minified, uglified, bonafide, electrified six-car monorail. But I don't really understand CSS stuff (I mean, just _look_ at this website) so ask someone else about that.

#### Step 5: Write about some code!

You now can use code blocks in your markdown and get awesome highlighted syntax! Just use the triple backticks markdown blocks, and put the language name after the first set of backticks, like so:

```
    ```ruby
        puts "YOU ARE A CHAMPION NOW!"
    ```
```

A full list of supported languages/syntaxes can be found [here](https://github.com/jneen/rouge/wiki/List-of-supported-languages-and-lexers).
