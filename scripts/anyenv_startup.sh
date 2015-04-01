#!/bin/sh

git clone https://github.com/riywo/anyenv ~/.anyenv

anyenv install rbenv
anyenv install pybenv
anyenv install plenv

mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.anyenv/envs/pyenv/plugins/pyenv-virtualenv
