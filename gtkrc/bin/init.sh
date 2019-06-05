#!/bin/bash

set -e

CONFIG=$(readlink -f $(dirname $0)/..)
mkdir ~/.themes 2>/dev/null || true
cd ~/.themes
rm -rf aud-Default
ln -s $CONFIG/aud-Default
cd ~
rm -f .gtkrc-2.0
ln -s $CONFIG/gtkrc-2.0 .gtkrc-2.0
