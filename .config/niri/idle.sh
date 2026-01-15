#!/usr/bin/bash

if [ -z "$1" ]; then

e="$(echo 'default 6 9 27
ext30_T30 9 12 30
nosleep60_P60 12 15 600
nolocksleep60_P60 12 600 600
wake 600 x 3
pkill
offnow' | fuzzel -da left --auto-select --match-mode=exact)"

case "$e" in
	'default'*)        tOff=60
		                 tLock=90
		                 tSuspend=270
	;;
	'ext30'*)          tOff=90
		                 tLock=120
		                 tSuspend=300
	;;
	'nosleep60'*)      tOff=120
		                 tLock=150
		                 tSuspend=6000
	;;
	'nolocksleep60'*)  tOff=120
		                 tLock=6000
		                 tSuspend=6000
	;;
	'wake'*)           tOff=6000
		                 tLock=6000
		                 tSuspend=6000
	;;
	offnow)
		sh ~/.config/sway/screenoff.sh
		exit 0 ;;
	pkill)
	  pkill -f swayidle
	  sleep 0.1
	  [ "$(ps -Ao args=cmd | rg swayidle | wc -l)" == "1" ] && notify-send -a "swayidle switch" "killed, probably"
	  exit 0 ;;
	*) : ;;
esac

else
	tOff=60
	tLock=90
	tSuspend=270
fi

[ -n "$tOff" ] && {
	pkill -f swayidle
	swayidle -w \
         timeout "$tOff" 'niri msg action power-off-monitors' \
         timeout "$tLock" 'swaylock -f' \
         timeout "$tSuspend" 'systemctl suspend' \
         before-sleep 'swaylock -f' &
	if [ -z "$1" ] ; then
	notify-send -a "swayidle switch" "maybe succeed" "$(ps -Ao args=cmd | rg swayidle -m1 | sed 's/timeout /\n/g' |sed 's/before-sleep/\nbefore-sleep/g' | rg -v 'swayidle')"
	fi
}
