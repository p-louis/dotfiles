#!/bin/bash

#echo $1$2$3 >> /home/caya/bin/acpi/eventlog.log
case "$1" in
  jack/headphone)
    case "$3" in
      plug)
        touch /tmp/headphones
        sudo -u caya DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send -u Low -i audio-headphones "Connected"
        ;;
      unplug)
        rm /tmp/headphones
        sudo -u caya DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send -u Low -i audio-headphones "Disconnected"
        ;;
    esac
    ;;
  jack/microphone)
    case "$3" in
      plug)
        sudo -u caya DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send -u Low -i audio-input-microphone "Connected"
        ;;
      unplug)
        sudo -u caya DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send -u Low -i audio-input-microphone "Disconnected"
        ;;
    esac
    ;;
esac

exit 0
