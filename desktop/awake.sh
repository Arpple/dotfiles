#!/bin/bash

# =============================================
# Anti-Idle Script - Simulates key press every 60 seconds
# Press Ctrl+C to stop
# =============================================

echo "Anti-idle script started. Press Ctrl+C to stop."

# You can change this:
INTERVAL=60          # seconds between key presses
KEY="Shift"          # Safe key (doesn't interfere much)

while true; do
    echo "Sending $KEY key..."

    if command -v xdotool >/dev/null 2>&1; then
        xdotool key "$KEY"
    elif command -v ydotool >/dev/null 2>&1; then
        ydotool key 42:1 42:0   # 42 = Left Shift (press + release)
    else
        echo "Error: Neither xdotool nor ydotool found!"
        exit 1
    fi

    sleep "$INTERVAL"
done
