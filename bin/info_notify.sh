#!/bin/bash

battery=$(acpi | grep -o '[0-9]*%' | grep -o '[0-9]*')
batSym=""
if [ $battery -ge 90 ]; then
  batSym=""
elif [ $battery -ge 75 ] && [ $battery -lt 90 ]; then
  batSym=""
elif [ $battery -ge 50 ] && [ $battery -lt 75 ]; then
  batSym=""
elif [ $battery -ge 25 ] && [ $battery -lt 50 ]; then
  batSym=""
elif [ $battery -ge 0 ] && [ $battery -lt 25 ]; then
  batSym=""
fi

time=$(date | awk '{print $4}')

linkInfo=$(iw dev wlp3s0 link)
conn=$(echo $linkInfo | awk '{if ($1=="Connected") print "",$7; else print " Disconnected"}')

notify-send "Status" "$conn  $(date | awk '{print $1,$2,$3,$6}')  $time $batSym $battery%"
