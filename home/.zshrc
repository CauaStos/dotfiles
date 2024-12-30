export ZSH="$HOME/.oh-my-zsh"
export STARSHIP_LOG=error
ZSH_THEME=""

alias zed=zeditor

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

macchina
[ -s "/home/astro/.jabba/jabba.sh" ] && source "/home/astro/.jabba/jabba.sh"
