#!/bin/bash
# Returns "Playing", "Paused", or "Stopped"
playerctl status 2>/dev/null || echo "Stopped"