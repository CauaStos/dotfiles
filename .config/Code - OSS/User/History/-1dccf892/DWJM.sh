#!/bin/bash

#cd into the dotfiles directory so the git status --porcelain doesnt return nothing
cd ~/Documents/dotfiles/ || exit

#Document Folders Copy
include=(--include 'Hyprlock Assets/' --include 'Scripts/' --include 'Wallpapers/' --exclude '*/')

rsync -av "${include[@]}" ~/Documents/ ~/Documents/dotfiles/Documents_Folder 

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

exit 0