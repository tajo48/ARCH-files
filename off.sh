#!/bin/bash
#[ $(echo -e "No\nYes" | dmenu -i) == "Yes" ] && echo "xd

options="logout\npoweroff\nreboot"

chosen=$(echo -e "$options" | dmenu -i)

case "$chosen" in
  logout) sudo kill -9 $(pgrep -f bar.sh) && sudo killall dwm && exit;;
  poweroff) sudo poweroff;;
  reboot) sudo reboot;;
esac
