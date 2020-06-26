#!/bin/bash
sh /home/tajo48/ARCH-files/20min.sh &
while :
do
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

usedmem="$(vmstat -s | grep "used memory" | awk '{print $1}')"
allmem="$(cat /proc/meminfo | grep "MemTotal" | awk '{print $2}')"
mem="$( calc "$(echo $allmem)" / "$(echo $usedemem)" *100 | tr "~" " " | tr "." " " | awk '{print $1}' )"


status=$mem"%"$statusbat"$(date +"%F %R" )""|""$(pacman -Qu | wc -l)"" of ""$(pacman -Q | wc -l)"



   xsetroot -name "$(echo $status | tr "/n" " ")"
    sleep 10s
done
