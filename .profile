#!/bin/sh

sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

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

# load openrgb profile
org.openrgb.OpenRGB --startminimized -p white &

# keyboard layout/fix cursor
setxkbmap -option caps:escape -option altwin:swap_alt_win &
xsetroot -cursor_name left_ptr &

# clipboard manager
clipit &

# disable screen blanking
xset s off && xset -dpms &

# auto connect to VPN
protonvpn-cli c -f &

# start redshift
redshift &

exec i3
