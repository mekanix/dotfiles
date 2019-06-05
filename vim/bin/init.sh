#!/bin/sh

VIM_ROOT_DIR="$(readlink -f $(dirname $0)/..)"

cd
rm -rf .spacevim
ln -s "${VIM_ROOT_DIR}/spacevim" ~/.spacevim
git clone https://github.com/liuchengxu/space-vim .space-vim
cd .space-vim
make neovim
