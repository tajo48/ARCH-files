#!/bin/bash
#[ $(echo -e "No\nYes" | dmenu -i) == "Yes" ] && echo "xd

options="poweroff\nxstop\nreboot\nupdate\nupdatelist"

chosen=$(echo -e "$options" | dmenu -i)

case "$chosen" in
  xstop) sudo kill -9 $(pgrep -f bar.sh) && sudo killall dwm;;
  poweroff) sudo poweroff;;
  reboot) sudo reboot;;
  update) sudo pacman -Suy --noconfirm  ;;
  updatelist) chosen=$(sudo pacman -Qu | dmenu -i) && sudo pacman -Su --noconfirm $chosen ;;

esac
