# -*- mode: sh -*-

function cde () {
    EMACS_CWD=`emacsclient -e "
      (if (featurep 'elscreen)
          (elscreen-current-directory)
        (non-elscreen-current-directory))" 2>/dev/null | sed 's/^"\(.*\)"$/\1/'`

    echo "chdir to $EMACS_CWD"
    cd "$EMACS_CWD"
}

function dired () {
  emacsclient -e "(dired \"${1:a}\")" 1>/dev/null 2>/dev/null
}


