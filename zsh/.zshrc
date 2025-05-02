# Fastfetch terminal, except neovim
if [[ -z "$NVIM_LOG_FILE" ]]; then
  fastfetch
fi

# Powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Oh-my-zsh plugins
plugins=( git zsh-256color zsh-autosuggestions zsh-syntax-highlighting aws )
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Set default text editor
export EDITOR="nvim"
export VISUAL="nvim"

# Fastfetch on fclear
alias fclear="clear; fastfetch"

# Ventoy alias
alias ventoy="~/ventoy/VentoyGUI.x86_64"

# Vial alias
alias vial="~/Workspace/keyboard/Vial.AppImage"
