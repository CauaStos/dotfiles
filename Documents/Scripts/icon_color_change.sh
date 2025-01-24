#!/bin/bash

color_distance() {
    input=($1)
    color=($2)
    distance=$(( (${input[0]} - ${color[0]})**2 + (${input[1]} - ${color[1]})**2 + (${input[2]} - ${color[2]})**2 ))
    echo $distance
}

get_closest_color() {
    input_rgb=($1)

    colors=(
        "adwaita 255 255 255"
        "black 0 0 0"
        "blue 0 0 255"
        "bluegrey 96 125 139"
        "breeze 255 255 200"
        "brown 139 69 19"
        "carmine 255 0 56"
        "cyan 0 255 255"
        "darkcyan 0 139 139"
        "deeporange 255 87 34"
        "green 0 255 0"
        "grey 128 128 128"
        "indigo 75 0 130"
        "magenta 255 0 255"
        "nordic 59 66 82"
        "orange 255 152 0"
        "palebrown 110 76 30"
        "paleorange 255 167 38"
        "pink 255 128 171"
        "red 255 0 0"
        "teal 0 128 128"
        "violet 142 36 170"
        "white 255 255 255"
        "yaru 53 152 219"
        "yellow 255 255 0"
    )

    closest_color=""
    min_distance=999999
    for color in "${colors[@]}"
    do
        color_name="${color%% *}"
        color_rgb=(${color#* })
        distance=$(color_distance "${input_rgb[*]}" "${color_rgb[*]}")
        if [ $distance -lt $min_distance ]; then
            min_distance=$distance
            closest_color=$color_name
        fi
    done

    echo $closest_color
}

input_color=$(cat ~/Documents/Scripts/icon_color_input.txt)
input_rgb=($(printf "%d %d %d" 0x${input_color:1:2} 0x${input_color:3:2} 0x${input_color:5:2}))
input_color_name=$(get_closest_color "${input_rgb[*]}")


papirus-folders -C $input_color_name
gsettings set org.gnome.desktop.interface gtk-theme ''
gsettings set org.gnome.desktop.interface gtk-theme Material

exit 0
