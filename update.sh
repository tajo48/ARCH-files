#!/bin/bash
cd /home/tajo48
sudo rm -r ARCH-files ARCH-builds
git clone https://github.com/tajo48/ARCH-files.git
git clone https://github.com/tajo48/ARCH-builds.git
sh /home/tajo48/ARCH-files/off.sh
