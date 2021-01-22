#!/bin/bash
empty_icon=$(echo -e "\uf096")
filled_icon=$(echo -e "\uf0c8")
focused_icon="<span foreground='#e5b0ff'>$filled_icon</span>"

notification=""
focused=$(bspc query -T -d | jq '.name' | sed -r 's/("|")//g')
for row in {1..2}; do
	for col in {1..3}; do
		cell=$empty_icon
		if [[ $col-$row == $focused ]]; then
			cell=$focused_icon
		elif [[ -n $(bspc query -N -d $col-$row) ]]; then
			cell=$filled_icon
		fi
                cell="$(bspc desktop $col-$row)$cell"
		if [[ $col -eq 1 ]]; then
			notification=$notification$cell
		else
			notification=$notification' '$cell
		fi
	done
        if [[ $row < 2 ]]; then
          notification=$notification'<br>'
        else
          notification=$notification' '
        fi
done
notification=${notification::-1}
notify-send -u Low -i video-display --expire-time=10 " " "$notification"
