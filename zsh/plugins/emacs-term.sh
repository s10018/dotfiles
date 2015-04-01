#!/bin/sh

function cde () {
    EMACS_CWD=`emacsclient -e "
      (if (featurep 'elscreen)
          (elscreen-current-directory)
        (non-elscreen-current-directory))" 2>/dev/null | sed 's/^"\(.*\)"$/\1/'`

    echo "chdir to $EMACS_CWD"
    cd "$EMACS_CWD"
}

# host=`hostname`
# echo -ne "\e]51;host;$host\e\\" > /dev/tty
# user=`id -run`
# echo -ne "\e]51;user;$user\e\\" > /dev/tty

# function precmd_eterm_cwd () {
#     local dir; dir=`pwd`
#     echo -ne "\e]51;cd;$dir\e\\" > /dev/tty
# }
# typeset -Uga precmd_functions
# precmd_functions+=precmd_eterm_cwd

# function switch-to-line-mode-insert () {
#     local buf="$BUFFER"
#     zle kill-buffer
#     zle -R
#     echo -ne "\e]51;mode;sh-mode\e\\" > /dev/tty
#     echo -ne "\e]52;i;$buf\e\\" > /dev/tty
# }
# zle -N switch-to-line-mode-insert
# bindkey '^[i' switch-to-line-mode-insert
