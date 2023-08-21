#!/bin/bash

# options to be displayed
option0="area"
option1="cliparea"
option2="screen"
option3="window"

# options to be displyed
options="$option0\n$option1\n$option2\n$option3"

selected="$(echo -e "$options" | rofi -lines 4 -dmenu -p "scrot")"
case $selected in
    $option0)
        cd ~/Pictures/scrots/ && scrot -s;;
    $option1)
	   timestamp=$(date +%s) && scrot -s "/home/sdangi/Pictures/scrots/${timestamp}.png" && xclip -selection clipboard -t image/png -i "/home/sdangi/Pictures/scrots/${timestamp}.png";;
    $option2)
        cd ~/Pictures/scrots/ && sleep 1 && scrot;;
    $option3)
        cd ~/Pictures/scrots/ && sleep 1 && scrot -u;;
esac
