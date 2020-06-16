#!/bin/bash
while :
do
statusbat=" "



if test -r /sys/class/power_supply/BAT0/capacity;
then
    for battery in /sys/class/power_supply/BAT?
    do
    capacity=$(cat "$battery"/capacity) || break
    bstatus=$(sed "s/[Dd]ischarging/-/;s/[Nn]ot charging/NO/;s/[Cc]harging/+/;s/[Uu]nknown/NULL/;s/[Ff]ull/F/" "$battery"/status)

statusbat=$statusbat$capacity$bstatus" "
done
fi


sudo pacman -Sy

status=$statusbat"$(date +"%F %R" )"" ""$(pacman -Qu | wc -l)"



   xsetroot -name "$(echo $status | tr "/n" " ")"
    sleep 20s
done
