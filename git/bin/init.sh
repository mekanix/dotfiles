#!/bin/sh

set -e

PROJECT_PATH=`dirname $0`
CONFIG=`readlink -f $PROJECT_PATH/..`
PROGRAM=".gitconfig"
cd
rm -rf $PROGRAM
ln -s $CONFIG/$PROGRAM $PROGRAM
