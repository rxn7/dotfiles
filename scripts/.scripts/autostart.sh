#!/bin/bash

xrandr --output DP-1 --off --output DP-2 --rate 144 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-3 --off --output HDMI-1 --mode 1920x1080 --rate 120 --pos 0x0 --rotate normal
setxkbmap pl
setxkbmap -option caps:escape
thunar --daemon &
gamemoded -d
