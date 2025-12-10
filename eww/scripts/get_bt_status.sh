#!/bin/bash
status=$(bluetoothctl show | grep "Powered: yes")
if [ -z "$status" ]; then
    echo "Off"
else
    devices=$(bluetoothctl info | grep "Name")
    if [ -z "$devices" ]; then echo "On"; else echo "Connected"; fi
fi