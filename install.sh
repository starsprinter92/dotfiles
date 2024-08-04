#!/bin/sh
echo "==> Installing required packages [Brew is required]"
brew install kitty
brew install spicetify
brew install svim
brew install skhd
brew install sf-mono
brew install sf-icons
brew install font-sf-pro
brew install sketchybar
brew install yabai
brew install borders
brew install neovim
brew install fish
brew install btop
echo "==> Cloning the repository..."
git clone https://github.com/starsprinter92/dotfiles
cd dotfiles
echo "==> Installing dotfiles..."
mv ~/.config ~/.config.old
cp -r config/* ~/.config
