#!/bin/bash

#installing packages that are used. (Installing YAY too)


#yay install
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si

#arch packages installation
sudo pacman -S polkit-gnome hyprpaper hypridle spotify-launcher

#AUR packages installation

yay -S ags-hyprpanel-git hyprsunset zen-browser-bin spotify vesktop opentabletdriver


#Copying folders to home
rsync -av --checksum ./Documents ./.config ~/
