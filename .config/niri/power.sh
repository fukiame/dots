#!/usr/bin/bash

e="$(echo 'poweroff
reboot
screenoff
logoff
lock
suspend
hibernate' | fuzzel -da left --auto-select --match-mode=exact)"

case "$e" in
	poweroff)
		poweroff
		;;
	reboot)
		reboot
		;;
	logoff)
		niri msg action quit
		;;
	suspend)
		systemctl suspend
		;;
	hibernate)
		systemctl hibernate
		;;
	lock)
		swaylock -f
		;;
	screenoff)
		sh ~/.config/sway/screenoff.sh
		;;
	*)
		:
		;;
esac
