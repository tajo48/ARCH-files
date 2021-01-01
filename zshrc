# ~/.zshrc
# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '- ('$branch')'
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst
alias v="nvim"
alias mc="/usr/lib/jvm/java-8-openjdk/bin/java -jar Downloads/ShiginimaSE_v4400/linux_osx/Shiginima\ Launcher\ SE.v4400.jar"
alias x="startx"
alias p="ping google.com"
alias u="sh ARCH-files/upgradefiles.sh"
alias gita="git add -A && git commit -m 'update' && git push"
alias pacre="sudo rm /var/lib/pacman/db.lck"
alias gitset="git config --global user.email 'tajo161626@gmail.com' && git config --global user.name 'tajo48'"
alias gitstore="git config --global credential.helper store"
alias BTW="neofetch"
alias btw="neofetch"

alias wifi="sudo wifi-menu"
# Config for prompt. PS1 synonym.
prompt='%2/ $(git_branch_name) > '



alias arch-install="cd ~/ && curl -o install.sh https://raw.githubusercontent.com/tajo48/ARCH-linux-install-script/bios/install.sh && sudo sh install.sh"
#alias arch-install-pen="cd ~/ && curl -o install.sh https://raw.githubusercontent.com/tajo48/ARCH-linux-install-script/bios/install.sh && sudo sh install.sh pen"
