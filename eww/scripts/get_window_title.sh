#!/bin/bash
# Fetch active window title
title=$(hyprctl activewindow -j | jq -r '(.title)')

# If no window is selected (returns null), show nothing
if [ "$title" == "null" ] || [ -z "$title" ]; then
    echo ""
else
    # Check if length is greater than 50
    if [ ${#title} -gt 50 ]; then
        echo "${title:0:50}..."
    else
        echo "$title"
    fi
fi