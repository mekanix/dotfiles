#!/bin/sh

dunst &

sleep 3

gajim &
keepassxc &
signal-desktop &
thunderbird &
#(discord --no-sandbox & sleep 5 && swaymsg '[class="discord"] kill') &
(viber & sleep 5 && swaymsg '[app_id="viber"] kill') &
(liferea & sleep 5 && swaymsg '[app_id="net.sourceforge.liferea"] kill') &
