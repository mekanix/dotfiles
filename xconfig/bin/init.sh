#!/bin/sh

ROOT_DIR="$(readlink -f $(dirname $0)/..)"

rm -rf ~/.xmodmap ~/.xinitrc ~/.Xdefaults
ln -s "${ROOT_DIR}/xmodmap" ~/.xmodmap
ln -s "${ROOT_DIR}/xinitrc" ~/.xinitrc
ln -s "${ROOT_DIR}/Xdefaults" ~/.Xdefaults
