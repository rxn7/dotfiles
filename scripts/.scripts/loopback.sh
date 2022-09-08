#!/usr/bin/env bash

if pactl list modules | grep -q 'module-loopback'
then
	echo -e '\e[0;37mTurning \e[1;31mOFF\e[0;37m the loopback module\e[0m'
	pactl unload-module module-loopback
else
	echo -e '\e[0;37mTurning \e[1;32mON\e[0;37m the loopback module\e[0m'
	pactl load-module module-loopback latency_msec=5 &> /dev/null
fi
