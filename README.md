
# dotfiles

- my dotfiles

!!! i do not try these scripts, so not try except me !!!

## Install Memo

1. 一応ssh関係のデータを物理的(USB等)に保存
2. brewdlerでdump

```
brew brewdle dump
```

3. 別に保存した新しいOSからクリーンインストール
4. TimeMachineでデータを戻す(ユーザは別名にしておく)
   - もしterminalが開かなくなったらユーザーグループでシェル変更
5. sshの設定を戻しておく
6. TimeMachineからDocument, Musicなどを戻す
7. Apple store関係をインストール
   - Xcode
   - OneDrive
   - 夜フクロウ
8. 設定ファイルのリンクを貼っておく (./scripts/link_files.sh)
9. brew関係インストール (./script/brew_startup.sh)
10. zshの設定  (./script/zsh_startup.sh)
11. anyenvの設定  (./script/anyenv_startup.sh)
12. emacsの設定 (./script/emacs_startup.sh)

## TODO

- deploy command
- check these scripts
- change how to fetch helm-filelist's code
