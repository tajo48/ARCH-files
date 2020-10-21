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


setxkbmap -layout 'pl'
xset r rate 300 50
setxkbmap -option caps:swapescape


weather="$(curl https://wttr.in/?format=3)"


usedmem="$(vmstat -s | grep "used memory" | awk '{print $1}' )"
allmem="$(vmstat -s | grep "total memory" | awk '{print $1}' )"
mem="$( calc "$(echo $usedmem)" / "$(echo $allmem)" *100 | tr "~" " " | tr "." " " | awk '{print $1}' )"


status="|"$mem"%"$statusbat"$(date +"%F %R" )""|""$(pacman -Qu | wc -l)"" of ""$(pacman -Q | wc -l)"
status="$(echo $status | tr "/n" " ")"


xsetroot -name "$(echo $weather$status)"
sleep 10s
done
