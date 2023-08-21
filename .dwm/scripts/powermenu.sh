#!/bin/bash

# options to be displayed
option0=" lock"
option1=" logout"
option2=" suspend"
option3=" 1 scheduled suspend (10min)"
option4=" 2 scheduled suspend (20min)"
option5=" 3 scheduled suspend (30min)"
option6=" reboot"
option7=" shutdown"

dwm=$( ps -o pid,cmd ax | awk '/dwm/{ if ($2 == "dwm") print $1 }' )

# options passed into variable
options="$option0\n$option1\n$option2\n$option3\n$option4\n$option5\n$option6\n$option7"

chosen="$(echo -e "$options" | rofi -lines 8 -dmenu -p "power")"
case $chosen in
    $option0)
        xsecurelock;;
    $option1)
         [[ ! -z "$dwm" ]] && kill -s TERM $dwm
         ;;
    $option2)
        systemctl suspend;;
	$option3)
		sleep 600 && systemctl suspend;;
	$option4)
		sleep 1200 && systemctl suspend;;
	$option5)
		sleep 1800 && systemctl suspend;;
    $option6)
        systemctl reboot;;
	$option7)
        systemctl poweroff;;
esac
