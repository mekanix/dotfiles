#!/bin/sh

REPO_ROOT="$(readlink -f $(dirname $0))"

cd "${REPO_ROOT}"

for config_dir in alacritty bin fish git gtkrc i3 i3blocks jack mpv npm tmux vim xdg; do
    ${config_dir}/bin/init.sh || true
done
