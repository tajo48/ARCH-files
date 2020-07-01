#!/bin/bash
#[ $(echo -e "No\nYes" | dmenu -i) == "Yes" ] && echo "xd

options="Poweroff\nPacman\nSsh"
chosen=$(echo -e "$options" | dmenu -i)

case "$chosen" in
  Poweroff) options="Poweroff\nXstop\nReboot\nRefbar\nGopoweroff\nOffgopoweroff" && chosen=$(echo -e "$options" | dmenu -i);;
  Pacman) options="Update\nPacman\nUinstall" && chosen=$(echo -e "$options" | dmenu -i);;
  Ssh) options="Killssh\nStartssh\nDisablessh\nEnablessh" && chosen=$(echo -e "$options" | dmenu -i);;
esac


case "$chosen" in
  Xstop) sudo kill -9 $(pgrep -f bar.sh) && sudo kill -9 $(pgrep -f 20min.sh) &&  sudo killall dwm;;
  Poweroff) sudo poweroff;;
  Reboot) sudo reboot;;
  Update) sudo pacman -Suy --noconfirm  ;;
  Pacman) update=" "$(pacman -Qu | awk '{print $1}') && update=$(echo -e "\n*"$update |  sed 's/ /\n*/g') && install=$(sudo pacman -Ss | grep "^[A-Za-z]" | tr "/" " " | awk '{ print $2}' ) && chosen=$(echo -e $install$update | tr " " "\n" | dmenu -i ) && chosen=$(echo $chosen | tr "\n*" " ") && sudo pacman -S --noconfirm $chosen ;;
  Uinstall) chosen=$(sudo pacman -Q | awk '{print $1}' | dmenu -i) && sudo pacman -R --noconfirm $chosen ;;
  Gopoweroff) chosen=$(echo -e "10m\n20m\n30m\n1h\n2h\n3h\n8h" | dmenu -i) && sudo sleep $chosen && sudo poweroff ;;
  Offgopoweroff) sudo kill -9 $(pgrep -f off.sh) ;;
  Refbar) sudo kill -9 $(pgrep -f bar.sh) && sudo kill -9 $(pgrep -f 20min.sh) && sudo sh ARCH-files/bar.sh & ;;
  Killssh) sudo systemctl stop sshd;;
  Startssh) sudo systemctl start sshd;;
  Disablessh) sudo systemctl disable sshd;;
  Enablessh) sudo systemctl enalbe sshd;;
esac
