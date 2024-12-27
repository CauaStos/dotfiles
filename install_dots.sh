#!/bin/bash

#installing packages that are used by config. (Also installing AUR Helper of my preference, YAY)

#yay install

echo "Installing AUR Helper (YAY)"

sudo pacman -S --needed --noconfirm git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si && cd .. #we 'cd ..' since we are inside of yay-bin

#arch packages installation

echo "Installing necessary packages (pacman)"

sudo pacman -S --noconfirm hyprland sddm polkit-gnome hyprpaper hypridle spotify-launcher nwg-look hyprlock foot zed thunar hyprpicker papirus-icon-theme macchina neofetch zoxide starship pipewire pipewire-pulse pipewire-audio pipewire-alsa zsh rsync fuzzel

#AUR packages installation

echo "Installing necessary packages (AUR)"

yay -S --noconfirm ags-hyprpanel-git hyprsunset zen-browser-bin spotify vesktop opentabletdriver catppuccin-gtk-theme-mocha catppuccin-cursors-mocha mission-center hyprshot all-repository-fonts

#Installing Catppuccin Icons
echo "Installing Catppuccin Papirus icons (Mocha flavor, Mauve accent)"

#Not using AUR package cuz it's not working

git clone https://github.com/catppuccin/papirus-folders.git
cd papirus-folders
sudo cp -r src/* /usr/share/icons/Papirus
curl -LO https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-folders/master/papirus-folders && chmod +x ./papirus-folders
./papirus-folders -C cat-mocha-mauve --theme Papirus-Dark


#Installing Oh-My-Zsh

echo "Installing Oh-My-Zsh and making Zsh the default shell."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

chsh -s /usr/bin/zsh

#Installing ZSH Extensions

echo "Installing Zsh extensions (zsh-autosuggestions, zsh-syntax-highlighting)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


#Copying folders to home

echo "Moving files to home. '~/'"
rsync -av --checksum --mkpath ./Documents ./.config ./home/.zshrc ~/

echo "Moving specific files."

rsync -av --checksum --mkpath ./.local/share/zed/extensions/ ~/.local/share/zed/extensions/

#Enabling Services

echo "Enabling necessary services. (Just a precaution)"

systemctl enable sddm

echo "Done!"
exit 0
