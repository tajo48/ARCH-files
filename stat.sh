#!/bin/bash

statusbat="|"



if test -r /sys/class/power_supply/BAT0/capacity;
then
    for battery in /sys/class/power_supply/BAT?
    do
    capacity=$(cat "$battery"/capacity) || break
    bstatus=$(sed "s/[Dd]ischarging/-/;s/[Nn]ot charging/NO/;s/[Cc]harging/+/;s/[Uu]nknown/NULL/;s/[Ff]ull/F/" "$battery"/status)

statusbat="|"$capacity$bstatus$statusbat
done
fi

usedmem="$(vmstat -s | grep "used memory" | awk '{print $1}' )"
allmem="$(vmstat -s | grep "total memory" | awk '{print $1}' )"
mem="$( calc "$(echo $usedmem)" / "$(echo $allmem)" *100 | tr "~" " " | tr "." " " | awk '{print $1}' )"


status=$mem"%"$statusbat"$(date +"%F %R" )""|""$(pacman -Qu | wc -l)"" of ""$(pacman -Q | wc -l)"

echo $status

