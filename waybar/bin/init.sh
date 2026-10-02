#!/bin/sh

set -e

PROJECT_PATH=$(dirname $0)
CONFIG=$(readlink -f ${PROJECT_PATH}/..)
mkdir ~/.config 2>/dev/null || true
ln -sfn ${CONFIG} ~/.config/waybar
