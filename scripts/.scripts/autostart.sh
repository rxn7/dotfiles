#!/usr/bin/env bash

programs=(
	"dunst"
	"polkit-dumb-agent"
	"nitrogen --restore"
);

function apply_settings() {
	echo -e '\e[37mApplying settings...'
	xrandr --output HDMI-A-0 --rate 144 --mode 1920x1080
	xrandr --output DisplayPort-0 --rate 144 --mode 1920x1080 --right-of HDMI-A-0 --primary
	xset r rate 120 30
	setxkbmap pl
}

function restart_polybar() {
	echo -e "\e[37mRestarting \e[1;32mPolybar\e[37m..."
	pkill polybar
	if type "xrandr" > /dev/null; then
		for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
			MONITOR=$m polybar main &>/dev/null & disown;
		done
	fi
}

function start_pulseaudio() {
	if ! pulseaudio --check
	then
		systemctl --user enable pulseaudio && systemctl --user start pulseaudio
	fi
}

function restart_programs() {
	for prog in "${programs[@]}"
	do
		restart_program $prog
	done
}

function restart_program() {
	echo -e "\e[37mRestarting \e[1;32m$1\e[37m..."
	pkill $1
	cmd=$*
	$cmd &>/dev/null & disown
}

echo -e '\e[37mRunning autostart...'

start_pulseaudio
apply_settings
restart_programs
restart_polybar

notify-send "Autostart finished..." &>/dev/null & disown
