#!/bin/sh

./brew/cask.sh brewfile

sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s /usr/local/bin/zsh
