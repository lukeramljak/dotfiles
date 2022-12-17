#!/bin/sh

# compositor
killall picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config ~/.config/picom/picom.conf &

# bar
~/.config/i3/polybar/launch.sh &
nm-applet --indicator &

# programs
autotiling &
flameshot &
kdeconnect-app &

# misc
/usr/bin/lxpolkit &
numlockx &
nitrogen --restore &
dunst &
unclutter &

#sxhkd
sxhkd -c ~/.config/i3/sxhkd/sxhkdrc &