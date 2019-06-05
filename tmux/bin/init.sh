#!/bin/sh

set -e

CONFIG=$(readlink -f $(dirname $0)/..)
PROGRAM="tmux.conf"
LINKTO=".tmux.conf"
cd ~
rm -rf $LINKTO
ln -s $CONFIG/$PROGRAM $LINKTO
