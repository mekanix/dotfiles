#!/bin/sh

VIM_ROOT_DIR="$(readlink -f $(dirname $0)/..)"

fetch https://spacevim.org/install.sh -o /tmp/spacevim-install.sh
chmod +x /tmp/spacevim-install.sh
/tmp/spacevim-install.sh
rm /tmp/spacevim-install.sh

cd
rm -rf .SpaceVim.d
ln -sf "${VIM_ROOT_DIR}" .SpaceVim.d
