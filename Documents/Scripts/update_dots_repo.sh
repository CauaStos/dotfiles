#!/bin/bash
#Tutorial INSANO pro rsync aqui tá
#
#
#-a: Archive mode, which preserves permissions, timestamps, and recursively copies directories.
#-v: Verbose, shows progress.
#--exclude: Specifies each folder or file to exclude from the copy.
#--include: Specifies each folder or file to include from the specified path.
#--checksum: Checks for minor changes in files instead of timestamps. (Specifically, checks for file size instead of timestamps)
#--mkpath: Creates folders if there are none


#cd into the dotfiles directory so the git status --porcelain doesnt return nothing
cd ~/Documents/dotfiles/ || exit

#Document Folders Copy
include=(--include 'Hyprlock Assets/' --include 'Scripts/' --include 'Wallpapers/' --exclude '*/')

echo "Copying 'Documents' folders..."

rsync -av --checksum --mkpath "${include[@]}" ~/Documents/ ~/Documents/dotfiles/Documents/


#Specific Folders Copy
echo "Copying specific folders and files..."

rsync -av --checksum --mkpath ~/.zshrc ~/Documents/dotfiles/home/

rsync -av --checksum --mkpath ~/.local/share/zed/extensions/ ~/Documents/dotfiles/.local/share/zed/extensions




#Document Folders Copy
include=(--include 'Hyprlock Assets/' --include 'Scripts/' --include 'Wallpapers/' --exclude '*/')

echo "Copying 'Documents' folders..."

rsync -av --checksum --mkpath "${include[@]}" ~/Documents/ ~/Documents/dotfiles/Documents/

#.config Folders Copy

echo "Copying '.config' folders..."

include=(--include 'hypr/' --include 'ghostty/' --include 'macchina/' --include 'macchina/themes/' --include 'qt5ct/' --include 'qt5ct/colors/' --include 'qt6ct/' --include 'qt6ct/colors/' --include 'nwg-dock-hyprland/' --include 'hyprpanel/' --include 'zed/' --include 'albert/' --include 'matugen/' --exclude '*/')

rsync -av --checksum --mkpath "${include[@]}" ~/.config/ ~/Documents/dotfiles/.config

rm -f ~/Documents/dotfiles/.config/*
rm -f ~/Documents/dotfiles/.config/.*

#echo "Copying SDDM theme..."

#rsync -av --checksum --mkpath /usr/share/sddm/themes/where_is_my_sddm_theme/ ~/Documents/dotfiles/sddm/themes/where_is_my_sddm_theme/

#Moving install_dots.sh to project's root.
echo "Moving install script to project's root"

cp ./Documents/Scripts/install_dots.sh ./


if [[ $(git status --porcelain) ]]; then
    echo "pushing changes"

    git add .
    git commit -m "Updating dotfiles"
    git push origin main
else
    echo "no changes to commit"
fi

echo "Done!"
exit 0

#/home/astro/.var/app/io.github.hrkfdn.ncspot/config/ncspot/
