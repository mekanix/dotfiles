#!/bin/sh

VIM_ROOT_DIR="$(readlink -f $(dirname $0)/..)"

fetch https://spacevim.org/install.sh -o /tmp/install.sh
chmod +x /tmp/install.sh
/tmp/install.sh
cd
ln -sf "${VIM_ROOT_DIR}/init.toml" .SpaceVim.d/init.toml
ln -sf "${VIM_ROOT_DIR}/UltiSnips" .SpaceVim.d/UltiSnips
ln -sf "${VIM_ROOT_DIR}/vimrc" .vimrc
