#!/bin/bash

#installing packages that are used by config. (Also installing AUR Helper of my preference, YAY)

#yay install

echo "Installing AUR Helper (YAY)"

sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si && cd .. #we 'cd ..' since we are inside of yay-bin

#arch packages installation

echo "Installing necessary packages (pacman)"

sudo pacman -S hyprland sddm polkit-gnome hyprpaper hypridle spotify-launcher nwg-look hyprlock foot zed thunar hyprpicker

#AUR packages installation

echo "Installing necessary packages (AUR)"

yay -S ags-hyprpanel-git hyprsunset zen-browser-bin spotify vesktop opentabletdriver catppuccin-gtk-theme-mocha catppuccin-cursors-mocha mission-center hyprshot hyprlauncher


#Copying folders to home

echo "Moving files to home. '~/'"
rsync -av --checksum ./Documents ./.config ~/

echo "Done!"
exit 0
