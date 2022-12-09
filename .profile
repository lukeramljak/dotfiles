#!/bin/sh

export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_CONFIG_DIRS="$XDG_CONFIG_DIRS"/etc/xdg
export HISTFILE="$XDG_DATA_HOME"/bash/history

export EDITOR="codium"
export READER="zathura"
export VISUAL="codium"
export CODEEDITOR="codium"
export TERMINAL="alacritty"
export BROWSER="firefox"
export COLORTERM="truecolor"
export WM="i3"

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xrdb -load ~/.Xresources &

setxkbmap -option caps:escape -option altwin:swap_alt_win &
xsetroot -cursor_name left_ptr &

nm-applet --indicator &
lxpolkit &
flameshot &
numlockx &
<<<<<<< HEAD
=======
openrgb --startminimized -p White &
>>>>>>> e96493a5cb87f9ab5c41ad2d65556fe216de5ae3
kdeconnect-app &
openrgb --startminimized -p White &

exec i3
