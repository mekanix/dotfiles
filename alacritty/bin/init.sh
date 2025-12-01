#!/bin/sh

set -e

CONFIG=$(readlink -f $(dirname $0)/..)
PROGRAM="alacritty"
mkdir ~/.config 2>/dev/null || true
cd ~/.config
rm -rf $PROGRAM
ln -s $CONFIG $PROGRAM
cd $PROGRAM
HOST=$(hostname -s)
ln -s alacritty-${HOST}.toml alacritty.toml
