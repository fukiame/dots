#!/bin/sh
# SPDX-License-Identifier: AGPL-3.0-only
# Copyright 2022 Sxmo Contributors
# title="$icon_cam Screenshot All"
# scrot refuses to work with double quotes
# shellcheck disable=SC2016


exit_msg() {
	printf "%s\n" "$1" > /dev/stderr
	notify-send "$1"
	exit 1
}

check_command() {
	command -v "$1" > /dev/null
}

wayland_screenshot() {
	check_command grim || exit_msg "grim command must be available to take a screenshot."

	grim "$1" || exit_msg "Screenshot failed"
}

xorg_screenshot() {
	check_command scrot || exit_msg "scrot command must be available to take a screenshot"

	scrot -d 1 -q 1 -s "$1"
}

screenshot() {
	case "$SXMO_WM" in
		sway|river)
			wayland_screenshot "$@"
			;;
		dwm)
			xorg_screenshot "$@"
			;;
		*)
			exit_msg "We dont know the WM, cannot screenshot."
			;;
	esac
}

yank() {
	printf %s "$1" | case "$SXMO_WM" in
		sway|river)
			wl-copy
			;;
		dwm)
			xsel -b -i
			;;
		*)
			exit_msg "We dont know the WM, cannot yank."
			;;
	esac
}

SXMO_SCREENSHOT_DIR="${SXMO_SCREENSHOT_DIR:-$HOME/screenshots}"
mkdir -p "$SXMO_SCREENSHOT_DIR"
FILENAME="$SXMO_SCREENSHOT_DIR/$(date +%Y-%m-%d-%T).png"

screenshot "$FILENAME"
yank "$FILENAME"
printf %s "$FILENAME"

notify-send --urgency=low "Screenshot taken" "$FILENAME"
