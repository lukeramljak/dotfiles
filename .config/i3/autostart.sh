#!/bin/sh

# compositor
killall picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --vsync &

nitrogen --restore &
~/.local/bin/autotiling &
dunst &
unclutter &

#sxhkd
sxhkd -c $HOME/.config/i3/sxhkd/sxhkdrc &