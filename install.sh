#!/usr/bin/env bash

set -o errexit
set -o nounset

readonly dir=~/.dotfiles # dotfiles directory

# list of files/folders to symlink in homedir
files="zshrc slate"

readonly bkp_dir=~/dotfiles_old       # old dotfiles backup directory
echo "Creating $bkp_dir folder for backup of any existing dotfiles in home"
mkdir -p $bkp_dir

function symlink_files() {
  local source=$1
  local files=$2
  local backup=$3/
  # move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
  echo "=== Symlinking all of these dotfiles ==="
  echo $files
  echo "=== ==="
  for file in $files; do
      mv ~/.$file "$backup" || true
      ln -s $source/$file ~/.$file
  done
}

# Install common dotfiles
symlink_files $dir "$files" $bkp_dir

function zsh-as-default() {
  if grep -Fxq "$(which zsh)" /etc/shells
  then
    echo "ZSH ok"
  else
    echo "Warning: remember to change shell"
    echo "echo \$(which zsh) | sudo tee -a /etc/shells"
    echo "chsh -s \$(which zsh)"
    echo "Remember to logout and login again"
  fi
}

function oh-my-zsh-install() {
  local ZSH="$HOME/.oh-my-zsh"
  if [[ ! -d $ZSH ]]; then
    echo "Installing oh-my-zsh..."
    git clone https://github.com/robbyrussell/oh-my-zsh.git $ZSH
  else
    echo "Upgrading oh-my-zsh..."
    env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
  fi
}
oh-my-zsh-install

function zsh-as-default() {
  if grep -Fxq "$(which zsh)" /etc/shells
  then
    echo "ZSH ok"
  else
    echo "Warning: remember to change shell"
    echo "echo \$(which zsh) | sudo tee -a /etc/shells"
    echo "chsh -s \$(which zsh)"
    echo "Remember to logout and login again"
  fi
}
zsh-as-default