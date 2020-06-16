#!/bin/bash
while :
do




if test -r /sys/class/power_supply/BAT0/capacity;
then
    for battery in /sys/class/power_supply/BAT?
    do
    capacity=$(cat "$battery"/capacity) || break
    bstatus=$(sed "s/[Dd]ischarging/-/;s/[Nn]ot charging/NO/;s/[Cc]harging/+/;s/[Uu]nknown/NULL/;s/[Ff]ull/F/" "$battery"/status)

statusbat= "$(echo $statusbat)"  "$(echo $capacity)" "$(echo $bstatus)"
done
fi




status=$statusbat"$(date +"%F %R" )"



   xsetroot -name "$(echo $status | tr "/n" " ")"
    sleep 30s
done
