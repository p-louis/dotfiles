#!/bin/bash

fileList=".offlineimaprc .notmuch-config .msmtprc .zshrc .bashrc"
configDirs="nvim bspwm sxhkd polybar alot"
basepath="$HOME/dotfiles/"

for file in $fileList; do
  if [ -e $basepath/$file ]; then
    ln -s "$basepath/$file" "$HOME/$file" || true
  fi
done

for folder in $configDirs; do
  if [ -e $basepath/$folder ]; then
    ln -s "$basepath/$folder" "$HOME/.config/$folder" || true
  fi
done
