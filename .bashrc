#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#source /usr/share/blesh/ble.sh --noattach

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# aegleseeker start, end = eof
# PS1='[\u@\h \W]\$ '
#PS1='\[\033[38;5;241m\]\w \[\033[38;5;129m\]<\[\033[0m\] '
#PS1='\[\033[38;5;153m\]\w \[\033[38;5;129m\]<\[\033[0m\] '
PS1='\[\033[38;5;60m\]\w \[\033[1m\]\[\033[38;5;75m\]<\[\033[0m\] '

shopt -s autocd
shopt -s checkwinsize
export HISTCONTROL="ignoredups:ignorespace"
export PATH=~/.local/bin:$PATH

[ -f "$HOME"/.fukiame/env ] && . "$HOME"/.fukiame/env
[ -f "$HOME"/.alice ] && . "$HOME"/.alice

alias ns="cd /media/nosec/"
alias PYENV=". ~/.global_pyvenv/bin/activate"
alias hx=helix
#alias vi=nvim
alias vi=helix
alias iws="iwctl station wlan0"
alias iwsc="iwctl station wlan0 connect"
alias iwss="iwctl station wlan0 scan"
alias iwsg="iwctl station wlan0 get-networks"

#[[ ${BLE_VERSION-} ]] && ble-attach
alias stopaudio="systemctl --user stop pipewire wireplumber"
