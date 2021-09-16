#!/bin/sh

REPO_ROOT="$(readlink -f $(dirname $0))"

cd "${REPO_ROOT}"

for config_dir in bin dunst fish git gtkrc i3 i3status ladish mpd mpv mutt task tmux vim weechat xconfig UltiSnips; do
    ${config_dir}/bin/init.sh || true
done
