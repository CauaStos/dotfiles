export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

export EDITOR=nvim
export PATH="$HOME/Documents/development/flutter/bin:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
export FREETYPE_PROPERTIES="truetype:interpreter-version=40 cff:no-stem-darkening=1 autofitter:warping=1"

set fish_greeting
abbr --add zed zeditor
eval "$(starship init fish)"
eval "$(zoxide init fish)"
enable_transience
#sleep so fastfetch doesnt bug width

if status -i;
    and sleep 0.1;
    fastfetch --logo-width 10;
end
