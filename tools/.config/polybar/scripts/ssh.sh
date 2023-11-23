#!/bin/sh


# Get user selection via dmenu from ssh config file.
chosen=$( \
    cat $HOME/.ssh/config | \
    grep -Ei "^[hH]ost .*$" | \
    awk '{print $2}' | \
    dmenu -x 406 -y 32 -l 10 -z 400 -i -p "ssh:" | \
    sed "s/ .*//")

# Exit if none chosen.
[ -z "$chosen" ] && exit

if [ -n "$1" ]; then
	xdotool type "$chosen"
else
	notify-send "connecting to '$chosen'." &
	$TERMINAL -e ssh "$chosen"
fi
