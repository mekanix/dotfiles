#!/bin/sh

set -e

PROJECT_PATH=$(dirname $0)
CONFIG=$(readlink -f ${PROJECT_PATH}/..)
ln -s ${CONFIG} ~/.config/i3blocks
