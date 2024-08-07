#!/bin/sh

RED=$(sysctl -n hw.ncpu)
YELLOW=$(echo "${RED} - 4" | bc)
LOAD=$(top -d 1 | grep '^last pid' | cut -f 3 -d ':' | cut -f 1 -d ',' | awk '{print $1}')
WHOLELOAD=$(echo "${LOAD}" | cut -f 1 -d '.')

echo "${LOAD}"
echo "${LOAD}"

if [ "${WHOLELOAD}" -ge "${RED}" ]; then
  echo "#FF0000"
elif [ "${WHOLELOAD}" -ge "${YELLOW}" ]; then
  echo "#FFAA00"
fi
