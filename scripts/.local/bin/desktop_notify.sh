#!/bin/bash
empty_icon=$(echo -e "\uf096")
filled_icon=$(echo -e "\uf0c8")
focused_icon="<span foreground='#f4b8e4'>$filled_icon</span>"

notification=""
focused=$(bspc query -T -d | jq '.name' | sed -r 's/("|")//g')
for row in {2..0}; do
	for col in {1..3}; do
        current=$((col+row*3))
		cell=$empty_icon
		if [[ $current == "$focused" ]]; then
			cell=$focused_icon
        elif [[ -n $(bspc query -N -d $current) ]]; then
			cell=$filled_icon
		fi
		if [[ $col -eq 1 ]]; then
			notification=$notification$cell
		else
			notification=$notification' '$cell
		fi
	done
        if [[ $row -gt 0 ]]; then
          notification=$notification'<br>'
        else
          notification=$notification' '
        fi
done
notification=${notification::-1}
notify-send -u Low -i video-display --expire-time=500 "Workspaces" "$notification"
echo "${notification}"
