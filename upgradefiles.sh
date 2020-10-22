#!/bin/bash
cd /home/tajo48
sudo rm -r ARCH-files ARCH-builds ARCH-linux-install-script
git clone https://github.com/tajo48/ARCH-files.git

git clone https://github.com/tajo48/ARCH-builds.git
git clone https://github.com/tajo48/ARCH-linux-install-script.git
echo done | dmenu


rm -rf ~/.config/nvim ~/.zshrc ~/.config/coc
cp ~/ARCH-files/zshrc ~/.zshrc
mkdir ~/.config/nvim
cp ~/ARCH-files/init.vim ~/.config/nvim
