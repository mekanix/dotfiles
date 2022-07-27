#!/bin/sh

sleep 10
keepassxc &
quiterss &
syncthing &
alacritty --class weechat -e ~/bin/weechat.sh &
dino &
~/bin/mail.sh
