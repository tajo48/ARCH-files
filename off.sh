#!/bin/bash
#[ $(echo -e "No\nYes" | dmenu -i) == "Yes" ] && echo "xd

options="Operation\nPacman\nSsh"
chosen=$(echo -e "$options" | dmenu -i)

case "$chosen" in
  Operation) options="Poweroff\nXstop\nRefbar\nUpgradefiles" && chosen=$(echo -e "$options" | dmenu -i);;
  Pacman) options="Update\nInstall\nUinstall" && chosen=$(echo -e "$options" | dmenu -i);;
  Ssh) options="Killssh\nStartssh\nDisablessh\nEnablessh" && chosen=$(echo -e "$options" | dmenu -i);;
esac


case "$chosen" in
  Xstop) sudo kill -9 $(pgrep -f bar.sh) && sudo kill -9 $(pgrep -f min.sh) &&  sudo killall dwm;;
  Update) sudo pacman -Suy --noconfirm  ;;
  Install) update=" "$(pacman -Qu | awk '{print $1}') && update=$(echo -e "\n*"$update |  sed 's/ /\n*/g') && install=$(sudo pacman -Ss | grep "^[A-Za-z]" | tr "/" " " | awk '{ print $2}' ) && chosen=$(echo -e $install$update | tr " " "\n" | dmenu -i ) && chosen=$(echo $chosen | tr "\n*" " ") && sudo pacman -S --noconfirm $chosen | dmenu ;;
  Uinstall) chosen=$(sudo pacman -Q | awk '{print $1}' | dmenu -i) && sudo pacman -R --noconfirm $chosen ;;
  Poweroff) chosen=$(echo -e "now\n-r now" | dmenu -i) && sudo shutdown $chosen ;;
  Refbar) sudo kill -9 $(pgrep -f bar.sh) && sudo kill -9 $(pgrep -f min.sh) && sudo sh ARCH-files/bar.sh & ;;
  Killssh) sudo systemctl stop sshd;;
  Startssh) sudo systemctl start sshd;;
  Disablessh) sudo systemctl disable sshd;;
  Enablessh) sudo systemctl enable sshd;;
  Upgradefiles) sudo sh ARCH-files/upgradefiles.sh;;
esac
