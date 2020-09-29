#!/bin/sh

set -e

CONFIG=$(readlink -f $(dirname $0)/..)
PROGRAM="nvim/UltiSnips"
cd ~/.config
rm -rf $PROGRAM
ln -s $CONFIG $PROGRAM
