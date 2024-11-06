#!/bin/bash
hyprctl keyword monitor DP-3, enabled
#NAO DE ESPAÇO NA PORRA DO NEGOCIO SENAO ELE DA ERRADO KKKKKKKKKKKK FAZ O L
hyprctl keyword monitor DP-3,1920x1080@144,-1920x0,1
hyprctl keyword monitor HDMI-A-1, 1366x768, 0x0, 1, transform, 1 


sleep 5
linux-wallpaperengine --screen-root DP-3 --screen-root HDMI-A-1 --silent 2593802559
