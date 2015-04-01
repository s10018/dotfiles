
## history setting
setopt append_history
setopt hist_ignore_dups
setopt share_history
setopt hist_no_store
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt extended_history
setopt HIST_IGNORE_SPACE

export HISTSIZE=100000
export HISTCONTROL=erasedups
export HISTIGNORE="fg*:bg*:history*:cd*"
export PROMPT_COMMAND="history -a"
export HISTFILE=${HOME}/.zsh_history
export SAVEHIST=100000


