#!/bin/sh

. "$ZPLUG_HOME/init.zsh"

zplug "sorin-ionescu/prezto"

# if [ ! -f "$HOME/.zprezto" ]; then
#     ln -s "$HOME/.zplug/repos/sorin-ionescu/prezto" "$HOME/.zprezto"
# fi

zplug "mollifier/anyframe"
fpath=($ZPLUG_REPOS/mollifier/anyframe $fpath)
autoload -Uz anyframe-init
anyframe-init
