---
title: tmuxing-around
date: 2015-07-25 16:51 UTC
tags:
---

START TMUXING AROUND MORE
USING TMUX, SSH, OSX


https://github.com/coleww/dotfiles/blob/master/.tmux.conf

Recently started doing my work-work in a dev-box in the cloud. Wanted to be able to treat ssh connection like i was just on local filesystem. A bit overwhelmed, hard to find exact info.

THE ONLY TMUX COMMANDS U NEED



- sshin trick, attach directly to the mux, detach disconnects.


C-a c open new window
C-a number => jump to that number window 
C-a arrow?






FIRSTLY
remap prefix to CTRL + a (or whatever you want.) b is totally absurd
```bash
set -g prefix C-a
unbind C-b
bind C-a send-prefix
```


SECONDLY
enable the mouse
```
set -g mode-mouse on
set -g mouse-resize-pane on
set -g mouse-select-pane on
set -g mouse-select-window on
```

# remove administrative debris (session name, hostname, time) in status bar
set -g status-left ''
set -g status-right ''

# makes entering commands much easier
set -s escape-time 0


# quick pane cycling
unbind ^A
bind ^A select-pane -t :.+
# number screens 1-9 cuz thats how keyboard is
set -g base-index 1


# force a reload of the config file
unbind r
bind r source-file ~/.tmux.conf

# easier splitting, open splits in current path
unbind %
bind | split-window -h
bind - split-window -v 


FUN TRICK:
something only applicable to OSX? (works for other things too!) put it in tmux-osx.conf! it should contain `source-file ~/.tmux.conf`

```bash
if [[ "$(uname)" = "Darwin" ]]; then
  alias tmux='tmux -f ~/.tmux-osx.conf'
else
  alias tmux='tmux'
fi
```



Sadly, started TMUX, copy-paste, scroll, all mouse movement was not working. I know i should learn the shortcuts (i started on emacs!) but for certain things like resizing terminal panes or selecting text i just can't bring myself to not use a mouse.

=> list links to maybe solutions?