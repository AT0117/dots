#!/bin/bash
# Get count from swaync
count=$(swaync-client -c 2>/dev/null)

if [ -z "$count" ]; then
    echo "0"
else
    echo "$count"
fi