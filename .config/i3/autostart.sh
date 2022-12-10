#!/bin/sh

# compositor
killall picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config ~/.config/picom/picom.conf &

~/.config/i3/polybar/launch.sh &

nitrogen --restore; sleep 1 &
dunst &
unclutter &

#sxhkd
sxhkd -c ~/.config/i3/sxhkd/sxhkdrc &