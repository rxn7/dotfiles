#!/bin/sh

DIR="$HOME"
LOCAL_FLAG="-l"

df -h -P $LOCAL_FLAG "$DIR" | awk -v alert_low=10 '
/\/.*/ {
	print label $4
	use=$5
	exit 0
}
END {
	gsub(/%$/,"",use)
	if (100 - use < alert_low) {
		# color
		print "#FF0000"
	}
}
'
