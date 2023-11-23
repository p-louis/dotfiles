#!/bin/bash

status=$(systemctl status nginx.service | grep "Active:" | awk '{print $2}')

if [[ $status == "active" ]]; then
    echo "%{F#43a047}歷"
elif [[ $status == "inactive" ]]; then
    echo "%{F#F2C185}轢"
else
    echo "%{F#F29199}轢"
fi
