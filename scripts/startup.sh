#!/bin/sh


mkdir -p ~/local/etc/

./scripts/link_files.sh

wget https://raw.githubusercontent.com/glidenote/rpbcopy/master/pbcopy.plist -O ~/Library/LaunchAgents/pbcopy.plist

./scripts/brew_startup.sh
./scripts/zsh_startup.sh
./scripts/anyenv_startup.sh
./scripts/emacs_startup.sh
