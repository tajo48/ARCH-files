#!/bin/bash
#[ $(echo -e "No\nYes" | dmenu -i) == "Yes" ] && echo "xd

options="Poweroff\nXstop\nReboot\nUpdate\nPacman"

chosen=$(echo -e "$options" | dmenu -i)

case "$chosen" in
  Xstop) sudo kill -9 $(pgrep -f bar.sh) && sudo killall dwm;;
  Poweroff) sudo poweroff;;
  Reboot) sudo reboot;;
  Update) sudo pacman -Suy --noconfirm  ;;
  Pacman) chosen=$(sudo pacman -Qu | awk '{print $1}' | dmenu -i) && sudo pacman -S --noconfirm $chosen ;;

esac
