#!/bin/bash
cd ~/Documents/dotfiles/ || exit
#Document Folders Copy
#-a: Archive mode, which preserves permissions, timestamps, and recursively copies directories.
#-v: Verbose, to show progress.
#--exclude: Specifies each folder or file to exclude from the copy. 
#--include: Specifies each folder or file to include from the fetched path.
include=(--include 'Hyprlock Assets/' --include 'Scripts/' --include 'Wallpapers/' --exclude '*/')

rsync -av "${include[@]}" ~/Documents/ ~/Documents/dotfiles/Documents_Folder 

#.config Folders Copy

include=(--include 'hypr/' --include 'waybar/' --include 'qt5ct/' --include 'qt6ct/' --exclude '*/')

rsync -av "${include[@]}" ~/.config/ ~/Documents/dotfiles/.config

if [[ $(git status --porcelain) ]]; then
    git add .
    git commit -m "Updating dotfiles"
    git push origin main

else 
    echo "no changes to commit"
fi