#!/bin/bash
ESC=$(printf '\033')

dirpath=$(cd $(dirname ${0}); pwd)
export PATH=$PATH:"$dirpath/git-shell"
cp --backup=t ~/.bashrc ./.bashrc-backup/
sed -ni '/# v shellscript-path v/,/# ^ shellscript-path ^/!p' ~/.bashrc #書き込み済のpathを削除
echo "
# v shellscript-path v
export PATH=\$PATH:$dirpath/git-shell
# ^ shellscript-path ^
" >> ~/.bashrc
printf "${ESC}[1;35mshellを再起動してください${ESC}[m\n"
