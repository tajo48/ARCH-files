#!/bin/bash
cd /home/tajo48
sudo rm -r ARCH-files ARCH-builds
git clone https://github.com/tajo48/ARCH-files.git
git clone https://github.com/tajo48/ARCH-builds.git

echo done | dmenu


rm -rf ~/.config/nvim ~/.zshrc ~/.config/coc
cp ~/ARCH-files/zshrc ~/.zshrc
mkdir ~/.config/nvim
cp ~/ARCH-files/init.vim ~/.config/nvim
