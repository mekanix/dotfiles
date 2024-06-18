#!/bin/sh

set -e

PROJECT_PATH=`dirname $0`
CONFIG=`readlink -f $PROJECT_PATH/..`
LV_BRANCH='release-1.4/neovim-0.9'

trap "rm -f /tmp/lunarvim.sh" HUP INT ABRT BUS TERM EXIT

fetch -o /tmp/lunarvim.sh https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh
bash /tmp/lunarvim.sh -y
cp "${PROJECT_PATH}/config.lua" ~/.config/lvim
git clone https://github.com/freenit-framework/snippets ~/.config/lvim/snippets
