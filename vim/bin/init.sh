#!/bin/sh

VIM_ROOT_DIR="$(readlink -f $(dirname $0)/..)"

fetch https://spacevim.org/install.sh -o /tmp/install.sh
chmod +x /tmp/install.sh
/tmp/install.sh
cd
rm -rf .SpaceVim.d
ln -s "${VIM_ROOT_DIR}" .SpaceVim.d
