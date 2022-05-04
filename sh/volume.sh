#!/bin/bash

volume=$(pamixer --get-volume)
mute=$(pamixer --get-mute)
icon="ﰝ"
[ "$mute" = "true" ] && icon="遼"

printf "%s %s%%" $icon $volume
