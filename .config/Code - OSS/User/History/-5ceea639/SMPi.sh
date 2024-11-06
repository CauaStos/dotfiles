#!/bin/bash
hyprctl keyword monitor DP-3, enabled
hyprctl keyword monitor HDMI-A-1, enabled
sleep 5
linux-wallpaperengine --screen-root DP-3 --screen-root HDMI-A-1 --silent 2593802559
