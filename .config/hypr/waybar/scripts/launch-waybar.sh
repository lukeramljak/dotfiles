#!/bin/bash

CONFIG_FILES="$HOME/.config/hypr/waybar/config $HOME/.config/hypr/waybar/style.css"

trap "killall waybar" EXIT

while true; do
    inotifywait -e create,modify $CONFIG_FILES
    killall -SIGUSR2 waybar
done