#!/bin/bash

xrandr --output HDMI-1 --rate 120 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --mode 1920x1080 --rate 144 --pos 1920x0 --rotate normal --primary
# xrandr --output DP-1 --mode 1920x1080 --rate 144 --primary
setxkbmap pl
# setxkbmap -option caps:escape
thunar --daemon &
