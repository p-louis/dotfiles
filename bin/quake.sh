#!/bin/bash
namespace=quake_terminal
name=$(~/bin/get_name $@ -n $namespace)

notify-send -u Low "Triggered" "this is quake_terminal $@"
bspc rule -a st-256color:hiddenfloating$name state=floating hidden=on

if [[ -z $(xdotool search --classname '^'$name'$') ]]; then
	st -n "hiddenfloating$name"&
        echo "Spawned window hiddenfloating$name"
	win=$(xdotool search --classname hiddenfloating$name)
	xdotool set_window --classname "forgotten" $win
        echo "Renamed window $win to classname forgotten"

	xy=$(get_end_pos $@ -n $namespace)
	x=$(echo $xy | awk '{print $1}')
	y=$(echo $xy | awk '{print $2}')
        echo "found window x $x and y $y"

	xdotool windowsize $win 100 100
	xdotool windowmove $win $x $y
        echo "resized and moved $win"

	bspc node $win -g hidden=off
	bspc rule -r st-256color:hiddenfloating$name state=floating hidden=on
fi
~/bin/quakify $@ -n $namespace -w $win
