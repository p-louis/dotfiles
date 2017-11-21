#!/bin/bash

if [ $1 -eq 1 ]; then
  sudo rm /etc/resolv.conf
  sudo ln -s /run/NetworkManager/resolv.conf /etc/resolv.conf
else
  sudo rm /etc/resolv.conf
  sudo ln -s /home/caya/resolv.conf /etc/resolv.conf
fi
