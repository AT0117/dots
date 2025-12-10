#!/bin/bash

# 1. Get the ID of the currently active workspace
active_id=$(hyprctl activeworkspace -j | jq '.id')

# 2. Get all workspaces that have windows, sorted by ID
# We loop through them to generate buttons
workspaces=$(hyprctl workspaces -j | jq -c 'sort_by(.id)')

# 3. Start building the Yuck container
echo -n "(box :class \"workspaces-box\" :orientation \"h\" :spacing 5 "

# 4. Loop through each workspace
echo "$workspaces" | jq -c '.[]' | while read -r ws; do
    id=$(echo "$ws" | jq '.id')
    
    # Check if this is the active one to assign the Red color
    if [ "$id" -eq "$active_id" ]; then
        class="ws-active"
    else
        class="ws-inactive"
    fi

    # Output the button
    echo -n "(button :onclick \"hyprctl dispatch workspace $id\" :class \"$class\" \"$id\") "
done

# 5. Close the container
echo ")"