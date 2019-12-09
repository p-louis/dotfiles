#!/bin/bash

fileList=".offlineimaprc .offlineimap.py .notmuch-config .msmtprc .zshrc .bashrc"
configDirs="nvim bspwm sxhkd polybar alot afew"
basepath="$HOME/dotfiles"

for file in $fileList; do
  if [ -e "$basepath/$file" ] && [ ! -e "$HOME/$file" ]; then
    ln -s "$basepath/$file" "$HOME/$file" || true
  fi
done

for folder in $configDirs; do
  if [ -e "$basepath/$folder" ] && [ ! -e "$HOME/.config/$folder" ]; then
    ln -s "$basepath/$folder" "$HOME/.config/$folder" || true
  fi
done
