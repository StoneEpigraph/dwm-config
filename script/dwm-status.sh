#!/bin/bash

#battery
Battery=$(cat /sys/class/power_supply/BAT1/capacity)%
BatteryStatus=$(cat /sys/class/power_supply/BAT1/status)
if [[ $BatteryStatus == D* ]]; then
    BatteryStatus='NoCharge'
else
    BatteryStatus='Charging'
fi

#volume
Volume=$(amixer get Master | tail -n1 | cut -d '[' -f4 | cut -d ']' -f1)
if [[ $Volume == off ]]; then
    Volume='mute'
else 
    Volume=$(amixer get Master | sed -n '5p' | cut -d '[' -f2 | cut -d% -f1)
fi

#datetime
DateTime=$(date +"%a %m-%d %T")

xsetroot -name "Vol.$Volume|$DateTime|[$BatteryStatus:$Battery]"
