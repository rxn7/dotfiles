#!/bin/sh

restart() {
    [ -z "$(pidof -x $1)" ] && ${2:-$1} &
}

setxkbmap pl
xrandr --output eDP1 --rate 165 --mode 1920x1080 --set "PRIME Synchronization" 1
xset r rate 300 70
restart volumeicon
restart picom --config ~/.config/picom/picom.conf
