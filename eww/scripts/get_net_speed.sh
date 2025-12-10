#!/bin/bash

# Find active interface
interface=$(ip route get 1.1.1.1 2>/dev/null | awk '{print $5}')

if [ -z "$interface" ]; then
    echo "Offline"
    exit
fi

# Function to get bytes
get_bytes() {
    cat /sys/class/net/$interface/statistics/${1}_bytes
}

# Read initial bytes
rx1=$(get_bytes rx)
tx1=$(get_bytes tx)

sleep 1

# Read bytes after 1 second
rx2=$(get_bytes rx)
tx2=$(get_bytes tx)

# Calculate speed (Bytes per second)
rx_bps=$((rx2 - rx1))
tx_bps=$((tx2 - tx1))

# Convert to human readable function
human_readable() {
    local bytes=$1
    if [ $bytes -gt 1048576 ]; then
        echo "$(echo "scale=1; $bytes/1048576" | bc) MB/s"
    elif [ $bytes -gt 1024 ]; then
        echo "$(echo "scale=0; $bytes/1024" | bc) KB/s"
    else
        echo "${bytes} B/s"
    fi
}

echo " $(human_readable $rx_bps)    $(human_readable $tx_bps)"