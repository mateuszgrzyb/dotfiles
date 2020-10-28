#
# ~/.bash_profile
#

emulate sh -c 'source /etc/profile'

[[ -f ~/.zshrc ]] && . ~/.zshrc

[[ $(tty) == "/dev/tty1" && $UID -ne 0 ]] && startx
