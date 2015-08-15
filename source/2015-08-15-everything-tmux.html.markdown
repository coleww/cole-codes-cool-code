---
title: Everything I Learned About TMUX In 3 Days
date: 2015-08-15 14:50 UTC
tags: tmux, unix, ssh, emacs, multiplexing
---

# Everything I Learned About TMUX In Like 3 Days 
## Seven Weird Tricks To Multiplex Your Terminals, Remotely!

Recently I started doing my work-"work" in a dev-box in the cloud. This meant getting adjusted to a whole new set of tooling because I couldn't use my normal tricks like running six panes in one iTerm2 window. I wanted to treat the SSH connected box as though it was just another drive on machine, and _what I learned will shock you_.

You'll first need to create a `.tmux.conf` file on your server if one has not already been provided for you. You can copy and paste [my settings](https://github.com/coleww/dotfiles/blob/master/.tmux.conf) if you like, or read through and select only the parts you want. When you start TMUX, it will automagically look for and load this file.

-----------------------------------------------------------------------

### A BRIEF INTRODUCTION TO TMUX NOTATION 

`C-a r` => `ctrl + a - r` => press ctrl and a together, then release, then press r

-----------------------------------------------------------------------

### .tmux.conf

- THE MOST IMPORTANT THING: `ctrl + b` is a nightmare to press with human meat hands. Remap it to something more sensible like `ctrl + a`. Or, you know, whatever you want. 

```
set -g prefix C-a
unbind C-b
bind C-a send-prefix
```


- This lowers the escape time for entering TMUX commands, as the default speed seems to assume that you are going to pause for dramatic effect in the middle of typing. `xterm-keys` makes it so TMUX doesn't, like, totally freak out when it gets certain commands from iTerm.

```
set -s escape-time 0
set -g xterm-keys on
```

- THE MOUSE: you can still use it. This makes it so you can select windows and resize panes and probably do other cool things with your mouse, because why would you ever want to resize a window through keyboard shortcuts? 

```
set -g mode-mouse on
set -g mouse-resize-pane on
set -g mouse-select-pane on
set -g mouse-select-window on
```



- You might be changing yr config file a lot while you try to get things juuuuuuuuuust right. A simple `ctrl + a - r` will reload your configuration file on the spot. 

```
unbind r
bind r source-file ~/.tmux.conf
```



- Makes TMUX use GNU/EMACS commands for scrolling and other things. So one catch to doing work over SSH is that you inevitably must pick a side in the always riveting emacs vs. vim debate. If you are of the vim persuasion just don't include this line because that is the default.

```
set-window-option -g mode-keys emacs
```


- Move the status bar to the top. I guess if you prefer it at the bottom you can delete this. I will allow it. You might need to upgrade TMUX to at least 1.7 to get this working because apparently that is a VERY ADVANCED feature.

```
set-option -g status-position top
```


- Set the terminal to use 256 colorsa, and make the status bar and panes have prettier colors =^.^= customize to your joy! I guess that there are multiple acceptable colour formats? And that I copy-pasta'd these settings from different sources? 

```
set -g default-terminal "screen-256color"
set -g status-bg '#666666'
set -g status-fg '#aaaaaa'
set -g pane-border-fg colour245
set -g pane-active-border-fg colour46
```


- Remove a bunch of junk text from the status bar. I suppose that instead of the empty strings you could add something like "PIZZA TIME 4pm!!!" or what have you. Or maybe write a script that uses this space to give you updates on things like how all your tests failed or you got another email from jira.

```
set -g status-left ''
set -g status-right ''
```


- This lets you quickly jump around panes by entering `C-a the-number-of-the-pane`. It also takes care to rebind C-l for reasons I don't totally understand. I should see what happens when I delete that. Also renumbers the panes to be 1-9 instead of 0-9, because on yr keyboard the number keys probably go from 1-9, so it would be quite a stretch to hit the 0 key to go to the first pane, and then hit the 1 to go to the second. Array indexing doesn't make sense for everything.

```
unbind ^A
bind ^A select-pane -t :.+
bind C-l send-keys 'C-l'
set -g base-index 1
```


- This one is, I think, pretty explanatory.

```
bind C-k clear-history
```


- I tend to never split panes/windows in tmux, and instead just create new windows and tab between them with `C-a {1-9}`. But when I do, I can never remember the command for it. So to make things easier this remaps those actions to use `|` for a horizontal split and `-` for vertical, which I must say is a cute little visual memnonic.

```
unbind %
bind | split-window -h
bind - split-window -v 
```

-----------------------------------------------------------------------

### TMUX Commands

some of these are built in, some depend on using the above mentioned settings..

- `C-a c`    open a window
- `C-a &`    close a window
- `C-a d`    detach from tmux
- `C-a k`    clear history
- `C-a number`    jump to that number window. 
- `C-a |`    split window horizontally
- `C-a -`    split window vertically

### COPY PASTA

You might notice that TMUX is not happy about you trying to select and copy it's output. Mouse-mode makes it so we can click the text, but in order to select text from TMUX and copy and paste elsewhere, **just hold down the option key while you are selecting the text**. You'll know it's working because the selection will be a different color than the usual TMUX selection color. However if you are running split panes you will find that the selection does not obey their boundaries.

-----------------------------------------------------------------------

### start a tmux session

First, SSH into your server.

Then, run `tmux`. 

Hopefully it is installed already. 

I bet it might be.

Now that you have this TMUX "session" running, you can "detach" from it and go do other things, then later come back and "re-attach" to it, and everything will still be as you left it! Processes will be processing, servers will be serving, text editors will be waiting for you to edit things.

One neat trick I learned is to add a function like this to yr `.bash_profile`for what have you:

```
sshin () {
  ssh $1 -t tmux a
}
```

Now you can do `sshin YRNAME@yr.host.server.com` and you will automagically ssh in and attach to yr running TMUX session. When you are finished, you can enter `C-a d` to detach and it will also disconnect you from the SSH connection. Note that you must already have a TMUX session running on the server for this command to work.

----------------------------------------------------------

###  WOW! JUST LOOK AT THAT TERMINAL! WATCH HOW IT MULTIPLEXES!

![tmuxing around](tmux.gif)
