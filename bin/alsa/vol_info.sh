#!/bin/bash

vol=$(amixer get Master playback | grep -o '[0-9]*%')
volNum=$(echo $vol | grep -o '[0-9]*')
volPart=$(($volNum / 4))

volHP=$(amixer get Headphone playback | grep Right | grep -o '[0-9]*%')
volHPNum=$(echo $volHP | grep -o '[0-9]*')
volHPPart=$(($volHPNum / 4))


barOut=""
for num in {0..25}; do
  if [[ $volPart -eq $num ]]; then
    barOut="$barOut|"
  else
    barOut="$barOut\-"
  fi
done

barHPOut=""
for num in {0..25}; do
  if [[ $volHPPart -eq $num ]]; then
    barHPOut="$barHPOut|"
  else
    barHPOut="$barHPOut\-"
  fi
done

notify-send -t 100 -i audio-speakers -u Low 'Master volume' "$barOut $vol"
notify-send -t 100 -i audio-headphones -u Low 'Headphone volume' "$barHPOut $volHP"
