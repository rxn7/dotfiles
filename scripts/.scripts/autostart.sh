#!/bin/bash

xrandr --output DP-1 --primary --mode 1920x1080 --rate 144 --pos 1920x90 --rotate normal --output DP-2 --off --output DP-3 --off --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --rate 120

setxkbmap pl
thunar --daemon &
polkit-gnome-authentication-agent-1 &
