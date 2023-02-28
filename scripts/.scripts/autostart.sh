#!/bin/sh

restart() {
    [ -z "$(pidof -x $1)" ] && ${2:-$1} &
}

setxkbmap pl
xrandr --output DisplayPort-0 --primary --mode 1920x1080 --pos 1920x590 --rotate normal --rate 144 --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate normal --rate 120
xset r rate 300 70

restart volumeicon
restart devmon
restart polkit-dumb-agent
