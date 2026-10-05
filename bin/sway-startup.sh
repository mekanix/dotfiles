#!/bin/sh

dunst &

sleep 3

gajim &
keepassxc &
signal-desktop &
thunderbird &
(discord && sleep 5 && swaymsg '[app_id="discord"] kill') &
(viber & sleep 5 && swaymsg '[app_id="viber"] kill') &
(slack & sleep 5 && swaymsg '[app_id="slack"] kill') &
