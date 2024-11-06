#!/bin/bash
hyprctl keyword monitor DP-3, enabled
hyprctl keyword monitor DP-3, 1920x1080@144, -1920x0, auto,auto
hyprctl keyword monitor HDMI-A-1, enabled
hyprctl keyword monitor HDMI-A-1, 1366x768, auto, auto, transform, 1

sleep 5
linux-wallpaperengine --screen-root DP-3 --screen-root HDMI-A-1 --silent 2593802559
