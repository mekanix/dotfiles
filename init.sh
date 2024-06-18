#!/bin/sh

REPO_ROOT="$(readlink -f $(dirname $0))"

cd "${REPO_ROOT}"

for config_dir in bin fish git gtkrc i3 i3blocks mpv tmux vim xconfig; do
    ${config_dir}/bin/init.sh || true
done
