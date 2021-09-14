#!/bin/sh

set -e

CONFIG=$(readlink -f $(dirname $0)/..)/zshrc
PROGRAM="zsh"
rm -rf ~/.${PROGRAM}rc
ln -s $CONFIG ~/.${PROGRAM}rc
