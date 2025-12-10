#!/bin/bash

# Check if music is playing
status=$(playerctl status 2>/dev/null)

if [ "$status" == "Playing" ]; then
    # Define our block characters
    chars=(" " "▂" "▃" "▄" "▅" "▆" "▇" "█")
    
    # Generate 5 random bars
    # $RANDOM gives a random integer. We modulo 8 to get 0-7.
    bar1=${chars[$((RANDOM % 8))]}
    bar2=${chars[$((RANDOM % 8))]}
    bar3=${chars[$((RANDOM % 8))]}
    bar4=${chars[$((RANDOM % 8))]}
    bar5=${chars[$((RANDOM % 8))]}
    
    echo "${bar1}${bar2}${bar3}${bar4}${bar5}"
else
    # Flat line if stopped
    echo "─────"
fi