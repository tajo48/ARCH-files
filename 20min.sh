#!/bin/bash
while :
do
curl -o ~/ARCH-files/weather.txt "https://wttr.in/?format=2" 
sudo pacman -Sy 
sleep 20m
done
