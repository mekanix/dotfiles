#!/bin/sh

set -e

CONFIG=$(readlink -f $(dirname $0)/..)
PROGRAM=".mutt"
cd ~
rm -rf $PROGRAM .mailcap
ln -s $CONFIG $PROGRAM
ln -s $CONFIG/.mailcap
