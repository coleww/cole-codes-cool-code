---
title: TMUXing around
date: 2015-07-25 16:51 UTC
tags: tmux unix ssh emacs
---

# TMUXing around 
## 


https://github.com/coleww/dotfiles/blob/master/.tmux.conf

Recently started doing my work-work in a dev-box in the cloud. Wanted to be able to treat ssh connection like i was just on local filesystem. A bit overwhelmed, hard to find exact info.

Rough approximation of my .tmux.conf with explanations. 

THE ONLY TMUX COMMANDS U NEED

- sshin trick, attach directly to the mux, detach disconnects. You'll need a tmux running on the server for it to work. 
```bash
sshin(){
  ssh $1 -t tmux a
}
```

You'll also need to put some stuff in the .tmux.conf file on your server. 
Make a .tmux.conf file on your server in the home directory. You can copy and paste [https://github.com/coleww/dotfiles/blob/master/.tmux.conf](my settings) if you like, or try out bits and pieces to make your own configuration. Putting dotfiles on github will make this process way easier, should consider it. 

When you run `tmux` it will automatically look for a file named .tmux.conf and use it to configure itself. for when you are meticulously curating yr dotfiles

```
# force a reload of the config file
unbind r
bind r source-file ~/.tmux.conf
```

FIRSTLY
remap prefix to CTRL + a (or whatever you want.) b is totally absurd
```bash
set -g prefix C-a
unbind C-b
bind C-a send-prefix
```

SECONDLY
enable the mouse to do all of the things.
```
set -g mode-mouse on
set -g mouse-resize-pane on
set -g mouse-select-pane on
set -g mouse-select-window on
```

THIRDLY: some minor things
```
# remove administrative debris (session name, hostname, time) in status bar
set -g status-left ''
set -g status-right ''

# makes entering commands much easier
set -s escape-time 0
```


Point of tmux is to be able to run multiple things in one shell, so how do you get around?

C-a c open a window
C-a & close a window
C-a d detach from tmux

```
# quick pane cycling
unbind ^A
bind ^A select-pane -t :.+
# number screens 1-9 cuz thats how keyboard is
set -g base-index 1

# easier-to-remember window splitting. | is horizontal, - is vertical.
unbind %
bind | split-window -h
bind - split-window -v 
```

C-a number => jump to that number window. 
C-| => split window horizontally
C-- => split window vertically






FUN TRICK:
something only applicable to OSX? (works for other things too!) put it in tmux-osx.conf! it should contain `source-file ~/.tmux.conf`

```bash
if [[ "$(uname)" = "Darwin" ]]; then
  alias tmux='tmux -f ~/.tmux-osx.conf'
else
  alias tmux='tmux'
fi
```


to copy stuff, hold the option key to select it. won't resepct tmux/emacs panes, but you can grab dem errors

