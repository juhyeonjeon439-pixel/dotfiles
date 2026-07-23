#!/bin/bash
echo "Installing dotfiles..."
sudo pacman -S --needed - < packages/pacman.txt
