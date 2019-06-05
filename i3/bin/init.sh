#!/bin/sh

set -e

CONFIG=$(readlink -f $(dirname $0)/..)
PROGRAM="i3"
mkdir ~/.config 2>/dev/null || true
cd ~/.config
rm -rf $PROGRAM
ln -s $CONFIG $PROGRAM
