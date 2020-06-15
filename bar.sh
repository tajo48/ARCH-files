#!/bin/bash
while :
do


for battery in /sys/class/power_supply/BAT?
do
	# Get its remaining capacity and charge status.
	capacity=$(cat "$battery"/capacity) || break
	status=$(sed "s/[Dd]ischarging/-/;s/[Nn]ot charging/NO/;s/[Cc]harging/+/;s/[Uu]nknown/NULL/;s/[Ff]ull/F/" "$battery"/status)
done


status= "$status" "$capacity" "$( date +"%F %R" )"



	xsetroot -name "$(status | tr "/n" " ")"
	sleep 1m
done
