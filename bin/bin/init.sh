#!/bin/sh

set -e

CONFIG=$(readlink -f $(dirname $0)/..)
PROGRAM="bin"
cd ~
rm -rf $PROGRAM
ln -s $CONFIG $PROGRAM
