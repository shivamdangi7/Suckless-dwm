#!/bin/sh

#cd ~/.local/bin/
#./newdwmlook


sleep 3 && wall=$(find ~/.local/share/wallhaven -type f -iname "*.jpg" -o -iname "*.png" | shuf -n 1 )
/usr/bin/feh --bg-fill $wall 2>/tmp/feh_error.log
~/.local/bin/wal -i $wall >/dev/null 2>/tmp/wal_error.log

/usr/bin/picom

while true; do
 /usr/bin/xsetroot -name "$(date '+%d/%b %I:%M %p')"
  sleep 60  # Update every minute (you can adjust the interval if needed)
done &


#sleep 2s
#wal -c
#sleep 2s
#wal -i $wall
#source ~/.cache/wal/colors.sh


#while true; do
#sleep 5
#/usr/bin/xsetroot -name "$(date '+%d/%b %I:%M %p')" 2>/tmp/xsetroot_error.log
#
#	sleep 1m 
#	#wait for 1minute
#done &
#

