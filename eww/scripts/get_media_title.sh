#!/bin/bash
status=$(playerctl status 2>/dev/null)
if [ -z "$status" ] || [ "$status" == "Stopped" ]; then
    echo "NO MEDIA"
else
    data=$(playerctl metadata --format "{{ title }} - {{ artist }}" 2>/dev/null)
    if [ ${#data} -gt 25 ]; then
        echo "${data:0:25}..."
    else
        echo "$data"
    fi
fi