PS1='\[\033[38;5;253m\]\w \[\033[38;5;168m\]>\[\033[0m\] '
export PATH=$HOME/.fukiame/bin:$PATH
export EDITOR=nvim

[ -f "$HOME"/.alice ] && . "$HOME"/.alice

shopt -s autocd
shopt -s checkwinsize

alias vi=nvim
alias ls='ls --color=auto'
