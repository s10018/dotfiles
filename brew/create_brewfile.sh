#!/bin/sh

RM=/bin/rm

$RM -rf brewfile

{
    echo
    echo "# brew tap"
    brew tap | xargs -n 1 echo tap
    echo
    echo "# brew"
    brew list | xargs -n 1 echo install
    echo
    echo "# brew cask"
    brew cask list | xargs -n 1 echo cask install
} >> brewfile
