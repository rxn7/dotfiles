#!/bin/sh

echo sensors | awk '/Core 0/ {print "🌡" $3}'
