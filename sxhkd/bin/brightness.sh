#!/bin/bash

# You can call this script like this:
# $./brightness.sh up
# $./brightness.sh down

function get_brightness {
	xbacklight -get | cut -d '.' -f 1
}

function send_notification {
    DIR=`dirname "$0"`
    brightness=`get_brightness`
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
	#bar=$(seq -s "─" $(($brightness/5)) | sed 's/[0-9]//g')
	if [ "$volume" = "0" ]; then
			icon_name="notification-display-brightness-off"
	$DIR/notify-send.sh "" -i "$icon_name" -t 2000 -h int:value:"$brightness" -h string:synchronous:"─" --replace=555
		else
		if [  "$brightness" -lt "10" ]; then
			 icon_name="notification-display-brightness-low"
	$DIR/notify-send.sh """     " -i "$icon_name" --replace=555 -t 2000
		else
			if [ "$brightness" -lt "30" ]; then
				icon_name="notification-display-brightness-low"
			else
				if [ "$brightness" -lt "70" ]; then
					icon_name="notification-display-brightness-medium"
				else
					icon_name="notification-display-brightness-full"
				fi
			fi
		fi
	fi
	bar=$(seq -s "─" $(($brightness/3)) | sed 's/[0-9]//g')
	# Send the notification
	$DIR/notify-send.sh """$bar" -i "$icon_name" -t 2000 -h int:value:"$brightness" -h string:synchronous:"$bar" --replace=555
}

case $1 in
    up)
		# Up the brightness (+ 5%)
		xbacklight -inc 5
		send_notification
		;;
    down)
		xbacklight -dec 5
		send_notification
		;;
esac
