#!/bin/sh

NOW_DIR=$(pwd)

while read LINE
do
    org=$(echo "$LINE" | cut -f 1)
    target=$(echo "$LINE" | cut -f 2)
    ln -sfn "$NOW_DIR/$org" "$target"
done<link.txt

while read LINE
do
    org=$(echo "$LINE" | cut -f 1)
    target=$(echo "$LINE" | cut -f 2)
    echo /bin/rm -rf "$target"
    ln -sfn "$NOW_DIR/$org" "$target"
done<link_dir.txt








