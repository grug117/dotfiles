~!/usr/bin/env bash

INTERNAL="eDP-1"

case "$1" in
	close)
		# count monitors
		COUNT=$(hyprctl monitors -j | jq length)

		if [ "$COUNT" -gt 1 ]; then
			hyprctl keyword monitor "$INTERNAL, disable"
		fi
		;;
	open)
		hyprctl keyword monitor "$INTERNAL, preferred, auto, 1"
		;;
esac
