#!/bin/bash

hyprctl dispatch dpms on
sleep 5
linux-wallpaperengine --screen-root DP-3 --screen-root HDMI-A-1 --silent 2593802559
