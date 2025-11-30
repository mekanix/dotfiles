#!/bin/sh

set -e

CONFIG=$(readlink -f $(dirname $0)/..)
mkdir ~/.themes 2>/dev/null || true
cd ~/.themes
rm -rf aud-Default
ln -s $CONFIG/aud-Default
cd ~
rm -f .gtkrc-2.0
ln -s $CONFIG/gtkrc-2.0 .gtkrc-2.0
mkdir -p ~/.config/gtk-3.0 ~/.config/gtk-4.0
echo -e "[Settings]\ngtk-application-prefer-dark-theme=1" >~/.config/gtk-3.0/settings.ini
echo -e "[Settings]\ngtk-application-prefer-dark-theme=1" >~/.config/gtk-4.0/settings.ini
