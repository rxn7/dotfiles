#!/usr/bin/env bash

programs=(
	"rxbar"
	"dunst"
	"polkit-dumb-agent"
	"xrootgif /home/rxn/pics/wallpapers/tree.gif"
);

# Settings
xrandr --output HDMI-A-0 --rate 144 --mode 1920x1080
xrandr --output DisplayPort-0 --rate 144 --mode 1920x1080 --right-of HDMI-A-0 --primary
xset r rate 120 30
setxkbmap pl

restart() {
	echo "Restarting $1"
	pkill $1
	cmd=$*
	$cmd &>/dev/null & disown;
}

for prog in "${programs[@]}"; do
	restart $prog
done

pkill polybar
if type "xrandr" > /dev/null; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar main &
	done
fi
