#!/bin/bash

cp -r "$HOME/.config/alacritty" "$HOME/repos/dotfiles/"
cp -r "$HOME/.config/dunst" "$HOME/repos/dotfiles/"
cp -r "$HOME/.config/fastfetch" "$HOME/repos/dotfiles/"
cp -r "$HOME/.config/gtk-3.0" "$HOME/repos/dotfiles/"
cp -r "$HOME/.config/i3" "$HOME/repos/dotfiles/"
cp -r "$HOME/.config/nvim" "$HOME/repos/dotfiles/"
cp -r "$HOME/.config/polybar" "$HOME/repos/dotfiles/"
cp -r "$HOME/.config/rofi" "$HOME/repos/dotfiles/"
cp -r "$HOME/scripts" "$HOME/repos/dotfiles/scripts/"

mkdir -p "$HOME/repos/dotfiles/git"
cp "$HOME/.gitconfig" "$HOME/repos/dotfiles/git/"

mkdir -p "$HOME/repos/dotfiles/zsh"
cp "$HOME/.zshrc" "$HOME/repos/dotfiles/zsh/"
