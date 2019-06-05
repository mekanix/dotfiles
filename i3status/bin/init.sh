#!/bin/sh

set -e

CONFIG=$(readlink -f $(dirname $0)/..)
PROGRAM="i3status"
mkdir ~/.config 2>/dev/null || true
cd ~/.config
rm -rf $PROGRAM
ln -s $CONFIG $PROGRAM
cd i3status
ln -s config.$(hostname -s) config
