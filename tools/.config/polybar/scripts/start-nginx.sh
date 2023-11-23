#!/bin/sh

status=$(systemctl status nginx.service | grep "Active:" | awk '{print $2}')

if [[ $status == "active" ]]; then
    notify-send "Stopping nginx"
    sudo systemctl stop nginx.service
elif [[ $status == "inactive" ]]; then
    notify-send "Starting nginx"
    sudo systemctl start nginx.service
else
    notify-send "Starting nginx"
    sudo systemctl start nginx.service
fi
