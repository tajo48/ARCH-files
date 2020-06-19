#!/bin/bash
#[ $(echo -e "No\nYes" | dmenu -i) == "Yes" ] && echo "xd

options="xstop\npoweroff\nreboot"

chosen=$(echo -e "$options" | dmenu -i)

case "$chosen" in
  xstop) sudo kill -9 $(pgrep -f bar.sh) && sudo killall dwm;;
  poweroff) sudo poweroff;;
  reboot) sudo reboot;;
esac
