#!/bin/bash
hyprctl keyword monitor DP-3, enabled
#NAO DE ESPAÇO NA PORRA DO NEGOCIO SENAO ELE DA ERRADO KKKKKKKKKKKK FAZ O L
hyprctl keyword monitor DP-3,1920x1080@144,-1920x0,1
hyprctl dispatch dpms on HDMI-A-1
hyprlock
linux-wallpaperengine --screen-root DP-3 --screen-root HDMI-A-1 --silent 2593802559
