#!/bin/bash
#Tutorial INSANO pro rsync aqui tá
#
#
#-a: Archive mode, which preserves permissions, timestamps, and recursively copies directories.
#-v: Verbose, shows progress.
#--exclude: Specifies each folder or file to exclude from the copy. 
#--include: Specifies each folder or file to include from the specified path.
#
#


#cd into the dotfiles directory so the git status --porcelain doesnt return nothing
cd ~/Documents/dotfiles/ || exit

#Document Folders Copy
include=(--include 'Hyprlock Assets/' --include 'Scripts/' --include 'Wallpapers/' --exclude '*/')

rsync -av "${include[@]}" ~/Documents/ ~/Documents/dotfiles/Documents/

#.config Folders Copy

include=(--include 'hypr/' --include 'waybar/' --include 'qt5ct/' --include 'qt6ct/' --include 'kitty/' --exclude '*/')

rsync -av "${include[@]}" ~/.config/ ~/Documents/dotfiles/.config

rm -f ~/Documents/dotfiles/.config/*
rm -f ~/Documents/dotfiles/.config/.*

if [[ $(git status --porcelain) ]]; then
    git add .
    git commit -m "Updating dotfiles"
    git push origin main

else 
    echo "no changes to commit"
fi

echo "Done!"
exit 0