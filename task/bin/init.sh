#!/bin/sh

set -e

CONFIG=$(readlink -f $(dirname $0)/..)
PROGRAM=".taskrc"
rm -rf ~/$PROGRAM
ln -s $CONFIG/$PROGRAM ~/$PROGRAM
