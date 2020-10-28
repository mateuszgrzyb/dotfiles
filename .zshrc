# Zoomer Shell
# Zoomer Shell
# Zoomer Shell

# Enable colors and change prompt:
autoload -U colors && colors
export EDITOR="nvim"
#export PDF_READER="zathura"
#export SXHKD_SHELL='/bin/sh'

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# interactive comments because why not
setopt interactivecomments

# type dir file to cd
setopt autocd

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char


# Load zsh configuration files

ZSH_CONFIGS="$HOME/.config/zsh"

source "$ZSH_CONFIGS/aliasrc"
source "$ZSH_CONFIGS/pathrc"
source "$ZSH_CONFIGS/newpromptrc"
source "$ZSH_CONFIGS/bindrc"

# Load plugins

ZSH_PLUGINS="$ZSH_CONFIGS/plugins"

source "$ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZSH_PLUGINS/zsh-vimode-visual/zsh-vimode-visual.zsh"

# auto ls on cd
autoload -U add-zsh-hook
add-zsh-hook -Uz chpwd () { l; }

# start with listed files, but not in vscode
[[ $TERM_PROGRAM == "vscode" ]] || l

