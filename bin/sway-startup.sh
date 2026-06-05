#!/bin/sh

dunst &

sleep 3

gajim &
keepassxc &
signal-desktop &
thunderbird &
(viber & sleep 5 && swaymsg '[app_id="viber"] kill') &
(liferea & sleep 5 && swaymsg '[app_id="net.sourceforge.liferea"] kill') &
