#!/bin/sh

set -e

CONFIG=$(readlink -f $(dirname $0)/..)
PROGRAM=".offlineimaprc"
rm -rf ~/$PROGRAM
ln -s $CONFIG/$PROGRAM ~/$PROGRAM
