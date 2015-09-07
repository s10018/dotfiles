# -*- mode: sh -*-

# anyenv

if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    for D in $(ls $HOME/.anyenv/envs)
    do
        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
        if [ $D = "pyenv" ]; then
           eval "$(pyenv virtualenv-init -)"
        fi
        if [ $D = "ndenv" ]; then
           eval "$(ndenv init)"
        fi
    done
fi

if [ ! -d $(anyenv root)/plugins ] ; then
    mkdir -p $(anyenv root)/plugins
fi

if [ ! -d $(anyenv root)/plugins/anyenv-update ]; then
    git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
fi
