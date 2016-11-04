#!/bin/sh

TARGET="../local/etc/zsh/tmux.sh"
tmp_file=$(mktemp)
tmp_file2=$(mktemp)

wget http://qiita.com/b4b4r07/items/01359e8a3066d1c37edc.md -O "$tmp_file"

tail -n 92 "$tmp_file" | head -n 61 >| "$tmp_file2"
cat - "$tmp_file2" <<EOF > "$TARGET"

# copyed below from http://qiita.com/b4b4r07/items/01359e8a3066d1c37edc

EOF
