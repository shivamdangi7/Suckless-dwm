#!/bin/sh

## CPU
cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "  $cpu%"
}

## RAM
mem() {
  mem="$(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
  echo -e " $mem"
}


## DISK
hdd() {
  hdd="$(df -h | awk 'NR==12{print $4, $5}')"
  echo -e " $hdd"
}

## TEMP
temp() {
TEMP="$(sensors|awk 'BEGIN{i=0;t=0;b=0}/id [0-9]/{b=$4};/Core/{++i;t+=$3}END{if(i>0){printf("%0.1f\n",t/i)}else{sub(/[^0-9.]/,"",b);print b}}')"
echo -e  " $TEMP "
}

## BATT
power() {
#Old Script
#PWR=$(cat /sys/class/power_supply/BAT0/capacity)
#echo -e "  $PWR%"

STATUS=$(cat /sys/class/power_supply/BAT0/status)
BATT=$(cat /sys/class/power_supply/BAT0/capacity)
if [ "$STATUS" = "Discharging" ]; then
    ICON="󱊢"
else
    ICON="⚡"
fi
echo " $ICON" "$BATT%"
}

## VOL
#volume() {
#VOL="$(pamixer --get-volume)"
#echo -e "$VOL%"
#}

## DATE
clock() {
dte="$(date +"%a %d/%b %I:%M %p"| sed 's/  / /g')"
echo -e "$dte "
}
net(){
~/.local/bin/nettraf
}
vol(){
~/.local/bin/volume
}
while true; do

#xsetroot -name "|   $(cpu) |   $(mem) | $(hdd) |  $(power) |  $(temp) | $  (volume) | $(date) |"
	/usr/bin/xsetroot -name "[ $(net) |  $(cpu) |  $(mem) ][ $(power) | $(vol) | $(clock)]"
sleep 5s

done &

# $(temp)C
#   $(volume) 


## VOL
#volume() {
#VOL="$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))"
#echo -e "$VOL"
#}


#while true; do
# /usr/bin/xsetroot -name "$(date '+%d/%b %I:%M %p')"
#  sleep 60  # Update every minute (you can adjust the interval if needed)
#done &


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

