#!/usr/bin/env bash

if pactl list modules | grep -q 'module-loopback'
then
	echo -e '\e[37mTurning \e[1;31mOFF\e[37m loopback module'
	pactl unload-module module-loopback
else
	echo -e '\e[37mTurning \e[1;32mON\e[37m loopback module'
	pactl load-module module-loopback latency_msec=5 &> /dev/null
fi
