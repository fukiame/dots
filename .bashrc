source ~/.fukiame/env
source ~/.alice.sh

kbuild() {
    [ -n "$1" ] && {
        prev_oldpwd="$OLDPWD"
        cd ~/kernel_builder
        gh workflow run --ref="$1" "$2"
        cd -
	export OLDPWD="$prev_oldpwd"
    }
}

alias prism="kbuild prism main.yml"
alias Mprism="kbuild prism"
alias bagel="kbuild bullhead legacy.yml"
alias Dbagel="kbuild bullhead"
alias serenity="kbuild serenity main.yml"
alias mserenity="kbuild serenity"
alias enanan="kbuild enanan main.yml"
alias ena="kbuild enanan main.yml"
alias Mena="kbuild enanan"

#alias aster="kbuild aster main.yml"
#alias Master="kbuild aster"
alias strahv="kbuild strahv main.yml"
alias Mstrahv="kbuild strahv"

alias snowloop="kbuild snowloop legacy.yml"

alias fleur="kbuild fleur main.yml"

alias RE="make LD=ld.lld CC=clang"

export LD=ld.lld
export CC=clang

export PATH=$HOME/.local/bin:$HOME/.cargo/bin/:$PATH
#eval "$(register-python-argcomplete pmbootstrap)"
export NVIM_LOG_FILE="/dev/null"

alias DE="RE thyme_defconfig && RE nconfig && RE savedefconfig && cp defconfig arch/arm64/configs/thyme_defconfig"
alias sear="RE selene_defconfig && RE nconfig && RE savedefconfig && cp defconfig arch/arm64/configs/selene_defconfig"
alias bhai="RE blossom_defconfig && RE nconfig && RE savedefconfig && cp defconfig arch/arm64/configs/blossom_defconfig"
alias gc="git add arch && git ac && git ca"
alias hcpatch="hpatch CHERRY_PICK_HEAD"

alias al='sudo ~/al.sh'
alias cm='sudo ~/cm.sh'

HIST_SIZE=4000

export EDITOR=nvim
alias vi=nvim
alias chop="sudo oneshot -i wlan0 -K --iface-down"

alias lsx='termux-x11 :1 -xstartup "dbus-launch --exit-with-session xfce4-session"'

PS1='\[\033[38;5;245m\]\w \[\033[38;5;135m\]< \[\033[0m\]'
