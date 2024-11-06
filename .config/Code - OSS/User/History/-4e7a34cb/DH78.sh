#!/bin/bash

hyprlock

turn_off_dpms() {
    # Use wlr-randr for Wayland
    hyprctl dispatch dpms off
    # Uncomment the line below if you're using X11 with xset
    # xset dpms force off
}

# Monitor mouse movements
while true; do
    # Turn off DPMS
    turn_off_dpms

    # Check for mouse movement by monitoring mouse position
    # wl-paste will output the mouse position, we can use grep to check
    if ! wl-paste --type text --watch | grep -q "mouse"; then
        sleep 0.75  # Sleep for 0.1 seconds
    else
        break  # Break the loop if mouse movement is detected
    fi
done
