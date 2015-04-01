
# anyenv
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    for D in $(ls $HOME/.anyenv/envs)
    do
        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
    done
fi

# ## rbenv setting
# eval "$(rbenv init - zsh)"

# ## pyenv setting
# if [ -d /usr/local/opt/pyenv ]; then
#     export PYENV_ROOT=/usr/local/opt/pyenv
# else
#     export PYENV_ROOT="${HOME}/.pyenv"
# fi
# if [ -d "${PYENV_ROOT}" ]; then
#     export PATH=${PYENV_ROOT}/bin:$PATH
#     eval "$(pyenv init -)"
#     eval "$(pyenv virtualenv-init -)"
#     export PATH=${PYENV_ROOT}/shims:$PATH
# fi

# ## plenv setting
# export PATH="$HOME/.plenv/shims:$PATH"
# if which plenv > /dev/null;then
#     eval "$(plenv init -)"; 
# fi

# # nvm setting
# test -f "$HOME/.nvm/nvm.sh" && . "$HOME/.nvm/nvm.sh"

# # go setting
# export PATH=$PATH:/usr/local/opt/go/libexec/bin
