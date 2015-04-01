#!/bin/sh

PROGNAME=$(basename $0)

usage_exit() {
    echo "Usage: ${PROGNAME}" 1>&2
    echo "  homebrew cask small script"
    exit 1
}

while getopts h OPT
do
    case $OPT in
        h)  usage_exit
            ;;
        \?) usage_exit
            ;;
    esac
done
shift $((OPTIND - 1))

if [ ! -n "$1" ]; then
    usage_exit
fi

brew_file=$1

while read LINE
do
    echo "$LINE" | grep '#' >/dev/null
    A=$?
    if [ $A -eq 0 ]; then
        continue
    fi
    if [ ! -z "$LINE" ]; then
        brew $LINE
    fi
done<$brew_file
