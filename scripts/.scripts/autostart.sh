#!/bin/bash

xrandr --output DisplayPort-0 --primary --mode 1920x1080 --rate 144 --pos 1080x257 --rotate normal --output DisplayPort-1 --off --output DisplayPort-2 --off --output HDMI-A-0 --mode 1920x1080 --rate 120 --pos 0x0 --rotate left
xset r rate 220 70
setxkbmap pl
setxkbmap -option caps:escape
thunar --daemon &
