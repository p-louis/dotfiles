#!/bin/bash

if [ -f /tmp/headphones ]; then
  target=Headphone
else
  target=Master
fi

case "$1" in
  button/mute)
    if [[ "$(amixer get $target | grep '.*%' | awk '{print $6}')" == "[on]" ]]; then
      amixer set $target mute
    else
      amixer set $target unmute
    fi
    sudo -u caya DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus /home/caya/bin/alsa/vol_info.sh
    ;;
  button/volumeup)
    amixer set $target playback 5%+
    sudo -u caya DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus /home/caya/bin/alsa/vol_info.sh
    ;;
  button/volumedown)
    amixer set $target playback 5%-
    sudo -u caya DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus /home/caya/bin/alsa/vol_info.sh
    ;;
esac

exit 0
