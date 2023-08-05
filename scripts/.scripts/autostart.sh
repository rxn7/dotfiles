#!/bin/bash

xrandr --output DP-1 --primary --mode 1920x1080 --rate 144 --pos 1080x257 --rotate normal --output HDMI-1 --mode 1920x1080 --rate 120 --pos 0x0 --rotate left
xset r rate 220 70
setxkbmap pl
setxkbmap -option caps:escape
thunar --daemon &
