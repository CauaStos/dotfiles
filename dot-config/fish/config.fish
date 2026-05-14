# Environment

## Editor
set -gx EDITOR nvim

## Java
set -gx _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
set -gx _JAVA_AWT_WM_NONREPARENTING 1

## Font rendering
set -gx FREETYPE_PROPERTIES 'truetype:interpreter-version=40'

## GTK Theme
set -gx GTK_THEME Material

## OpenAI Agents SDK
set -gx OPENAI_AGENTS_DISABLE_TRACING 1

## PATH
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin

# Fish behavior

## Disable greeting
set fish_greeting

## Abbreviations
abbr --add flutter 'fvm flutter'

## Prompt / tools
starship init fish | source
zoxide init fish | source

## Enable transient prompt
type -q enable_transience; and enable_transience

## Eye candy
### Sleep so fastfetch doesn't mess width
if status is-interactive
    alias zed='zeditor'
    alias ssh="kitty +kitten ssh"

    sleep 0.1
    fastfetch --logo-width 10
end
