#!/bin/sh

# Homebrew Install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# still zsh not installed, so write brew setting to bash setting
echo 'export PATH=/usr/local/bin:$PATH' >> .bash_profile
source .bash_profile

brew update

brew tap Homebrew/brewdler
brew brewdle

sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s /usr/local/bin/zsh
