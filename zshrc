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
alias gita="git add -A && git commit -m 'update' && git push"
alias gitset="git config --global user.email 'tajo161626@gmail.com' && git config --global user.name 'tajo48'"
alias gitstore="git config --global credential.helper store"
alias wifi="sudo wifi-menu"
# Config for prompt. PS1 synonym.
prompt='%2/ $(git_branch_name) > '
