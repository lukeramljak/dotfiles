#!/bin/sh

# compositor
killall picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config ~/.config/picom/picom.conf &

~/.config/i3/polybar/launch.sh &

nitrogen --restore; sleep 1 &
~/.local/bin/autotiling &
dunst &
unclutter &

#sxhkd
sxhkd -c $HOME/.config/i3/sxhkd/sxhkdrc &