#!/bin/bash

programs=(
	"dwmblocks"
	"dunst"
	"xrootgif /home/rxn/pics/wallpapers/tiles.gif"
	"polkit-dumb-agent"
	"emacs --daemon"
);

# Settings
xrandr --output DP-1 --rate 144 --mode 1920x1080 --right-of HDMI-1
xrandr --output HDMI-1 --rate 144 --mode 1920x1080
xset r rate 120 30
setxkbmap pl

restart() {
	echo "Restarting $1"
	pkill $1
	cmd=$*
	$cmd &>/dev/null & disown;
}

for prog in "${programs[@]}"
do
	restart $prog
done
