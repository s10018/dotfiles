#!/bin/sh

curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/local/etc/zsh/antigen.zsh
source ~/local/etc/zsh/antigen.zsh
antigen bundle sorin-ionescu/prezto

ln -sfn ~/.antigen/repos/.zprezto ~/.zprezto
ln -sfn ~/.zprezto/runcoms/zpreztorc ~/.zpreztorc
