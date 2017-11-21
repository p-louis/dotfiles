#!/bin/bash

perc=$(acpi | awk '{print $4}' | grep -o "[0-9]*")

~/bin/makeAsciiBar.sh $perc
