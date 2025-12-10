#!/bin/bash
ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
if [ -z "$ssid" ]; then echo "Disconnected"; else echo "$ssid"; fi