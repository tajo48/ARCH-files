#!/bin/bash
#[ $(echo -e "No\nYes" | dmenu -i) == "Yes" ] && echo "xd

options="Poweroff\nXstop\nReboot\nUpdate\nPacman\nUinstall\nRefbar\nGopoweroff\nOffgopoweroff"

chosen=$(echo -e "$options" | dmenu -i)

case "$chosen" in
  Xstop) sudo kill -9 $(pgrep -f bar.sh) && sudo kill -9 $(pgrep -f 20min.sh) &&  sudo killall dwm;;
  Poweroff) sudo poweroff;;
  Reboot) sudo reboot;;
  Update) sudo pacman -Suy --noconfirm  ;;
  Pacman) chosen=$(sudo pacman -Qu | awk '{print $1}' | dmenu -i) && sudo pacman -S --noconfirm $chosen ;;
  Uinstall) chosen=$(sudo pacman -Q | awk '{print $1}' | dmenu -i) && sudo pacman -R --noconfirm $chosen ;;
  Gopoweroff) chosen=$(echo -e "10m\n20m\n30m\n1h\n2h\n3h\n8h" | dmenu -i) && sudo sleep $chosen && sudo poweroff ;;
  Offgopoweroff) sudo kill -9 $(pgrep -f off.sh) ;;
  Refbar) sudo kill -9 $(pgrep -f bar.sh) && sudo kill -9 $(pgrep -f 20min.sh) && sudo sh ARCH-files/bar.sh & ;;
esac
