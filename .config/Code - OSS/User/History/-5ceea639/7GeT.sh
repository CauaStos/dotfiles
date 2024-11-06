#!/bin/bash
hyprctl keyword monitor DP-3, enabled
#dont put a space or after the comma or else it will fuck up hyprctl
hyprctl keyword monitor DP-3,1920x1080@144,-1920x0,1
pkill hypridle
hypridle