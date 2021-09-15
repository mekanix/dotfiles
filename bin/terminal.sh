#!/bin/sh

if [ "${USE_ALACRITTY}" = "yes" ]; then
  exec alacritty $@
else
  exec uxterm $@
fi
