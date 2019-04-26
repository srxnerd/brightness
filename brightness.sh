#!/bin/bash 

if [ $EUID != 0 ];then
	zenity --error --text="Permission denied.Run script as root." --width=400
	exit 1
fi

MAX_VALUE=$(cat /sys/class/backlight/*/max_brightness)

DEFAULT=$(cat /sys/class/backlight/*/brightness)

NEW_BRIGHTNESS=$(zenity --scale --title="Brightness" --text="Change your screen brightness" --value=$DEFAULT --min-value=0 --max-value=$MAX_VALUE --step=5 --width=700)

echo $NEW_BRIGHTNESS > /sys/class/backlight/*/brightness
