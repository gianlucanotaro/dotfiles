#!/bin/bash
while true
do
	sleep 5
	battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
	if [ $battery_level -le 20 ]
	then
    	notify-send "Battery low" "Battery level is ${battery_level}%!"
	fi
done
