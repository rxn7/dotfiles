#!/bin/sh

restart() {
    [ -z "$(pidof -x $1)" ] && ${2:-$1} &
}

setxkbmap pl
xrandr --output DisplayPort-0 --primary --mode 1920x1080 --pos 1080x531 --rotate normal --rate 144 --output DisplayPort-1 --off --output DisplayPort-2 --off --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate left --rate 120
xset r rate 300 70

restart volumeicon
restart devmon
restart polkit-dumb-agent
