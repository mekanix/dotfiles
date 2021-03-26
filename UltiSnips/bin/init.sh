#!/bin/sh

set -e

CONFIG=$(readlink -f $(dirname $0)/..)
PROGRAM=".vim/UltiSnips"
if [ ! -e ~/.vim ]; then
  mkdir ~/.vim
fi
cd ~/.vim
ln -s $CONFIG
