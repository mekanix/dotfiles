#!/bin/sh

YELLOW=30
RED=10
BATTERY=$(acpiconf -i 0 | grep '^Remaining capacity' | awk '{print $3}' | sed 's/%//')

echo "${BATTERY}%"
echo "${BATTERY}%"

if [ "${BATTERY}" -le "${RED}" ]; then
  echo "#FF0000"
elif [ "${BATTERY}" -le "${YELLOW}" ]; then
  echo "#FFAA00"
fi
