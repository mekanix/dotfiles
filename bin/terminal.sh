#!/bin/sh

if [ "${USE_ALACRITTY}" = "YES" ]; then
  exec alacritty $@
else
  exec uxterm $@
fi
