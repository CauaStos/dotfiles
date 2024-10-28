song_author=$(playerctl metadata artist)
song_name=$(playerctl metadata title)

echo "Now playing: ${song_author} - ${song_name}"
