clipmenud &
wal -i /home/tajo48/ARCH-files/photos
	
setxkbmap -layout 'pl'
cd /home/tajo48/ARCH-builds/st
sudo make clean install
cd /home/tajo48/ARCH-builds/dmenu
sudo make clean install
cd /home/tajo48/ARCH-builds/dwm
sudo make clean install
#exec xcompmgr -c &
sudo sh /home/tajo48/ARCH-files/bar.sh &
cd /home/tajo48
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
#ssh-agent dwm
exec dwm
clipmenud
