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
easyeffects --gapplication-service &
openrgb -p White &

# keyboard layout/fix cursor
setxkbmap -option caps:escape -option altwin:swap_alt_win &
xsetroot -cursor_name left_ptr &

# misc
lxpolkit &
numlockx &
nitrogen --restore &
dunst &
unclutter &

#sxhkd
sxhkd -c ~/.config/i3/sxhkd/sxhkdrc &