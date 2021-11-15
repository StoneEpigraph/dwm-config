#!/bin/bash

#battery
Battery=$(cat /sys/class/power_supply/BAT1/capacity)%
BatteryStatus=$(cat /sys/class/power_supply/BAT1/status)
if [[ $BatteryStatus == D* ]]; then
    BatteryStatus=''
else
    BatteryStatus=''
fi

#volume
VolumeStatus=''
Volume=$(amixer get Master | tail -n1 | cut -d '[' -f4 | cut -d ']' -f1)
if [[ $Volume == off ]]; then
    VolumeStatus='婢'
    Volume='mute'
else 
    VolumeStatus=''
    Volume=$(amixer get Master | sed -n '5p' | cut -d '[' -f2 | cut -d% -f1)
fi

#datetime
DateTime=$(date +"%a %m-%d %T")

xsetroot -name " $VolumeStatus$Volume% 﨟$DateTime $BatteryStatus:$Battery"
