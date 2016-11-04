# -*- mode: sh -*-

autoload -Uz anyframe-init
anyframe-init


bindkey '^xb' anyframe-widget-cdr
bindkey '^x^b' anyframe-widget-checkout-git-branch

# cdrの設定
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 1500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

anyframe-widget-insert-history () {
    anyframe-source-history \
        | anyframe-selector-auto "$LBUFFER" \
        | anyframe-action-insert
}
autoload -Uz -- anyframe-widget-insert-history
zle -N -- anyframe-widget-insert-history

# bindkey '^r' anyframe-widget-execute-history
# bindkey '^x^r' anyframe-widget-execute-history

bindkey '^r' anyframe-widget-insert-history
bindkey '^x^r' anyframe-widget-insert-history

bindkey '^xi' anyframe-widget-put-history
bindkey '^x^i' anyframe-widget-put-history

bindkey '^xg' anyframe-widget-cd-ghq-repository
bindkey '^x^g' anyframe-widget-cd-ghq-repository

bindkey '^xk' anyframe-widget-kill
bindkey '^x^k' anyframe-widget-kill

bindkey '^xe' anyframe-widget-insert-git-branch
bindkey '^x^e' anyframe-widget-insert-git-branch
