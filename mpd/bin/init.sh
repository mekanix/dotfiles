#!/bin/bash

ROOT_DIR="$(readlink -f $(dirname $0)/..)"

rm -rf ~/.mpd ~/.mpdconf
ln -s "${ROOT_DIR}/mpd" ~/.mpd
ln -s "${ROOT_DIR}/mpdconf" ~/.mpdconf
